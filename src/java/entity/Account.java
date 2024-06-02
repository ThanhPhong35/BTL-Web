/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author YOU
 */
public class Account {
    private int userid;
    private String fullname;
    private String username ;
    private String email ;
    private String password ;
    private String images ;
    private String phone ;
    private int status;
    private String code ;
    private int roleid;

    public Account() {
    }

    public Account(int userid, String fullname, String username, String email, String password, String images, String phone, int status, String code, int roleid) {
        this.userid = userid;
        this.fullname = fullname;
        this.username = username;
        this.email = email;
        this.password = password;
        this.images = images;
        this.phone = phone;
        this.status = status;
        this.code = code;
        this.roleid = roleid;
    }

    public Account(int userid, String fullname, String username, String email, String password, String phone, int roleid) {
        this.userid = userid;
        this.fullname = fullname;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.roleid = roleid;
    }
    
    public Account( String username, String email, String password, int status, String code, int roleid) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.status = status;
        this.code = code;
        this.roleid = roleid;
    }

    public Account(String fullname, String username, String email, String password, String phone, int roleid) {
        this.fullname = fullname;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.roleid = roleid;
    }
    
    

    public Account(String username, String email, String password, String code) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.code = code;
    }

    

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }
    
}
