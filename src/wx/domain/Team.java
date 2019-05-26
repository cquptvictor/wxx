package wx.domain;

public class Team {
    private String tid;
    private String name;
    private String isAdministrator;

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
