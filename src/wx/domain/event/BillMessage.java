package wx.domain.event;

public class BillMessage {
    private String name;//执行这个事件的用户名
    private String event;//发生的事件
    private String amount;//原来多少钱
    private String label;
    private String time;//执行这个操作的时间

    public BillMessage(String name, String event, String amount, String label, String time) {
        this.name = name;
        this.event = event;
        this.amount = amount;
        this.label = label;
        this.time = time;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
