/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.UserDTO;
import birdfarm.util.DBConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class UserDAO implements Serializable {

    public UserDTO checkLogin(String username, String password)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
//        boolean result = false;
        UserDTO result = null;
        try {
            //1. Make connection
            con = DBConnection.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select *"
                        + "From [User] "
                        + "Where username = ? "
                        + "And password = ?";
                //3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. Execute Query
                rs = stm.executeQuery();
                //5. Process
                if (rs.next()) {
                    //map: get data from ResultSet & set data to properties's DTO
                    String idUser = rs.getString("idUser");
                    String fullName = rs.getString("fullName");
                    int idRole = rs.getInt("idRole");
                    result = new UserDTO(idUser, username, password,fullName, idRole);
                }//end username and password is verified
            }//end connection is available
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean createAccount(UserDTO account)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1.make connection
            con = DBConnection.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "Insert Into [User](idUser, username, password, fullName, idRole)"
                        + " Values(?, ?, ?, ?, ? )";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, account.getIdUser());
                stm.setString(2, account.getUsername());
                stm.setString(3, account.getPassword());
                stm.setString(4, account.getFullName());
                stm.setInt(5, account.getIdRole());
                //4.execute
                int effectRows = stm.executeUpdate();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                if (effectRows > 0) {
                    result = true;
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (stm != null) {
                con.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }
}
