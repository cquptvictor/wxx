package wx.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import wx.domain.team.Team;
import wx.domain.team.TeamBill;
import wx.domain.team.TeamMember;
import wx.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class TeamDao {
    /*创建失败则回滚*/
    public Boolean createTeam(Object[] params,Object[] params2,Object[] params3){
        QueryRunner query= new QueryRunner();
        try(Connection connection = JdbcUtils.getConnection()){
            connection.setAutoCommit(false);
            //插入到团队表
            String sql = "insert into team(tid,openId,tname) values(?,?,?)";
            //插入到团队成员表，创建者默认为管理员
            String sql2 = "insert into team_member(tid,openId,tMemberName,teamName,uid,isAdministrator)values(?,?,?,?,?,1)";
            //插入到最后访问时间表
            String sql3 = "insert into last_read_record(openId,tid)values(?,?)";
            try{
                query.update(connection,sql,params);
                query.update(connection,sql2,params2);
                query.update(connection,sql3,params3);
                connection.commit();
                connection.setAutoCommit(true);
                return true;
            }catch (SQLException e){
                e.printStackTrace();
                connection.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Team> getTeam(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select tid,teamName as name,isAdministrator from team_member where openId = ?  limit ?,10";
        try {
             return queryRunner.query(sql,new BeanListHandler<>(Team.class),params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<TeamBill> getTeamBill(Object[] params,Object[] params2){
        QueryRunner queryRunner = new QueryRunner();
        List<TeamBill> list = null;
        //多个sql应该加事务
        try(Connection connection = JdbcUtils.getConnection()){
            //获取账单数据
            String sql = "select id as bid,openId as uid,name as nickName, amount, label, remarks,openId = ? as isSelf,type,time from team_bill where tid = ? limit ?,10";
            //更新最近访问时间
            String sql2 = "update last_read_record set lastReadTime = now() where openId = ? and tid = ?";
            connection.setAutoCommit(false);
            try {
                list = queryRunner.query(connection,sql,new BeanListHandler<>(TeamBill.class),params);
                queryRunner.update(connection,sql2,params2);//更新对这个团队账单的最后一次访问时间
                connection.commit();
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
                connection.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<TeamMember> getTeamMember(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        //获取成员数据
        String sql = "select uid,tMemberName as nickName,isAdministrator from team_member where tid = ? limit ?,10";
        try {
            return queryRunner.query(sql,new BeanListHandler<>(TeamMember.class),params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Boolean delTeamBill(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        //删除指定数据
        String sql = "delete from team_bill where tid = ? and id = ?";
        try {
            if(queryRunner.update(sql,params) == 1)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String addTeamBill(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into team_bill(openId,name,tid,amount,label,remarks,type,time)values(?,?,?,?,?,?,?,?)";
        //返回最新的主键自增生成的id（bigInteger）,不会被其他线程影响，连续插入以第一个的id为准
        String sql2 = "select LAST_INSERT_ID()";
        try {
            queryRunner.update(sql,params);
            String id =String.valueOf(queryRunner.query(sql2,new ArrayHandler())[0]);
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Boolean addNewMember(Object[] params,Object[] params2){
        QueryRunner queryRunner = new QueryRunner();
        //数据库中添加相应新成员
        String sql = "insert into team_member(openId,tid,uid,tMemberName,teamName)values(?,?,?,?,?)";
        //插入一条新消息到最后访问时间表中
        String sql2 = "insert into last_read_record(openId,tid)values(?,?)";
        try(Connection connection = JdbcUtils.getConnection()) {
            try {
                connection.setAutoCommit(false);
                queryRunner.update(connection,sql, params);
                queryRunner.update(connection,sql2, params2);
                connection.commit();
                connection.setAutoCommit(true);
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
                connection.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean findMember(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select id  from team_member where tid = ? and openId = ?";
        try {
            //?????
            if(queryRunner.query(sql,new ArrayHandler(),params) != null)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean leaveTeam(Object[] params)
    {
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "delete  from team_member where tid = ? and openId = ?";
        try {
            queryRunner.update(sql,params);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean kickOut(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "delete from team_member where tid = ? and openId = ? and uid = ?";
        try {
            queryRunner.update(sql,params);
            return true;
         } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean editTeamBill(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "update team_bill set  name = ?, amount = ?, label = ?, remarks=? where id = ? and tid = ?";
        try {
            if(queryRunner.update(sql,params) != 0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  false;
    }

    public List getInfo(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        //时间从现在到过去，应该是降序
        String sql = "select information from team_logs where tid = ? order by time DESC limit ?,10 ";
        try {
            return queryRunner.query(sql,new ArrayListHandler(),params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Boolean dismissTeam(String tid){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "delete team,team_member,team_bill from team,team_member,team_bill where team.tid = ? and team.tid = team_member.tid and team.tid = team_bill.tid";
        try {
            if((queryRunner.update(sql,tid)) != 0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
