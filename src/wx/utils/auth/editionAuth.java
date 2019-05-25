package wx.utils.auth;

import org.apache.commons.dbutils.QueryRunner;
import wx.utils.JdbcUtils;
import wx.utils.ResultNumHandler;

import java.sql.SQLException;

public class editionAuth {
    public static Boolean auth(String openId,String tid,String bid){
        if(isAdministrator.auth(openId,tid))
            return true;
        else//验证是不是自己的账单
        {
            QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from teamBill where tid=? and openId=?,bid=?";
            try {
                if(queryRunner.update(sql,new ResultNumHandler(),new Object[]{tid,openId,bid}) != 0)
                    return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return false;
        }
    }
}
