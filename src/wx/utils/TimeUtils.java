package wx.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeUtils {

    public static String getNow(){
        //时间用于构造json
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String time = simpleDateFormat.format(new Date());
        return time;
    }
    public static Date getWeek(int offset){
        Calendar calendar = Calendar.getInstance();

        //以周一为第一天
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        if(dayOfWeek == 0)
            dayOfWeek = 7;
        calendar.add(Calendar.DATE, 1-dayOfWeek );//得到周一的日期

        calendar.add(Calendar.DATE, offset * 7);//以本周为基点偏移
        return calendar.getTime();
    }

    public static Date getMonth(int offset ){
        Calendar calendar = Calendar.getInstance();
        int days = calendar.get(Calendar.DAY_OF_MONTH);
        calendar.add(Calendar.MONTH,offset);//指定月份
        calendar.add(Calendar.DATE,1 - days);

        return calendar.getTime();

    }

    public static Date getYear(int offset){
        Calendar calendar = Calendar.getInstance();
        int months = calendar.get(Calendar.MONTH);
        calendar.add(Calendar.YEAR,offset);
        calendar.add(Calendar.MONTH,- months);
        return calendar.getTime();
    }
}
