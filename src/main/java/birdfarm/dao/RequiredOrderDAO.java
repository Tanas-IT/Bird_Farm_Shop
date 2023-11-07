/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.RequiredOrderDTO;
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
public class RequiredOrderDAO {

    private static final String ADD_REQUIRED_ORDER = "INSERT INTO [RequiredOrder](idUser, createdDate, status, total, "
                                                     + "receiverAddress,receiverName,\n" +
                                                    "  receiverPhoneNumber,paymentId, isPay,note,orderCode) \n" +
                                                    "  VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    private static final String GET_REQUIRED_BIRDFATHER_ORDERDETAIL = " Select ro.idRequiredOrder, ro.Note, ro.receiverAddress, ro.receiverName, \n" +
                                        "		ro.receiverPhoneNumber,bp.imageURL, bp.name,bf.feeBirdNestMale, ro.status, ro.Total\n" +
                                        "		From RequiredOrder ro\n" +
                                        "		JOiN RequiredOrderDetail rod\n" +
                                        "		ON ro.idRequiredOrder = rod.idRequiredOrder\n" +
                                        "		Join Customer c\n" +
                                        "		On ro.idUser = c.idCustomer\n" +
                                        "		Join BirdProduct bp\n" +
                                        "		On bp.idBird = rod.idBirdFather\n" +
                                        "		Join BirdProfile bf\n" +
                                        "		ON rod.idBirdFather = bf.idBird "+
                                        "               Where orderCode = ? ";
    private static final String GET_REQUIRED_BIRDMOTHER_ORDERDETAIL = " Select ro.idRequiredOrder, ro.Note, ro.receiverAddress, ro.receiverName, \n" +
                                        "		ro.receiverPhoneNumber,bp.imageURL, bp.name,bf.feeBirdNestFemale, ro.status, ro.Total\n" +
                                        "		From RequiredOrder ro\n" +
                                        "		JOiN RequiredOrderDetail rod\n" +
                                        "		ON ro.idRequiredOrder = rod.idRequiredOrder\n" +
                                        "		Join Customer c\n" +
                                        "		On ro.idUser = c.idCustomer\n" +
                                        "		Join BirdProduct bp\n" +
                                        "		On bp.idBird = rod.idBirdMother\n" +
                                        "		Join BirdProfile bf\n" +
                                        "		ON rod.idBirdMother = bf.idBird "+
                                        "               Where orderCode = ? ";
    private static final String UPDATE_ISPAY = "UPDATE [Order] SET isPay=? WHERE orderCode=?";
    private List<RequiredOrderDetailDTO> listRequiredOrderDetailDTO;

    public List<RequiredOrderDetailDTO> getListRequiredOrderDetailDTO() {
        return listRequiredOrderDetailDTO;
    }

   
    

