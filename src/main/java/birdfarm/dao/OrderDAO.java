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
import birdfarm.dto.RequiredOrderDetailDTO;
import birdfarm.util.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Minh
 */
public class OrderDAO {

    private static final String ADD_ORDER = "INSERT INTO [Order](idUser, createdDate, status, Total, receiverAddress, Note, receiverPhoneNumber, receiverName, [paymentID], isPay, orderCode) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_PAYMENT = "UPDATE [Order] SET paymentID = ? WHERE orderCode=?";
    private static final String UPDATE_STATUS = "UPDATE [Order] SET status=? WHERE orderCode=?";
    private static final String UPDATE_ISPAY = "UPDATE [Order] SET isPay=? WHERE orderCode=?";
     private static final String GET_ALL_ORDER = "Select o.idOrder, o.createdDate, bp.name, od.quantity, od.price, o.status, o.Total From [Order] o\n"
                                                + "  Join [User] u\n"
                                                + "  ON o.idUser = u.idUser\n"
                                                + "  Join OrderDetail od\n"
                                                + "  ON o.idOrder = od.idOrder\n"
                                                + "  Join BirdProduct bp\n"
                                                + "  On bp.idBird = od.idBirdProduct\n"
                                                + "  Where o.idUser = ? ";
    private static final String GET_ALL_ORDER_IN_DETAIL = "Select o.idOrder, bp.name, o.receiverName, o.receiverAddress, o.receiverPhoneNumber,o.Note, o.createdDate,o.status, o.total ,o.paymentID From [Order] o\n" +
"                                                 Join [User] u\n" +
"                                                 ON o.idUser = u.idUser\n" +
"                                                 Join OrderDetail od\n" +
"                                                 ON o.idOrder = od.idOrder\n" +
"                                                  Join BirdProduct bp\n" +
"                                                On bp.idBird = od.idBirdProduct\n" +
"                                                Where o.idOrder =  ?";
    private List<OrderDetailDTO> listOrderDetail;
     private List<RequiredOrderDetailDTO> listRequiredOrderDetailDTO;

    public List<OrderDetailDTO> getListOrderDetail() {
        return listOrderDetail;
    }

    public List<RequiredOrderDetailDTO> getListRequiredOrderDetailDTO() {
        return listRequiredOrderDetailDTO;
    }
    
    
    public int AddOrder(OrderDTO order) throws SQLException {
        int lastInsertId = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet generatedKeys = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS);
//                ptm.setString(1, order.getOrderCode());
                ptm.setString(1, order.getIdUser());
                ptm.setDate(2, order.getCreatedDate());
                ptm.setString(3, order.getStatus());
                ptm.setDouble(4, order.getTotal());
                ptm.setString(5, order.getReceiverAddress());
                ptm.setString(6, order.getNote());
                ptm.setString(7, order.getReceiverPhoneNumber());
                ptm.setString(8, order.getReceiverName());
                ptm.setInt(9, order.getPaymentId());
                ptm.setBoolean(10, order.getIsPay());
                ptm.setString(11, order.getOrderCode());

