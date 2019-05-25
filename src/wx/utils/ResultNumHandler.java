package wx.utils;

import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ResultNumHandler implements ResultSetHandler {
    @Override
    public Object handle(ResultSet resultSet) throws SQLException {
        int count = 0;
        while(resultSet.next())
                count++;
        return count;
    }
}
