/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.ManagerProductDTO;
import birdfarm.util.DBConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author HP
 */
public class ManagerProductDAO implements Serializable {

    private List<ManagerProductDTO> productList;

    public List<ManagerProductDTO> getProductList() {
        return productList;
    }

    public void showProduct()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = " Select [idBird] "
                        + ",[name],[salePrice],[quantity],[lifeExpectancy]\n"
                        + "From BirdProduct";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String lifeExpectancy = rs.getString("lifeExpectancy");
                    Double salePrice = rs.getDouble("salePrice");
                    int quantity = rs.getInt("quantity");

                    ManagerProductDTO dto
                            = new ManagerProductDTO(name, quantity, salePrice,
                                    lifeExpectancy, idBird);

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

    public int getTotalProduct() throws NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select COUNT(*) from BirdProduct";

                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalProduct(int i) throws NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select COUNT(*) from BirdProduct where isBirdNest = ? ";

                stm = con.prepareStatement(sql);
                stm.setInt(1, i);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

}
