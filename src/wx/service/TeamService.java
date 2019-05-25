package wx.service;

import wx.dao.TeamDao;
import wx.domain.TeamBill;
import wx.domain.TeamMember;
import wx.utils.TimeUtils;
import wx.utils.notification.EventMessage;
import wx.utils.notification.addInfo;

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
    public Boolean delTeamBill(String tid,String bid,String name,String amount,String label) {
        Object[] params = new Object[]{ tid, bid};
        TeamDao dao = new TeamDao();
        if(dao.delTeamBill(params))
        {
            addInfo add = new addInfo();
            add.BillInfo(tid,name,EventMessage.DelBil,amount,label,TimeUtils.getNow());
            return true;
        }else
            return false;
    }

    /*
    添加账单
    */
    public Boolean addTeamBill(String openId,String nickName,String tid,String amount,String label,String remarks,String time,String type){
        Object[] params = {openId,nickName,tid,amount,label,remarks,time,type};
        TeamDao dao = new TeamDao();
        if(dao.addTeamBill(params))
        {   //添加通知
            addInfo add = new addInfo();
            add.BillInfo(tid,nickName,EventMessage.AddBill,amount,label,time);
            return true;
        }else
            return false;
    }
    /*
        团队添加新成员
    */
    public Boolean addNewMember(String openId,String tid,String name){
        String uid = tid+System.currentTimeMillis();
        Object[] params = new Object[]{openId,tid,uid,name};
        TeamDao teamDao = new TeamDao();
        if(teamDao.addNewMember(params)){
            addInfo add = new addInfo();
            add.MemberInfo(tid,null,name,EventMessage.NewMember, TimeUtils.getNow());
            return true;
        }else
            return  false;
    }
    /*
    成员退出团队
    */
    public Boolean leaveTeam(String tid,String openId,String name){
        TeamDao dao = new TeamDao();
        Object[] params = new Object[]{tid,openId};
        if(dao.leaveTeam(params))
        {
            addInfo add = new addInfo();
            add.MemberInfo(tid,null,name,EventMessage.NewMember,TimeUtils.getNow());
            return true;
        }else
            return false;
    }
    /*
    团队管理员踢人
    */
    public Boolean kickOut(String tid,String openId,String uid,String name,String operator){
        Object[] params = new Object[]{tid,openId,uid};
        TeamDao teamDao = new TeamDao();
        if(teamDao.kickOut(params))
        {
            addInfo add = new addInfo();
            add.MemberInfo(tid,operator,name,EventMessage.NewMember,TimeUtils.getNow());
            return true;
        }else
            return false;
    }

    /*
    编辑账单
    */
    public Boolean editTeamBill(String tid, String bid, String nickName, String amount, String label, String remarks){
        Object[] params = new Object[]{tid,bid,nickName,amount,label,remarks};
        TeamDao dao = new TeamDao();
        if(dao.editTeamBill(params)){
            addInfo add = new addInfo();
            add.BillInfo(tid,nickName,EventMessage.AddBill,amount,label,TimeUtils.getNow());
            return true;
        }else
            return false;
    }
    /*
    获取通知信息
    */
    public List getInfo(String tid,String page){
        Object[] params = new Object[]{tid,(Integer.valueOf(page)-1)*10};
        TeamDao dao = new TeamDao();
        return dao.getInfo(params);
    }
}
