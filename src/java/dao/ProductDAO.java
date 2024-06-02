/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author YOU
 */
public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps= null;
    ResultSet rs = null;

// Phân trang cho product - Home    
    //đếm số lượn sản ohaamr trong db
    public int getTotalProduct(){
        String query = "select count(*) from product";
        try {
            conn = new DBContext().getConnection();
            ps= conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public List<Product> pagingProduct(int index){
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "order by id \n"
                + "offset ? rows fetch next 10 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index -1) * 10);
            rs= ps.executeQuery();
            while(rs.next()){
                int cateID = rs.getInt(7);
                CategoryDAO dao = new CategoryDAO();
                Category cate =dao.getCategoryById(cateID);
                Product a;
                a = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        cate);
                list.add(a);
            }   
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getAllProduct(){
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                int cateID = rs.getInt(7);
                CategoryDAO dao = new CategoryDAO();
                Category cate =dao.getCategoryById(cateID);
                Product a;
                a = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        cate);
                list.add(a);
            }   
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getProductByCID(String cid){
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" 
                + "where cateID=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,cid);
            rs= ps.executeQuery();
            while(rs.next()){
                int cateID = rs.getInt(7);
                CategoryDAO dao = new CategoryDAO();
                Category cate =dao.getCategoryById(cateID);
                Product a;
                a = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        cate);
                list.add(a);
            }   
        } catch (Exception e) {
        }
        return list;
    }
    
    public Product getProductByID(String id){
        String query = "select * from product\n" 
                +"where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,id);
            rs= ps.executeQuery();
            while(rs.next()){
                int cateID = rs.getInt(7);
                CategoryDAO dao = new CategoryDAO();
                Category cate =dao.getCategoryById(cateID);
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        cate);
            }   
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProuctByName(String nameSearch){
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product\n" 
                 + "WHERE [name] LIKE ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,"%"+ nameSearch+"%");
            rs= ps.executeQuery();
            while(rs.next()){
                int cateID = rs.getInt(7);
                CategoryDAO dao = new CategoryDAO();
                Category cate =dao.getCategoryById(cateID);
                Product a;
                a = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        cate);
                list.add(a);
            }   
        } catch (Exception e) {
        }
        return list;
    }

// Tim kiem nang cao    
    public List<Product> searchByCheckCate(int[] cid){
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" 
                + "where 1=1";
        
        if (cid!=null && cid[0]!=0){
            query+="and cateID in (";
            for(int i=0; i<cid.length; i++){
                query += cid[i] +",";
            }
            if(query.endsWith(",")){
                query = query.substring(0, query.length()-1);
            }
            query += ")";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                int cateID = rs.getInt(7);
                CategoryDAO dao = new CategoryDAO();
                Category cate =dao.getCategoryById(cateID);
                Product a;
                a = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        cate);
                list.add(a);
            }   
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getProductByPrice(double from, double to){
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n" 
                + "where price between ? and ?";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDouble(1, from);
            ps.setDouble(2, to);
            rs= ps.executeQuery();
            while(rs.next()){
                int cateID = rs.getInt(7);
                CategoryDAO dao = new CategoryDAO();
                Category cate =dao.getCategoryById(cateID);
                Product a;
                a = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        cate);
                list.add(a);
            }   
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getListNewestProduct(){
        List<Product> list = new ArrayList<>();
        String query = "select top 6 * from product\n" +
                            "order by id desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                int cateID = rs.getInt(7);
                CategoryDAO dao = new CategoryDAO();
                Category cate =dao.getCategoryById(cateID);
                Product a;
                a = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        cate);
                list.add(a);
            }   
        } catch (Exception e) {
        }
        return list;
    }
    
    public Product getNewestProduct(){;
        String query = "select top 1 * from product\n" +
                            "order by id desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs= ps.executeQuery();
            while(rs.next()){
                int cateID = rs.getInt(7);
                CategoryDAO dao = new CategoryDAO();
                Category cate =dao.getCategoryById(cateID);
                Product a;
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        cate);
            }   
        } catch (Exception e) {
        }
        return null;
    }
    
    public void deleteProduct(String id){
        String query = "delete from product\n"
                +"where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void addProduct(String ten , String img, String gia, String chude, String mota, String cid){
        String query = "insert into product\n"
                +"values( ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,ten);
            ps.setString(2, img);
            ps.setString(3, gia);
            ps.setString(4, chude);
            ps.setString(5, mota);
            ps.setString(6, cid);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
    }

    public void updateProduct(String id, String ten , String img, String gia, String chude, String mota, String cid){
        String query = "UPDATE [dbo].[product]\n" +
                "SET\n" +
                "    [name] = ?,\n" +
                "    [image] = ?,\n" +
                "    [price] = ?, \n" +
                "    [title] = ?,\n" +
                "    [description] = ?,\n" +
                "    [cateID] = ? \n" +
                "WHERE\n" +
                "    [id] = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,ten);
            ps.setString(2, img);
            ps.setString(3, gia);
            ps.setString(4, chude);
            ps.setString(5, mota);
            ps.setString(6, cid);
            ps.setString(7, id);
            ps.executeUpdate();    
        } catch (Exception e) {
        }
    }
//                
//    }
//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//        List<Product> a= dao.getAllProduct();
//        for(Product b : a){
//            System.out.println(b);
//        }
//            int k = dao.getTotalProduct();
//            System.out.println(k);

    
}
