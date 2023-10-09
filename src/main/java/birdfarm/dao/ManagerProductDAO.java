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
                        + ",[name],[salePrice],[quantity],[period]\n"
                        + "From BirdProduct";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String period = rs.getString("period");
                    Double salePrice = rs.getDouble("salePrice");
                    int quantity = rs.getInt("quantity");

                    ManagerProductDTO dto
                            = new ManagerProductDTO(name, quantity, salePrice,
                                    period, idBird);

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

    public boolean updateProduct(String idBird, boolean status, String period, int quantity,
            Double importPrice, Double salePrice, String imageURL, String overview)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            //1. Make connection
            con = DBConnection.makeConnection();
            if (con != null) {

                String sql = "  UPDATE BirdProduct\n"
                        + "SET [status] = ?, \n"
                        + "    [period] = ?, \n"
                        + "    quantity = ?, \n"
                        + "    importPrice = ?, \n"
                        + "    salePrice = ?, \n"
                        + "    imageURL = ?, \n"
                        + "    overview = ? \n"
                        + "WHERE idBird = ? ";

                stm = con.prepareStatement(sql);
                stm.setBoolean(1, result);
                stm.setString(2, period);
                stm.setInt(3, quantity);
                stm.setDouble(4, importPrice);
                stm.setDouble(5, salePrice);
                stm.setString(6, imageURL);
                stm.setString(7, overview);
                stm.setString(8, idBird);

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

    public void showUpdateProduct(String searchValue)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT idBird, name, overview, "
                        + "quantity, importPrice, salePrice, "
                        + "imageURL, period, status\n"
                        + "FROM BirdProduct\n"
                        + "WHERE idBird = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, searchValue);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String idBird = rs.getString("idBird");
                    String name = rs.getString("name");
                    String overview = rs.getString("overview");
                    int quantity = rs.getInt("quantity");
                    Double importPrice = rs.getDouble("importPrice");
                    Double salePrice = rs.getDouble("salePrice");
                    String imageURL = rs.getString("imageURL");
                    String period = rs.getString("period");
                    boolean status = rs.getBoolean("status");
                    ManagerProductDTO dto
                            = new ManagerProductDTO(idBird, name, overview,
                                    quantity, importPrice, salePrice, imageURL, period, status);

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

    public boolean deleteBird(String idBird) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //1. Make connection
            con = DBConnection.makeConnection();
            if (con != null) {    
                String sql = "Delete From BirdProduct "
                        + "Where idBird = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, idBird);
                int effectRows = stm.executeUpdate(); 
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
