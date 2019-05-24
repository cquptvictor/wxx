package wx.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import wx.domain.Team;
import wx.domain.TeamBill;
import wx.utils.JdbcUtils;

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
    public List<TeamBill> getTeamBill(Object[] params){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select id as bid,openId as uid,name as nickName, amount, label, remarks from teamBill where teamId = ? limit ?,10";
        List<TeamBill> list = null;
        try {
            list = queryRunner.query(sql,new BeanListHandler<>(TeamBill.class),params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}