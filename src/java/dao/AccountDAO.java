/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public int getTotalAccount(){
        String query = "select count(*) from account";
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
    
    public List<Account> getAllAccount(){
        List<Account> list = new ArrayList<>();
        String query = "select * from Account";
        
        try {
            conn = new DBContext().getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery();
            while(rs.next()){
                Account a;
                a= new Account(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getInt(8),
                    rs.getString(9),
                    rs.getInt(10));
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Account checkLogin(String user, String pass){
        String query = "select * from Account \n" 
                + "where [username] = ?\n" 
                + "and [password] = ?";
        try {
            conn = new DBContext().getConnection();
            ps =  conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Account(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getInt(8),
                    rs.getString(9),
                    rs.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void updateStatus(Account account){
        String query ="update [Account]\n"+
                "set status=?\n"+
                "code =?\n"+
                "where email=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,account.getStatus());
            ps.setString(2, account.getCode());
            ps.setString(3, account.getEmail());
            ps.executeLargeUpdate();
        } catch (Exception e) {
        }
    }
    public boolean checkUsernameExist(String username){
        boolean duplicate = false;
        String query = "select * from Account \n" 
                + "where [username] = ?";
        try {
            conn = new DBContext().getConnection();
            ps =  conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while(rs.next()){
                duplicate = true;
            }
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return duplicate;
    }
    
     public boolean checkEmailExist(String email){
        boolean duplicate = false;
        String query = "select * from Account \n" 
                + "where [email] = ?";
        try {
            conn = new DBContext().getConnection();
            ps =  conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while(rs.next()){
                duplicate = true;
            }
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return duplicate;
    }
    
    public void Register(Account account){
         String query = "insert into Account(username,email,password,status,code,roleid) \n" 
                 +"values( ?, ?, ?, ?, ?, ?)";
         try {
             conn = new DBContext().getConnection();
             ps = conn.prepareStatement(query);
             ps.setString(1, account.getUsername());
             ps.setString(2, account.getEmail());
             ps.setString(3, account.getPassword());
             ps.setInt(4, account.getStatus()); 
             ps.setString(5, account.getCode());
             ps.setInt(6, account.getRoleid());
             
             ps.executeUpdate();    
         }
         catch(Exception e){                
         } 
    }
    
    public void changPassword(int userid, String pass){
         String query = "update Account " +
                     "set password = ?" +
                     "where userid = ?";
         try {
             conn = new DBContext().getConnection();
             ps = conn.prepareStatement(query);
             ps.setString(1, pass);
             ps.setInt(2,userid);
             
             ps.executeUpdate();    
         }
         catch(Exception e){                
         } 
    }
    
    public List<Account> searchAccount(String key){
        List<Account> list = new ArrayList<>();
        String query = "select * from [dbo].[account]\n" +
                    "where \n" +
                    "    [fullname] like ? or\n" +
                    "    [username] like ? or\n" +
                    "    [email] like ? or\n" +
                    "    [phone] like ?;";
        
        try {
            conn = new DBContext().getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, "%"+key+"%");
            ps.setString(2, "%"+key+"%");
            ps.setString(3, "%"+key+"%");
            ps.setString(4, "%"+key+"%");
            rs=ps.executeQuery();
            while(rs.next()){
                Account a;
                a= new Account(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getInt(8),
                    rs.getString(9),
                    rs.getInt(10));
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list; 
     }
    
    public void deleteAccount(String id){
        String query = "delete Account\n" +
                "where userid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void addAccount(Account account){
         String query = "insert into Account(fullname,username,email,password,phone,status,roleid) \n" 
                 +"values( ?, ?, ?, ?, ?, 1,?)";
         try {
             conn = new DBContext().getConnection();
             ps = conn.prepareStatement(query);
             ps.setString(1, account.getFullname());
             ps.setString(2, account.getUsername());
             ps.setString(3, account.getEmail());
             ps.setString(4, account.getPassword());
             ps.setString(5, account.getPhone());
             ps.setInt(6, account.getRoleid());
             
             ps.executeUpdate();    
         }
         catch(Exception e){                
         } 
    }
    
    public Account getAccountById(String id){
        String query = "select * from Account \n" 
                + "where userid = ?";
        try {
            conn = new DBContext().getConnection();
            ps =  conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Account(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getInt(8),
                    rs.getString(9),
                    rs.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void updateAccount(Account account){
         String query = "update Account " +
                     "set fullname = ?, " +
                     "    username = ?, " +
                     "    email = ?, " +
                     "    password = ?, " +
                     "    phone = ?, " +
                     "    roleid = ? " +
                     "where userid = ?";
         try {
             conn = new DBContext().getConnection();
             ps = conn.prepareStatement(query);
             ps.setString(1, account.getFullname());
             ps.setString(2, account.getUsername());
             ps.setString(3, account.getEmail());
             ps.setString(4, account.getPassword());
             ps.setString(5, account.getPhone());
             ps.setInt(6, account.getRoleid());
             ps.setInt(7, account.getUserid());
             
             ps.executeUpdate();    
         }
         catch(Exception e){                
         } 
    }
    
    public Account getNewestAccount(){
        String query = "SELECT TOP 1 *\n" +
            "FROM [dbo].[account]\n" +
            "ORDER BY [userid] DESC;";
        try {
            conn = new DBContext().getConnection();
            ps =  conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Account(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getInt(8),
                    rs.getString(9),
                    rs.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void activateAccount(String id){
        String query ="update [Account]\n"+
                "set status= 1 \n"+
                "where userid=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void inactivateAccount(String id){
        String query ="update [Account]\n"+
                "set status= 0 \n"+
                "where userid=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
//    public static void main(String[] args) {
//        AccountDAO dao = new AccountDAO();
//        Account b = dao.getAccount("Quyen", "123456");
//        List<Account> list = dao.getAllAccount();
//        System.out.println(list.size());
//        for(Account a : list){
//            System.out.println(a);
//        }
//        System.out.println(b);     
//    }

    public Account Login(String username, String password) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}


