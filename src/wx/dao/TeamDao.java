package wx.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import wx.domain.Team;
import wx.domain.TeamBill;
import wx.domain.TeamMember;
import wx.utils.JdbcUtils;

import java.io.BufferedOutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class TeamDao {
    /*创建失败则回滚*/
    public Boolean createTeam(Object[] params){
        QueryRunner query= new QueryRunner();
        try(Connection connection = JdbcUtils.getConnection()){
            connection.setAutoCommit(false);
            String sql = "insert into team(tid,openId,tname) values(?,?,?)";
            String sql2 = "insert into teamMember(tid,tMember,tname,isAdministrator)values(?,?,?,1)";
            try{
                query.update(connection,sql,params);
                query.update(connection,sql2,params);
                return true;
            }catch (SQLException e){
                connection.rollback();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Team> getTeam(String openId){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select tid,tname as name,isAdministrator from teamMember where openId = ?";
        List<Team> list = null;
        try {
             list = queryRunner.query(sql,new BeanListHandler<>(Team.class),openId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<TeamBill> getTeamBill(Object[] params,String openId){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select id as bid,openId as uid,name as nickName, amount, label, remarks from teamBill where teamId = ? limit ?,10";
        String sql2 = "update LastReadRecord set lastReadTime = NOW() where openId = ? and tid = ?";
        List<TeamBill> list = null;
        try {
            list = queryRunner.query(sql,new BeanListHandler<>(TeamBill.class),params);
            queryRunner.update(sql,new Object[]{openId,params[0]});//更新对这个团队账单的最后一次访问时间
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<TeamMember> getTeamMember(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select uid,tMemberName as nickName,isAdministrator from teamMember where tid = ? limit ?,10";
        List<TeamMember> list = null;
        try {
            list = queryRunner.query(sql,params,new BeanListHandler<>(TeamMember.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Boolean delTeamBill(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "delete from teamBill where tid = ? and bid = ?";
        try {
            if(queryRunner.update(sql,params) == 1)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  false;
    }

    public Boolean addTeamBill(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into teamBill(openId,name,teamId,amount,label,remarks,type,time)values(?,?,?,?,?,?,?,?)";
        try {
            queryRunner.update(sql,params);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean addNewMember(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "insert into teamMember(openId,tid,uid,tMemberName)values(?,?,?,?)";
        try {
            queryRunner.update(sql,params);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean leaveTeam(Object[] params)
    {
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "delete * from teamMember where tid = ? and openId = ?";
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
        String sql = "delete * from teamMember where tid = ? and openId = ? and uid = ?";
        try {
            queryRunner.update(sql);
            return true;
         } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