                int rowsAffected = ptm.executeUpdate();
                if (rowsAffected > 0) {
                    generatedKeys = ptm.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        lastInsertId = generatedKeys.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (generatedKeys != null) {
                generatedKeys.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return lastInsertId;
    }

    public void updatePaymentID(OrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                int pay = order.getPaymentId();
                ptm = conn.prepareStatement(UPDATE_PAYMENT);
                ptm.setInt(1, order.getPaymentId());
                ptm.setInt(2, order.getIdOrder());
                ptm.executeUpdate();
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
    }

    public void updateStatus(OrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                int pay = order.getPaymentId();
                ptm = conn.prepareStatement(UPDATE_STATUS);
                ptm.setString(1, order.getStatus());
                ptm.setInt(2, order.getIdOrder());
                ptm.executeUpdate();
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
    }

    public void updateIsPay(OrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                int pay = order.getPaymentId();
                ptm = conn.prepareStatement(UPDATE_ISPAY);
                ptm.setBoolean(1, order.getIsPay());
                ptm.setInt(2, order.getIdOrder());
                ptm.executeUpdate();
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
    }
    
    
    public List<OrderDetailDTO> getOrderDetail(OrderDTO order)  
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "  Select o.idOrder,bp.idBird, o.Note, bp.imageURL, bp.shortDescription, o.createdDate, bp.name, u.fullName, od.quantity, od.price, o.status, od.totalPrice From [Order] o\n" +
"                              Join [User] u\n" +
"                              ON o.idUser = u.idUser\n" +
"                              Join OrderDetail od\n" +
"                              ON o.idOrder = od.idOrder\n" +
"                              Join BirdProduct bp\n" +
"                              On bp.idBird = od.idBirdProduct\n" +
"                              Join Customer c\n" +
"                              On u.idUser = c.idCustomer\n" +
"                              Where o.orderCode = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, order.getOrderCode());
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idOrder = rs.getInt("idOrder");
                    Date createdDate = rs.getDate("createdDate");
                    String nameOfBird = rs.getString("name");
                    String imageURL = rs.getString("imageURL");
                    String fullName = rs.getString("fullName");
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    String status = rs.getString("status");
                    double totalPrice = rs.getDouble("totalPrice");
                    String shortDescription = rs.getString("shortDescription");
                    String note = rs.getString("Note");
                    String idBirdProduct = rs.getString("idBird");
                    BirdDTO bird = new BirdDTO(nameOfBird,shortDescription,imageURL);
                    OrderDetailDTO orderDetail = new OrderDetailDTO(idOrder, quantity, price, totalPrice, bird, createdDate, fullName, status, note,idBirdProduct);
                    if(this.listOrderDetail == null) {
                        listOrderDetail = new ArrayList<>();
                    }
                    listOrderDetail.add(orderDetail);
                }
            }
        } finally {
            if(rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listOrderDetail;
    }
    
     
    public List<OrderDTO> getAllOrder(String idUser) 
            throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        OrderDTO order = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<OrderDTO> list = new ArrayList<>();
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_ORDER);
                ptm.setString(1, idUser);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int oId = rs.getInt("idOrder");
                    String oBirdName = rs.getString("name");
                    Date oDate = rs.getDate("createdDate");
                    String oStatus = rs.getString("status");
                    double oPrice = rs.getDouble("Total");
                    order = new OrderDTO(oId, oDate, oStatus, oPrice, oBirdName);
                    list.add(order);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<OrderDTO> getAllOrderInDetail(int orderId) 
            throws NamingException, ClassNotFoundException {
        Connection conn = null;
        OrderDTO order = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<OrderDTO> list = new ArrayList<>();
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_ORDER_IN_DETAIL);
                ptm.setInt(1, orderId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int oId = rs.getInt("idOrder");
                    String oBirdName = rs.getString("name");
                    String cName = rs.getString("receiverName");
                    String cAddress = rs.getString("receiverAddress");
                    String cPhone = rs.getString("receiverPhoneNumber");
                    String cNote = rs.getString("Note");
                    int paymentID = rs.getInt("paymentID");
                    Date oDate = rs.getDate("createdDate");
                    String oStatus = rs.getString("status");
                    double oTotal = rs.getDouble("total");
                    order = new OrderDTO(oId, oDate, oStatus, oTotal, cAddress,cNote,cPhone,cName,oBirdName,paymentID);
                    list.add(order);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
      public List<RequiredOrderDetailDTO> getAllRequiredOrderDetail(String idUser)   
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT [idRequiredOrderDetail]\n" +
"                          ,ro.[idRequiredOrder]\n" +
"                          , bp.name as BirdFatherName,\n" +
"                    	  ro.createdDate, \n" +
"                    	  ro.status,\n" +
"                    	  bp1.name as BirdMotherName\n" +
"                          ,[idBirdNest]\n" +
"                          ,[fee]\n" +
"                    , [birdNestMale]\n" +
"                          ,[birdNestFemale]\n" +
"                     ,bf.[feeBirdNestMale]\n" +
"                          ,bf1.[feeBirdNestFemale]\n" +
"                      FROM [BIRD_FARM_SHOP].[dbo].[RequiredOrderDetail] rod\n" +
"                      Join BirdProduct bp\n" +
"                      ON rod.idBirdFather = bp.idBird\n" +
"                      Join BirdProduct bp1\n" +
"                      ON rod.idBirdMother = bp1.idBird\n" +
"                      Join RequiredOrder ro\n" +
"                      ON ro.idRequiredOrder = rod.idRequiredOrder\n" +
"					  Join BirdProfile bf\n" +
"                      ON rod.idBirdFather = bf.idBird\n" +
"					  Join BirdProfile bf1\n" +
"                      ON rod.idBirdMother = bf1.idBird\n" +
"                         Where ro.idUser = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, idUser);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idRequiredOrder = rs.getInt("idRequiredOrder");
                    Date createdDate = rs.getDate("createdDate");
                    String BirdFatherName = rs.getString("BirdFatherName");
                    String BirdMotherName = rs.getString("BirdMotherName");
                    String status = rs.getString("status");
                    double fee = rs.getDouble("fee");
                    String idBirdNest = rs.getString("idBirdNest");
                    int birdNestMale = rs.getInt("birdNestMale");
                    int birdNestFemale = rs.getInt("birdNestFemale");
                    double feeBirdNestMale = rs.getDouble("feeBirdNestMale");
                    double feeBirdNestFemale = rs.getDouble("feeBirdNestFemale");
                    RequiredOrderDetailDTO bird = new RequiredOrderDetailDTO(idRequiredOrder, idBirdNest, fee, createdDate, status,BirdFatherName, BirdMotherName, birdNestMale, birdNestFemale,feeBirdNestMale, feeBirdNestFemale);
                    if(this.listRequiredOrderDetailDTO == null) {
                        this.listRequiredOrderDetailDTO = new ArrayList<>();
                    }
                    this.listRequiredOrderDetailDTO.add(bird);
                }
            }
        } finally {
            if(rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listRequiredOrderDetailDTO;
    }
}

