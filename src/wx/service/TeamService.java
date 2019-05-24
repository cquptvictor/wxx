package wx.service;

import wx.dao.TeamDao;

import java.util.List;
import java.util.UUID;

public class TeamService {
    public String createTeam(String openId, String teamName){
        String tid = UUID.randomUUID().toString();
        Object[] params = new Object[]{tid,openId,teamName};
        TeamDao dao = new TeamDao();
        if(dao.createTeam(params))
            return tid;
        else
            return null;
    }
    public List getTeam(String openId){
        TeamDao dao = new TeamDao();
        return dao.getTeam(openId);
    }
}
