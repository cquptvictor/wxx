package wx.service;

import wx.dao.TeamDao;
import wx.domain.Team;
import wx.domain.TeamBill;
import wx.domain.TeamMember;

import javax.websocket.OnClose;
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
    /*
    获取团队账单
     */
    public List<TeamBill> getTeamBill(String tid, String page,String openId){
        Object[] params = new Object[]{openId,tid,page};
        TeamDao dao = new TeamDao();
        return dao.getTeamBill(params);
    }
    /*
    获取团队成员
     */
    public List<TeamMember> getTeamMember(String tid,String page){
        Object[] params = new Object[]{tid,(Integer.valueOf(page)-1)*10};
        TeamDao dao = new TeamDao();
        return dao.getTeamMember(params);
    }
    /*
       删除账单
     */
    public Boolean delTeamBill(String tid,String bid) {
        Object[] params = new Object[]{ tid, bid};
        TeamDao dao = new TeamDao();
        return dao.delTeamBill(params);
    }

    /*
    添加账单
    */
    public Boolean addTeamBill(String openId,String nickName,String tid,String amount,String label,String remarks,String time,String type){
        Object[] params = {openId,nickName,tid,amount,label,remarks,time,type};
        TeamDao dao = new TeamDao();
        return dao.addTeamBill(params);
    }
    /*
        团队添加新成员
    */
    public Boolean addNewMember(String openId,String tid,String name){
        String uid = tid+System.currentTimeMillis();
        Object[] params = new Object[]{openId,tid,uid,name};
        TeamDao teamDao = new TeamDao();
        return teamDao.addNewMember(params);
    }
    /*
    成员退出团队
    */
    public Boolean leaveTeam(String tid,String openId){
        TeamDao dao = new TeamDao();
        Object[] params = new Object[]{tid,openId};
        return dao.leaveTeam(params);
    }
    /*
    团队管理员踢人
    */
    public Boolean kickOut(String tid,String openId,String uid){
        Object[] params = new Object[]{tid,openId,uid};
        TeamDao teamDao = new TeamDao();
        return teamDao.kickOut(params);
    }
}
