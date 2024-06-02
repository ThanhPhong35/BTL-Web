/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author YOU
 */
public class CategoryDAO {
    Connection conn = null;
    PreparedStatement ps= null;
    ResultSet rs = null;
    
    public Category getCategoryById(int cid){
        String query = "SELECT * FROM [dbo].[Category]\n" +
                "WHERE [cid] = ?;";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, cid);
            rs = ps.executeQuery();
            while(rs.next()){
                return  new Category(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public List<Category> getAllCatagory(){
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Category(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)));
            }
        } catch (Exception e) {
        }    
        return list;
    }
    
    public List<Category> getCategoryByName(String nameSearch){
        List<Category> list = new ArrayList<>();
        String query = "select * from Category\n" 
                + "where [cname] like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,"%"+ nameSearch+"%");
            rs= ps.executeQuery();
            while(rs.next()){
                while(rs.next()){
                list.add(new Category(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)));
                }
            }   
        } catch (Exception e) {
        }
        return list;
    }
    
    public void addCategory(Category cate){
        String query = "insert into Category\n" +
                "values (?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cate.getCname());
            ps.setString(2, cate.getCimage());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteCategory(String id){
        String query = "delete Category\n" +
                "where cid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
     
      public void updateCategory(Category cate){
        String query = "UPDATE Category " +
               "SET cname = ?, " +
               "cimage = ? " +
               "WHERE cid = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cate.getCname());
            ps.setString(2, cate.getCimage());
            ps.setInt(3, cate.getCid());   
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        int cid =2;
        Category listC = dao.getCategoryById(cid);
        
        System.out.println(listC);
//        for(Category o: listC){
//            System.out.println(o);
//        }
    }
}
