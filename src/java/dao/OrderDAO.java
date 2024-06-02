/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import entity.Item;
import entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author YOU
 */
public class OrderDAO {
    Connection conn = null;
    
    public int getTotalOrder(){
        String query = "select count(*) from [Order]\n" +
                "where totalmoney != 0";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps= conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public void addOrder(Account account, Cart cart){
        LocalDate curDate = java.time.LocalDate.now();
        String date  = curDate.toString();

        try {
            String sql = "insert into [Order] values(?,?,0,?)";
            conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,date);
            ps.setInt(2, account.getUserid());
            ps.setDouble(3, cart.getTotalMoney());
            ps.executeUpdate();
            
            //lấy ra id của Order vừa add
            String sql1 = "select top 1 id from [Order] order by id desc";
            PreparedStatement ps1 = conn.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            //add vào bảng OrderDetail
           
            if(rs.next()){
                int oid = rs.getInt(1);
                for( Item i: cart.getItems()){
                    String sql2="insert into [OrderDetail] values (?,?,?,?)";
                    PreparedStatement ps2 = conn.prepareStatement(sql2);
                    ps2.setInt(1, oid);
                    ps2.setInt(2, i.getProduct().getId());
                    ps2.setInt(3, i.getQuantity());
                    ps2.setDouble(4, i.getPrice());
                    ps2.executeUpdate();
                }
            }
        } catch (Exception e) {
            
        }
    }
    
    public List<Order> getAllOrder(){
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM [Order] ORDER BY id DESC";
        
        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Order a = new Order(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDouble(5)
                );
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void confirmOrder(String orderId) {
        String query = "update [Order]\n" +
                "set [status] = 1\n" +
                "where id = ?";

        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps1 = conn.prepareStatement(query);
            ps1.setString(1, orderId);
            ps1.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void cancelOrder(String orderId) {
        String query = "update [Order]\n" +
                "set [status] = 2\n" +
                "where id = ?";

        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps1 = conn.prepareStatement(query);
            ps1.setString(1, orderId);
            ps1.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public List<Order> getListOrderByCusId(int id){
        List<Order> list = new  ArrayList<>();
        String query = "select * from [Order] where cusid=? order by id desc";
        
        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareCall(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Order a = new Order(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDouble(5)
                );
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
        
    }
    
    public List<Order> getListOrderByStatus(int status){
        List<Order> list = new  ArrayList<>();
        String query = "select * from [Order] where status=? ";
        
        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareCall(query);
            ps.setInt(1, status);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Order a = new Order(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDouble(5)
                );
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
        
    }
     
    public double getTotalRenevue() {
        ArrayList<Order> ls = new ArrayList<>();
        String sql = "select  *\n"
                + "  from [dbo].[Order]\n"
                + " where totalmoney!=0\n"
                + "and status=1";

        double sum = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Order c = new Order();
                c.setTotalmoney(rs.getDouble("totalmoney"));
                ls.add(c);
            }
        } catch (SQLException e) {
        }
        for (int i = 0; i < ls.size(); i++) {
            sum += ls.get(i).getTotalmoney();
        }
        return sum;
    }
    
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<Order> listO = dao.getAllOrder();
        for (Order o : listO){
            System.out.println(o);
        }
    }
    
    
}
