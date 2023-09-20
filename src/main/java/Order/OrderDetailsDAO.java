/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Product.ProductDTO;
import Util.DBHelper;

/**
 *
 * @author 1005h
 */
public class OrderDetailsDAO {
    private static final String INSERT = "INSERT INTO tblOrderDetails (orderID, productID, price, quantity) VALUES(?,?,?,?)";
    public boolean insert(ProductDTO product, int lastInsertID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, lastInsertID);
                ptm.setString(2, product.getProductID());
                ptm.setDouble(3, product.getProductPrice());
                ptm.setInt(4, product.getProductQuantity());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
    
}
