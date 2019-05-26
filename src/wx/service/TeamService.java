package wx.service;

import wx.dao.TeamDao;
import wx.domain.team.TeamBill;
import wx.domain.team.TeamMember;
import wx.utils.TimeUtils;
import wx.utils.notification.EventMessage;
import wx.utils.notification.addInfo;

import java.security.DrbgParameters;
import java.util.List;
import java.util.UUID;

public class TeamService {
    public String createTeam(String openId, String teamName,String uname){
        //生成团队和团队内用户的uuid
        String tid = UUID.randomUUID().toString();
        String uid = UUID.randomUUID().toString();
        Object[] params = new Object[]{tid,openId,teamName};
        Object[] params2 = new Object[]{tid,openId,uname,teamName,uid};
        Object[] params3 = new Object[]{tid,openId};
        TeamDao dao = new TeamDao();
        if(dao.createTeam(params,params2,params3))
            return tid;
        else
            return null;
    }
    public List getTeam(String openId,String page){
        TeamDao dao = new TeamDao();
        Object[] params = new Object[]{openId,(Integer.valueOf(page)-1)*10};
        return dao.getTeam(params);
    }
    /*
    获取团队账单
     */
    public List<TeamBill> getTeamBill(String tid, String page,String openId){
        Object[] params = new Object[]{openId,tid,(Integer.valueOf(page)-1)*10};
        Object[] params2 = new Object[]{openId,tid};
        TeamDao dao = new TeamDao();
        return dao.getTeamBill(params,params2);
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
        Object[] params = new Object[]{tid, bid};
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
    public String addTeamBill(String openId,String nickName,String amount,String tid,String label,String remarks,String time,String type){
        Object[] params = {openId,nickName,tid,amount,label,remarks,type,time};
        TeamDao dao = new TeamDao();
        String bid = null;
        if((bid = dao.addTeamBill(params)) != null)
        {   //添加通知
            addInfo add = new addInfo();
            add.BillInfo(tid,nickName,EventMessage.AddBill,amount,label,time);
            return bid;
        }else
            return null;
    }
    /*
        团队添加新成员
    */
    public Boolean addNewMember(String openId,String tid,String name,String tname){
        String uid = UUID.randomUUID().toString();//生成团队内的唯一标识符
        TeamDao teamDao = new TeamDao();
        Object[] params1 = new Object[]{tid,openId};
        if(!teamDao.findMember(params1)){
            Object[] params = new Object[]{openId,tid,uid,name,tname};
            Object[] params2 = new Object[]{openId,tid};
            if(teamDao.addNewMember(params,params2)){
                addInfo add = new addInfo();//添加日志
                add.MemberInfo(tid,null,name,EventMessage.NewMember, TimeUtils.getNow());
                return true;
        }else
            return  false;
        }else
            return false;
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
            //自己离开团队是没有operator的
            add.MemberInfo(tid,null,name,EventMessage.ExitTeam,TimeUtils.getNow());
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
            add.MemberInfo(tid,operator,name,EventMessage.KickOutOfTeam,TimeUtils.getNow());
            return true;
        }else
            return false;
    }

    /*
    编辑账单
    */
    public Boolean editTeamBill(String tid, String bid, String nickName, String amount, String label, String remarks){
        Object[] params = new Object[]{nickName,amount,label,remarks,bid,tid};
        TeamDao dao = new TeamDao();
        if(dao.editTeamBill(params)){
            addInfo add = new addInfo();
            add.BillInfo(tid,nickName,EventMessage.EditBill,amount,label,TimeUtils.getNow());
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

    /*
    解散团队
    */
    public Boolean dismissTeam(String tid){
        TeamDao dao = new TeamDao();
       return dao.dismissTeam(tid);
    }
}
