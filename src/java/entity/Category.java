/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author YOU
 */
public class Category {
    private int cid;
    private String cname ;
    private String cimage ;

    public Category() {
    }
    
    public Category(int cid, String cname, String cimage) {
        this.cid = cid;
        this.cname = cname;
        this.cimage = cimage;
    }

    public Category(String cname, String cimage) {
        this.cname = cname;
        this.cimage = cimage;
    }

    
    @Override
    public String toString() {
        return "Catagories{" + "cid=" + cid + ", cname=" + cname + ", cimage=" + cimage + '}';
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCimage() {
        return cimage;
    }

    public void setCimage(String cimage) {
        this.cimage = cimage;
    }
    
    
}
