/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.OrderDetail;
import context.DBContext;
import entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author YOU
 */
public class DetailDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<OrderDetail> getOrderDetailByOid(String id){
        List<OrderDetail> list = new ArrayList<>();
        String query = "select * from [OrderDetail] where oid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                int t = rs.getInt(2);
                String tid = ""+t;
                ProductDAO d = new ProductDAO();
                Product b = d.getProductByID(tid);
                OrderDetail od = new OrderDetail(
                    rs.getInt(1),
                    b,
                    rs.getInt(3),
                    rs.getDouble(4));
                list.add(od);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        DetailDAO dao = new DetailDAO();
        List<OrderDetail> list = dao.getOrderDetailByOid("7");
        for(OrderDetail o : list){
            System.out.println(o);
        }
    }
}

