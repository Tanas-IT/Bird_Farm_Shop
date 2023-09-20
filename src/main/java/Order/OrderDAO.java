/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Order;

import Util.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author 1005h
 */
public class OrderDAO {
    private static final String ADD_ORDER = "INSERT INTO tblOrders(orderCode, userID, date, total, status) VALUES(?,?,?,?,?)";
    private static final String UPDATE_ORDER="UPDATE tblOrders SET payment_Method=? WHERE orderCode=?";
    private static final String UPDATE_STATUS="UPDATE tblOrders SET status=? WHERE orderCode=?";
    public int AddOrder(OrderDTO order) throws SQLException {
        int lastInsertId = 0;
        Connection conn= null;
        PreparedStatement ptm = null;
        ResultSet generatedKeys = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, order.getOrderCode());
                ptm.setString(2, order.getUserID());
                ptm.setString(3, order.getOrderDate());
                ptm.setDouble(4, order.getOrderTotal());
                ptm.setBoolean(5, order.getPaymentStatus());
                
                int rowsAffected = ptm.executeUpdate();
                if(rowsAffected > 0){
                    generatedKeys = ptm.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        lastInsertId = generatedKeys.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (generatedKeys != null) generatedKeys.close();
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close();
        }
        return lastInsertId;
    }

    public void updateOrderMethod(OrderDTO order) throws SQLException {
        Connection conn= null;
        PreparedStatement ptm = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn!=null){
                String pay = order.getPaymentMethod();
                ptm = conn.prepareStatement(UPDATE_ORDER);
                ptm.setString(1, order.getPaymentMethod());
                ptm.setString(2, order.getOrderCode());
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close();
        }
    }

    public void updateStatus(OrderDTO order) throws SQLException {
        Connection conn= null;
        PreparedStatement ptm = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn!=null){
                String pay = order.getPaymentMethod();
                ptm = conn.prepareStatement(UPDATE_STATUS);
                ptm.setBoolean(1, order.getPaymentStatus());
                ptm.setString(2, order.getOrderCode());
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close();
        }
    }

    
    
    
}
