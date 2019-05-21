package wx.utils;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class JdbcUtils {
    private static DataSource dataSource;
    static{
        try{
            //JNDI技术加载datasource
            Context context = new InitialContext();
            dataSource =(DataSource) context.lookup("java:comp/env/jdbc/wx");
        }
        catch (NamingException e) {
            e.printStackTrace();
        }
    }
    public static DataSource getDataSource(){
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}

