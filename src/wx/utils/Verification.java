package wx.utils;

public class Verification {
    public static Boolean verify_time(String time,int length){
        String[] string = time.split("-");
        if(string.length == length){
            for(String each:string)
            {
                for(int i = 0; i < each.length(); i++)
                    if(!Character.isDigit(each.charAt(i)))
                        return false;
            }
        }else
            return false;
        return  true;
    }
    public static Boolean verify_isNum(String num){
        for(int i = 0; i < num.length(); i++)
        {   if(!Character.isDigit(num.charAt(i)))
                return false;
    }
        return true;
    }
}

