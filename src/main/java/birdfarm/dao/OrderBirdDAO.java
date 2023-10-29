/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;
import birdfarm.dto.BirdDTO;
import birdfarm.dto.CustomerDTO;
import birdfarm.dto.OrderDTO;
import birdfarm.dto.OrderDetailDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import birdfarm.util.DBConnection;
import java.sql.Date;
import javax.naming.NamingException;

/**
 *
 * @author 1005h
 */
public class OrderBirdDAO {
    
    private static final String GET_LIST_PRODUCT = "SELECT [idBird], name, [salePrice], quantity, [imageURL] FROM BirdProduct";
    private static final String GET_QUANTITY_PRODUCT = "SELECT quantity FROM BirdProduct WHERE [idBird] = ?";
    private static final String GET_PRODUCT = "SELECT name, [salePrice], quantity, [imageURL] FROM BirdProduct WHERE [idBird] = ?";
    private static final String UPDATE_QUANTITY = "UPDATE BirdProduct SET quantity=? WHERE [idBird]=?";

    public boolean checkQuantityProduct(String birdID, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.makeConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_QUANTITY_PRODUCT);
                ptm.setString(1, birdID);
                rs = ptm.executeQuery();
                while(rs.next()){
                    int productQuantity = rs.getInt("quantity");
                    if(quantity <= productQuantity){
                        check = true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs!=null) rs.close();
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close(); 
        }
        return check;
    }
    
    public BirdDTO getProduct(String birdID) throws SQLException {
        BirdDTO bird = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT);
                ptm.setString(1, birdID);
                rs = ptm.executeQuery();
                if (rs.next()){
                    String pName = rs.getString("name");
                    double pPrice = rs.getDouble("salePrice");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("imageURL");
                    bird = new BirdDTO(pName, quantity, pPrice, img);
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return bird;
    }

    public boolean updateQuantity(BirdDTO productInCart) throws SQLException {
        BirdDTO product = null;
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            product = getProduct(productInCart.getIdBird());
            if (product.getQuantity() >= productInCart.getQuantity()) {
                int newQuantity = product.getQuantity() - productInCart.getQuantity();
                conn = DBConnection.makeConnection();
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                ptm.setInt(1, newQuantity);
                ptm.setString(2, product.getIdBird());
                check = ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
}
