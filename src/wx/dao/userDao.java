package wx.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import wx.domain.personal.Bill;
import wx.domain.personal.Graph;
import wx.domain.personal.Label;
import wx.domain.personal.userInfo;
import wx.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class userDao {

    public String[] findUser(String openId) throws SQLException {
        QueryRunner query = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select signIn from user where openId = ?";
        Object[] value = query.query(sql, new ArrayHandler(), new Object[]{openId});
        if (value != null) {
            return new String[]{openId,String.valueOf(value[0])};
        } else
            return null;
    }

    public Boolean addUser(String openid, String uuid) throws SQLException {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into user(uuid,openid)values(?,?)";

        if (runner.update(sql, new Object[]{uuid, openid}) == 1)
            return true;
        else
            return false;
    }
        //获取用户打卡天数和记账笔数
    public userInfo getUserInfo(String openId) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select signInDays,count(*) as totalAccount from user,bill where bill.openId = user.openId and user.openId = ?";
        userInfo info = null;
        try {
            info =(userInfo) runner.query(sql, new BeanHandler(userInfo.class),openId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return info;
    }


    public Boolean signIn(String openId){
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "update user set signInDays = signInDays+1,signIn = \"true\" where openId = ? and signIn =\"false\"";

        try {
            if(runner.update(sql,openId) == 1)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public Boolean addBill(Object[] params) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into bill(openId,amount,label,remarks,time,type) values(?,?,?,?,?,?)";
        int num = 0;
        try {
            num = runner.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (num != 0)
            return true;
        else
            return false;
    }

    public Boolean editBill(Object[] params) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        //收入
        String sql = "update bill set amount = ?, label = ?, remarks = ?, type = ?,time = ? where id = ? ";
        try {
            if (runner.update(sql, params) != 0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean delBill(int bid) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "delete from bill where id = ?";
        try {
            if (runner.update(sql, bid) != 0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Bill> getBill(String openId, String time, int type) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql;
        String[] strings = time.split("-");
        Object[] params;
        if (type == 1)//日账
        {
            sql = "select bill.id as bid,bill.label,amount,time,type,remarks,label.label_name as iconName from bill LEFT OUTER JOIN label on label.label = bill.label where YEAR(time)=? and MONTH(time) = ? and DAY(time)= ? and bill.openId=? ORDER BY time";
            params = new Object[]{strings[0], strings[1], strings[2], openId};
        } else {//月账只需要金额，类型，时间
            sql = "select bill.label,SUM(amount) as amount,DATE_FORMAT(time,\"%Y-%m-%d\") as time,type from bill where  YEAR(time) = ? and MONTH(time) = ? and bill.openId = ? group by DATE(time),type ORDER BY DATE(time)";
                params = new Object[]{strings[0], strings[1], openId};

        }
        try {
            return runner.query(sql, new BeanListHandler<Bill>(Bill.class), params);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    /*
    重载的方式实现周和年月的区分
     */

    public Map linerGraphDao(String category, Object[] params, String label) {
        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
        String sql1 = null;//收入
        String sql2 = null;//支出
        //分为带标签和不带标签, //参数 beginTime,limits,openId
        if(label.equals("false")) {
            if (category.equals("year")) {
                sql1 = "select t3.amount,t1.time from\n" +
                        //创建时间的虚表t1
                        "(SELECT @cdate := date_add(@cdate,interval 1 MONTH) as time from \n" +
                        "(SELECT @cdate := ? from bill limit ?) as t2)t1\n" +

                        "LEFT JOIN\n" +
                        //创建数据表t3
                        "(select IFNULL(SUM(amount),0) as amount,DATE_FORMAT(time,\"%Y-%m\") as time\n" +
                        //数据按照年月分组,并按照时间排序
                        " from bill where openId = ? and type = 1 GROUP BY YEAR(time),MONTH(time))t3 on DATE_FORMAT(t1.time,\"%Y-%m\") = t3.time ORDER BY time;\n";
                //参数 beginTime,limits,openId
                sql2 = "select t3.amount,t1.time from\n" +
                        //创建时间的虚表t1
                        "(SELECT @cdate := date_add(@cdate,interval 1 MONTH) as time from \n" +
                        "(SELECT @cdate := ? from bill limit ?) as t2)t1\n" +

                        "LEFT JOIN\n" +
                        //创建数据表t3
                        "(select IFNULL(SUM(amount),0) as amount,DATE_FORMAT(time,\"%Y-%m\") as time\n" +
                        //数据按照年月分组,并按照时间排序
                        " from bill where openId = ? and type = 0 GROUP BY YEAR(time),MONTH(time))t3 on DATE_FORMAT(t1.time,\"%Y-%m\") = t3.time ORDER BY time;\n";
                //参数 beginTime,limits,openId
            } else {
                sql1 = "select t1.t as time, IFNULL(amount,0) as amount from \n" +
                        //生成时间表
                        "(SELECT @cdate := date_add(@cdate,interval 1 DAY) as t from \n" +
                        "(SELECT @cdate := ? from bill limit ?) as t2) as t1\n" +

                        " LEFT OUTER JOIN \n" +
                        //数据表
                        "( select IFNULL(SUM(amount),0) as amount,DATE(time) as t\n" +
                        " from bill  where openId =? and type = 1 GROUP BY DATE(time))t3 on t3.t = t1.t ORDER BY time";

                sql2 = "select t1.t as time, IFNULL(amount,0) as amount from \n" +
                        //生成时间表
                        "(SELECT @cdate := date_add(@cdate,interval 1 DAY) as t from \n" +
                        "(SELECT @cdate := ? from bill limit ?) as t2) as t1\n" +

                        " LEFT OUTER JOIN \n" +
                        //数据表
                        "( select IFNULL(SUM(amount),0) as amount,DATE(time) as t\n" +
                        " from bill  where openId =? and type = 0 GROUP BY DATE(time))t3 on t3.t = t1.t ORDER BY time";
            }
        }else {
            if (category.equals("year")) {
                sql1 = "select label, SUM(amount) as amount from bill where type = 1 and YEAR(time) = ? and openId = ? group by label ORDER BY amount desc limit 5";
                sql2 = "select label, SUM(amount) as amount from bill where type = 0 and YEAR(time) = ? and openId = ? group by label ORDER BY amount desc limit 5";

            } else if (category.equals("month")) {
                sql1 = "select label, SUM(amount) as amount from bill where type = 1 and DATE_FORMAT(time,\"%Y-%m\") = DATE_FORMAT(?,\"%Y-%m\") and openId = ? group by label ORDER BY amount desc limit 5";
                sql2 = "select label, SUM(amount) as amount from bill where type = 0 and DATE_FORMAT(time,\"%Y-%m\") = DATE_FORMAT(?,\"%Y-%m\")  and openId = ? group by label ORDER BY amount desc limit 5";
            } else {
                sql1 = "select label, SUM(amount) as amount from bill where type = 1 and DATE(time) > ? and DATE(time) < ? and openId = ? group by label ORDER BY amount desc limit 5";
                sql2 = "select label, SUM(amount) as amount from bill where type = 0 and DATE(time) > ? and DATE(time) < ? and openId = ? group by label ORDER BY amount desc limit 5";
            }
        }
            List<Graph> income = null;
            List<Graph> outcome = null;
            try {
                income = runner.query(sql1, new BeanListHandler<>(Graph.class), params);
                outcome = runner.query(sql2, new BeanListHandler<>(Graph.class), params);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            Map map = new HashMap();
            map.put("income", income);
            map.put("outcome", outcome);
            return map;
        }

        public Boolean operateIcon(Object[] params,String operate){
            String sql = null;
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
           if(operate.equalsIgnoreCase("set")) {
               sql = "insert into label(openId,label,label_name)values(?,?,?)";
               try {
                   if(queryRunner.update(sql,params) == 1)
                       return true;
               } catch (SQLException e) {
                   e.printStackTrace();
               }
           } else {

               try( Connection connection = JdbcUtils.getConnection();) {
                   connection.setAutoCommit(false);
                   sql = "delete from label where openId = ? and label = ?";
                   String sql2 ="update bill set label=SUBSTRING_INDEX(label,\"-\",2) where label = ?";
                   try{
                   queryRunner.update(connection,sql,params);
                   queryRunner.update(connection,sql2,params[0]);
                   connection.commit();
                   connection.setAutoCommit(true);
                   return true;}catch (SQLException e){
                       connection.rollback();
                       System.out.println("事务回滚");
                       e.printStackTrace();
                   }
            } catch (SQLException e) {

                   e.printStackTrace();
               }

            }

            return false;
        }

        public List<Label> getIcon(String openId){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select label, label_name as name  from label where openId = ?";

        List<Label> list = null;
            try {
                list = queryRunner.query(sql,new BeanListHandler<>(Label.class),openId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return list;
        }

        //徽章处理
    public Map getBadge(String openId){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql2 = "select achievement from achievements where openId = ? and type = ? ORDER BY id desc limit 1";
        Object[] bill = null;
        Object[] days = null;
        try {
            bill = queryRunner.query(sql2,new ArrayHandler(),new Object[]{openId,"bill"});
            days = queryRunner.query(sql2,new ArrayHandler(),new Object[]{openId,"day"});

        } catch (SQLException e) {
            e.printStackTrace();
        }
        Map map = new HashMap();
        Object b = (bill == null)? "":bill[0];
        Object d = (days == null)? "":days[0];
        map.put("bill",b);
        map.put("day",d);
        return map;
    }
    public Boolean addBadge(Object[] params)
    {
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into achievements(openId,achievement,type)values(?,?,?)";
        try {
            queryRunner.update(sql,params);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }
    }

