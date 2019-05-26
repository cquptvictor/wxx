package wx.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import wx.domain.Information;
import wx.domain.Team;
import wx.domain.TeamBill;
import wx.domain.TeamMember;
import wx.utils.JdbcUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class TeamDao {
    /*创建失败则回滚*/
    public Boolean createTeam(Object[] params,Object[] params2){
        QueryRunner query= new QueryRunner();
        try(Connection connection = JdbcUtils.getConnection()){
            connection.setAutoCommit(false);
            //插入到团队表
            String sql = "insert into team(tid,openId,tname) values(?,?,?)";
            //插入到团队成员表，创建者默认为管理员
            String sql2 = "insert into team_member(tid,openId,tMemberName,teamName,uid,isAdministrator)values(?,?,?,?,?,1)";
            //插入到最后访问时间表
            String sql3 = "insert into last_read_record(openId,tid,lastReadTime)values(?,?,NOW())";
            try{
                query.update(connection,sql,params);
                query.update(connection,sql2,params2);
                query.update(connection,sql3,params2);
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
        List<Team> list = null;
        try {
             list = queryRunner.query(sql,new BeanListHandler<>(Team.class),params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<TeamBill> getTeamBill(Object[] params,Object[] params2){
        QueryRunner queryRunner = new QueryRunner();
        List<TeamBill> list = null;
        //多个sql应该加事务
        try(Connection connection = JdbcUtils.getConnection()){
            String sql = "select id as bid,openId as uid,name as nickName, amount, label, remarks，openId = ? as isSelf from team_bill where teamId = ? limit ?,10";
            String sql2 = "update last_read_record set lastReadTime = NOW() where openId = ? and tid = ?";
            connection.setAutoCommit(false);
            try {
                list = queryRunner.query(sql,new BeanListHandler<>(TeamBill.class),params);
                queryRunner.update(sql2,params2);//更新对这个团队账单的最后一次访问时间
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
        String sql = "delete from team_bill where tid = ? and bid = ?";
        try {
            if(queryRunner.update(sql,params) == 1)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean addTeamBill(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into team_bill(openId,name,teamId,amount,label,remarks,type,time)values(?,?,?,?,?,?,?,?)";
        try {
            queryRunner.update(sql,params);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean addNewMember(Object[] params,Object[] params2){
        QueryRunner queryRunner = new QueryRunner();
        String sql = "insert into team_member(openId,tid,uid,tMemberName)values(?,?,?,?)";
        String sql2 = "insert into last_read_record(openId,tid,lastReadTime)values(?,?,NOW())";
        try(Connection connection = JdbcUtils.getConnection()) {
            try {
                connection.setAutoCommit(false);
                queryRunner.update(sql, params);
                queryRunner.update(sql, params2);
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

    public Boolean leaveTeam(Object[] params)
    {
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "delete * from team_member where tid = ? and openId = ?";
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
        String sql = "delete * from team_member where tid = ? and openId = ? and uid = ?";
        try {
            queryRunner.update(sql);
            return true;
         } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean editTeamBill(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "update teamBill set tid = ?,bid = ?, nickName = ?, amount = ?, label = ?, remarks";
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
        String sql = "select message from teamLogs where tid = ? order by time limit ?,10 ";
        List list = null;
        try {
            list =  queryRunner.query(sql,new BeanListHandler<>(Information.class),params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
