package wx.domain.team;

public class Team {
    private String tid;
    private String name;
    private String isAdministrator;
    private String unread;

    public String getUnread() {
        return unread;
    }

    public void setUnread(String unread) {
        this.unread = unread;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getIsAdministrator() {
        return isAdministrator;
    }

    public void setIsAdministrator(String isAdministrator) {
        this.isAdministrator = isAdministrator;
    }
}
