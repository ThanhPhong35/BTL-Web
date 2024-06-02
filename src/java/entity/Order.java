/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author YOU
 */
public class Order {
    private int id;
    private String date ;
    private int cusid;
    private int status;
    private double totalmoney;

    public Order() {
    }

    public Order(int id, String date, int cusid, int status, double totalmoney) {
        this.id = id;
        this.date = date;
        this.cusid = cusid;
        this.status = status;
        this.totalmoney = totalmoney;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCusid() {
        return cusid;
    }

    public void setCusid(int cusid) {
        this.cusid = cusid;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", date=" + date + ", cusid=" + cusid + ", status=" + status + ", totalmoney=" + totalmoney + '}';
    }

}
