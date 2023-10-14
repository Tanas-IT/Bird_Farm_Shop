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
import birdfarm.dto.PaymentDTO;

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
    private List<PaymentDTO> paymentList;

    public List<PaymentDTO> getPaymentList() {
        return paymentList;
    }
    

    public void showProduct()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "Select idBird, name, quantity, salePrice, isBirdNest, status "
                        + "From BirdProduct";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    float salePrice = rs.getFloat("salePrice");
                    boolean isBirdNest = rs.getBoolean("isBirdNest");
                    boolean status = rs.getBoolean("status");

                    AdminProductDTO dto
                            = new AdminProductDTO(idBird, name, quantity, salePrice, isBirdNest, status);

                    if (this.productList == null) {
                        this.productList = new ArrayList<>();
                    }
                    this.productList.add(dto);
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
    
    public void showPayment()    
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT [idPayment]\n" +
                        "      ,[methodName]\n" +
                        "  FROM [BIRD_FARM_SHOP].[dbo].[Payment]";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idPayment = rs.getInt("idPayment");
                    String methodName = rs.getString("methodName");

                    PaymentDTO dto
                            = new PaymentDTO(idPayment, methodName);

                    if (this.paymentList == null) {
                        this.paymentList = new ArrayList<>();
                    }
                    this.paymentList.add(dto);
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
