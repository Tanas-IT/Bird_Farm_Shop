/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

import Util.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 1005h
 */
public class ProductDAO {
    
    private static final String GET_LIST_PRODUCT = "SELECT productID, name, price, quantity, image FROM tblProducts";
    private static final String GET_QUANTITY_PRODUCT = "SELECT quantity FROM tblProducts WHERE productID = ?";
    private static final String GET_PRODUCT = "SELECT name, price, quantity, image FROM tblProducts WHERE productID=?";
    private static final String UPDATE_QUANTITY = "UPDATE tblProducts SET quantity=? WHERE productID=?";
    public List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_LIST_PRODUCT);
                rs = ptm.executeQuery();
                while(rs.next()){
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    list.add(new ProductDTO(productID, name, price, quantity, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs!=null) rs.close();
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close(); 
        }
        return list;
    }

    public boolean checkQuantityProduct(String productID, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_QUANTITY_PRODUCT);
                ptm.setString(1, productID);
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
    
    public ProductDTO getProduct(String productID) throws SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()){
                    String pName = rs.getString("name");
                    double pPrice = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String img = rs.getString("image");
                    product = new ProductDTO(productID, pName, pPrice, quantity, img);
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return product;
    }

    public boolean updateQuantity(ProductDTO productInCart) throws SQLException {
        ProductDTO product = null;
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            product = getProduct(productInCart.getProductID());
            if (product.getProductQuantity() >= productInCart.getProductQuantity()) {
                int newQuantity = product.getProductQuantity() - productInCart.getProductQuantity();
                conn = DBHelper.makeConnection();
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                ptm.setInt(1, newQuantity);
                ptm.setString(2, product.getProductID());
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
