/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTODAO;

import Util.DBHelper;
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
public class DAO implements Serializable {

    public DTO checkLogin(String userName, String password)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
//        boolean result = false;
        DTO result = null;
        try {
            //1. Make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select *"
                        + "From [User] "
                        + "Where userName = ? "
                        + "And password = ?";
                //3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, userName);
                stm.setString(2, password);
                //4. Execute Query
                rs = stm.executeQuery();
                //5. Process
                if (rs.next()) {
                    //map: get data from ResultSet & set data to properties's DTO
                    String idUser = rs.getString("idUser");
                    String email = rs.getString("email");
                    String address = rs.getString("address");
                    String phoneNumber = rs.getString("phoneNumber");
                    int idRole = rs.getInt("idRole");
                    result = new DTO(idUser, userName, password, email, address, phoneNumber, idRole);
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

    public boolean createAccount(DTO account)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1.make connection
            con = DBHelper.makeConnection();
            if (con != null) {
                //2.create sql string
                String sql = "Insert Into [User]("
                        + "userName, password, email, address, phoneNumber"
                        + ") Values("
                        + "?, ?, ?, ?, ?"
                        + ")";
                //3.create stm obj
                stm = con.prepareStatement(sql);
                stm.setString(1, account.getUserName());
                stm.setString(2, account.getPassword());
                stm.setString(3, account.getEmail());
                stm.setString(4, account.getAddress());
                stm.setString(4, account.getPhoneNumber());
                //4.execute
                int effectRows = stm.executeUpdate();
                //5.process (Note: Luu y Khi SU DUNG IF/WHILE)
                if (effectRows > 0) {
                    result = true;
                }
            }
        } catch (Exception e) {
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
