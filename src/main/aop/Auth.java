package main.aop;

/**
 * Created by cnhhdn on 2017/6/13.
 */
public enum Auth {
    ADMIN("管理员",0),
    USER("用户",1),
    INVALID_USER("违规用户",-1);

    private String name;
    private int index;

    Auth(String name, int index){
        this.name=name;
        this.index=index;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
