/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.util.DBConnection;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import birdfarm.dto.AdminDTO;
import birdfarm.dto.AdminProductDTO;

/**
 *
 * @author HP
 */
public class AdminDAO implements Serializable {

    private List<AdminDTO> accountList;

    public List<AdminDTO> getAccountList() {
        return accountList;
    }

    private List<AdminProductDTO> productList;

    public List<AdminProductDTO> getProductList() {
        return productList;
    }

    

    public void showAccount()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT u.idUser, u.username, u.fullName, u.password, r.roleName "
                        + "FROM [User] u "
                        + "LEFT JOIN Customer c ON u.idUser = c.idCustomer "
                        + "JOIN Role r ON u.idRole = r.idRole "
                        + "WHERE r.roleName <> 'customer' ";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idUser = rs.getString("idUser");
                    String userName = rs.getString("userName");
                    String fullName = rs.getString("fullName");
                    String password = rs.getString("password");
                    String roleName = rs.getString("roleName");

                    AdminDTO dto
                            = new AdminDTO(idUser, userName, password, fullName, roleName);

                    if (this.accountList == null) {
                        this.accountList = new ArrayList<>();
                    }
                    this.accountList.add(dto);
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean updatePassRole(String username, String password, String fullName)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null; 
        PreparedStatement stm = null; 
        boolean result = false;

        try {
            //1. Make connection
            con = DBConnection.makeConnection();
            if (con != null) {
               
                String sql = "  Update [User]\n"
                        + "SET password = ? , fullName = ? \n"
                        + "Where username = ? ";
             
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, fullName);
                stm.setString(3, username);
            
                int effectRows = stm.executeUpdate();

                //5. Process
                if (effectRows > 0) {
                    result = true;
                }

            }
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }
}
