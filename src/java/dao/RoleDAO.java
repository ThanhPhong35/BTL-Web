/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author YOU
 */
public class RoleDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public Role getRoleById(int roleid){
        String query = "select * from Role"+
                "where roleId=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, roleid);
            ps.executeQuery();
            if(rs.next()){
                return new Role(
                    rs.getInt(1),
                    rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }
}
