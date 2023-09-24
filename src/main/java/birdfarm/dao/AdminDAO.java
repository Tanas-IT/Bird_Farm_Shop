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
import kajumisu.dto.AdminDTO;

/**
 *
 * @author HP
 */
public class AdminDAO implements Serializable {

    private List<AdminDTO> accountList;

    public List<AdminDTO> getAccountList() {
        return accountList;
    }

    public void showAccount()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT u.idUser, u.userName, u.password, u.fullName, u.phoneNumber, r.roleName "
                        + "FROM [User] u "
                        + "JOIN [Role] r ON r.idRole = u.idRole "
                        + "WHERE r.roleName <> 'customer' ";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idUser = rs.getString("idUser");
                    String userName = rs.getString("userName");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    String phoneNumber = rs.getString("phoneNumber");
                    String roleName = rs.getString("roleName");
                    
                    AdminDTO dto
                            = new AdminDTO(idUser, userName, password, fullName, phoneNumber, roleName);

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
}
