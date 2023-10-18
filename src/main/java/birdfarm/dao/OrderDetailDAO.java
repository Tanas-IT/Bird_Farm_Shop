/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.BirdDTO;
import birdfarm.dto.OrderDetailDTO;
import birdfarm.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Minh
 */
public class OrderDetailDAO {

    private static final String INSERT = "INSERT INTO OrderDetail (idOrder, idBirdProduct, quantity, price, totalPrice) VALUES(?,?,?,?,?)";

    public boolean insert(BirdDTO product, int lastInsertID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, lastInsertID);
                ptm.setString(2, product.getIdBird());
                ptm.setInt(3, product.getQuantity());
                ptm.setDouble(4, product.getSalePrice());
                ptm.setDouble(5, product.getTotal());

                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