    public int AddRequiredOrder(RequiredOrderDTO rOrder) throws SQLException {
        int lastInsertId = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet generatedKeys = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_REQUIRED_ORDER, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, rOrder.getIdUser());
                ptm.setDate(2, rOrder.getCreatedDate());
                ptm.setString(3, rOrder.getStatus());
                ptm.setDouble(4, rOrder.getTotal());
                ptm.setString(5, rOrder.getReceiverAddress());
                ptm.setString(6, rOrder.getReceiverName());
                ptm.setString(7, rOrder.getReceiverPhoneNumber());
                ptm.setInt(8, rOrder.getPaymentID());
                ptm.setBoolean(9, rOrder.isIsPay());
                ptm.setString(10,rOrder.getNote());
                ptm.setString(11, rOrder.getOrderCode());
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
     public RequiredOrderDTO getRequiredOrderDetailFemale(RequiredOrderDTO rOrder) throws SQLException  {
       
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        RequiredOrderDTO requiredOrderDetail = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_REQUIRED_BIRDMOTHER_ORDERDETAIL, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, rOrder.getOrderCode());
                rs = ptm.executeQuery();
                while(rs.next()) {
                    int requiredOrder = rs.getInt("idRequiredOrder");
                    String note = rs.getString("Note");
                    String receiverAddress = rs.getString("receiverAddress");
                    String receiverName = rs.getString("receiverName");
                    String receiverPhoneNumber = rs.getString("receiverPhoneNumber");
                    String imageURL = rs.getString("imageURL");
                    String name = rs.getString("name");
                    double feeBirdNestMale = rs.getDouble("feeBirdNestFemale");
                    String status = rs.getString("status");
                    double total = rs.getDouble("Total");
                    requiredOrderDetail = new RequiredOrderDTO(requiredOrder, status, total, 
                                                        receiverAddress, receiverName, receiverPhoneNumber, 
                                                        note, imageURL, feeBirdNestMale, name);
                }
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
        return requiredOrderDetail;
    }
     public RequiredOrderDTO getRequiredOrderDetailMale(RequiredOrderDTO rOrder) throws SQLException  {
       
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        RequiredOrderDTO requiredOrderDetail = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_REQUIRED_BIRDFATHER_ORDERDETAIL, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, rOrder.getOrderCode());
                rs = ptm.executeQuery();
                while(rs.next()) {
                    int requiredOrder = rs.getInt("idRequiredOrder");
                    String note = rs.getString("Note");
                    String receiverAddress = rs.getString("receiverAddress");
                    String receiverName = rs.getString("receiverName");
                    String receiverPhoneNumber = rs.getString("receiverPhoneNumber");
                    String imageURL = rs.getString("imageURL");
                    String name = rs.getString("name");
                    double feeBirdNestFemale = rs.getDouble("feeBirdNestMale");
                    String status = rs.getString("status");
                    double total = rs.getDouble("Total");
                    requiredOrderDetail = new RequiredOrderDTO(requiredOrder, status, total, 
                                                        receiverAddress, receiverName, receiverPhoneNumber, 
                                                        note, imageURL, feeBirdNestFemale, name);
                }
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
        return requiredOrderDetail;
    }
     public void updateIsPay(RequiredOrderDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                int pay = order.getPaymentID();
                ptm = conn.prepareStatement(UPDATE_ISPAY);
                ptm.setBoolean(1, order.isIsPay());
                ptm.setInt(2, order.getIdRequiredOrder());
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
     
      public List<RequiredOrderDTO> getAllRequiredOrderInDetail(int requiredOrderId) 
            {
        Connection conn = null;
        RequiredOrderDTO requiredOrder = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<RequiredOrderDTO> list = new ArrayList<>();
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("Select ro.idRequiredOrder, bp1.name as BirdFatherName, bp2.name as BirdMotherName, ro.receiverName, ro.receiverAddress, ro.receiverPhoneNumber,ro.Note, ro.createdDate,ro.status, rod.fee ,ro.paymentID, rod.birdNestMale, rod.birdNestFemale From [RequiredOrder] ro\n" +
"                                                 Join [User] u\n" +
"                                                 ON ro.idUser = u.idUser\n" +
"                                                 Join RequiredOrderDetail rod\n" +
"                                                 ON ro.idRequiredOrder = rod.idRequiredOrder\n" +
"                                                 Join BirdProduct bp1\n" +
"                                                On bp1.idBird = rod.idBirdFather\n" +
"												Join BirdProduct bp2\n" +
"                                                On bp2.idBird = rod.idBirdMother\n" +
"                                                Where ro.idRequiredOrder =  ?");
                ptm.setInt(1, requiredOrderId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int roId = rs.getInt("idRequiredOrder");
                    String roBirdFatherName = rs.getString("BirdFatherName");
                    String roBirdMotherName = rs.getString("BirdMotherName");
                    String cName = rs.getString("receiverName");
                    String cAddress = rs.getString("receiverAddress");
                    String cPhone = rs.getString("receiverPhoneNumber");
                    int paymentID = rs.getInt("paymentID");
                    String cNote = rs.getString("Note");
                    Date roDate = rs.getDate("createdDate");
                    String roStatus = rs.getString("status");
                    double oFee = rs.getDouble("fee");
                    int birdNestMale = rs.getInt("birdNestMale");
                    int birdNestFemale = rs.getInt("birdNestFemale");
                    requiredOrder = new RequiredOrderDTO(roId, roDate, roStatus, cAddress, cName, cPhone, cNote, roBirdFatherName, roBirdMotherName, oFee,paymentID,birdNestMale, birdNestFemale);
                    list.add(requiredOrder);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch(NamingException e) {
            e.printStackTrace();
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }
}
