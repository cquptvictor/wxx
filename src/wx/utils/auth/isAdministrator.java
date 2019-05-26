package wx.utils.auth;

import org.apache.commons.dbutils.QueryRunner;
import wx.utils.JdbcUtils;
import wx.utils.ResultNumHandler;

import java.sql.SQLException;
/*
验证该用户是否为管理员*/
public class isAdministrator {
    public static Boolean auth(String openId,String tid){
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select isAdministrator from team_member where tid = ? and uid = ?";
        try {
            if(queryRunner.query(sql,new ResultNumHandler(),new Object[]{openId,tid}) != null)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }
}
