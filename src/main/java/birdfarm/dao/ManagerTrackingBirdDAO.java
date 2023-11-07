/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.Chart;
import birdfarm.dto.ManagerProductDTO;
import birdfarm.dto.ManagerTrackingBirdDTO;
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
public class ManagerTrackingBirdDAO implements Serializable {
    
    private List<ManagerTrackingBirdDTO> requiredOrderDetailList;
    
    public List<ManagerTrackingBirdDTO> getRequiredOrderDetailList() {
        return requiredOrderDetailList;
    }
    
    public void showTrackingList()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "Select ro.idRequiredOrder, u.fullName, ro.status, ro.receiverName, ro.createdDate, "
                        + " ro.trackingDate, b1.name as birdFather, b2.name as birdMother from  RequiredOrder ro\n"
                        + "join RequiredOrderDetail rd \n"
                        + "on ro.idRequiredOrder = rd.idRequiredOrder\n"
                        + "join BirdProduct b1 \n"
                        + "on rd.idBirdFather=b1.idBird \n"
                        + "join BirdProduct b2\n"
                        + "on rd.idBirdMother = b2.idBird\n"
                        + "join [User] u \n"
                        + "on ro.idUser = u.idUser\n"
                        + "Where ro.status NOT IN (N'Đã hoàn thành', N'Đã hủy') \n"
                        + "ORDER BY trackingDate DEsc";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idRequiredOrder = rs.getInt("idRequiredOrder");
                    String fullName = rs.getString("receiverName");
                    String trackingDate = rs.getString("trackingDate");
                    String birdFather = rs.getString("birdFather");
                    String birdMother = rs.getString("birdMother");
                    String status = rs.getString("status");
                    String createdDate = rs.getString("createdDate");
                    ManagerTrackingBirdDTO dto
                            = new ManagerTrackingBirdDTO(idRequiredOrder,
                                    status, trackingDate, birdFather, birdMother, fullName, createdDate);
                    
                    if (this.requiredOrderDetailList == null) {
                        this.requiredOrderDetailList = new ArrayList<>();
                    }
                    this.requiredOrderDetailList.add(dto);
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
    
    public void showSuccessTrackingList()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "Select ro.idRequiredOrder, u.fullName, ro.status,"
                        + " ro.trackingDate, b1.name as birdFather, b2.name as birdMother from  RequiredOrder ro\n"
                        + "join RequiredOrderDetail rd \n"
                        + "on ro.idRequiredOrder = rd.idRequiredOrder\n"
                        + "join BirdProduct b1 \n"
                        + "on rd.idBirdFather=b1.idBird \n"
                        + "join BirdProduct b2\n"
                        + "on rd.idBirdMother = b2.idBird\n"
                        + "join [User] u \n"
                        + "on ro.idUser = u.idUser\n"
                        + "Where ro.status = N'Đã hoàn thành' \n"
                        + "ORDER BY trackingDate DEsc";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idRequiredOrder = rs.getInt("idRequiredOrder");
                    String fullName = rs.getString("fullName");
                    String trackingDate = rs.getString("trackingDate");
                    String birdFather = rs.getString("birdFather");
                    String birdMother = rs.getString("birdMother");
                    String status = rs.getString("status");
                    
                    ManagerTrackingBirdDTO dto
                            = new ManagerTrackingBirdDTO(idRequiredOrder,
                                    status, trackingDate, birdFather, birdMother, fullName);
                    
                    if (this.requiredOrderDetailList == null) {
                        this.requiredOrderDetailList = new ArrayList<>();
                    }
                    this.requiredOrderDetailList.add(dto);
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
    
    public void showCancelTrackingList()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "Select ro.idRequiredOrder, u.fullName, ro.status,"
                        + " ro.trackingDate, b1.name as birdFather, b2.name as birdMother from  RequiredOrder ro\n"
                        + "join RequiredOrderDetail rd \n"
                        + "on ro.idRequiredOrder = rd.idRequiredOrder\n"
                        + "join BirdProduct b1 \n"
                        + "on rd.idBirdFather=b1.idBird \n"
                        + "join BirdProduct b2\n"
                        + "on rd.idBirdMother = b2.idBird\n"
                        + "join [User] u \n"
                        + "on ro.idUser = u.idUser\n"
                        + "Where ro.status = N'Đã hủy' \n"
                        + "ORDER BY trackingDate DEsc";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idRequiredOrder = rs.getInt("idRequiredOrder");
                    String fullName = rs.getString("fullName");
                    String trackingDate = rs.getString("trackingDate");
                    String birdFather = rs.getString("birdFather");
                    String birdMother = rs.getString("birdMother");
                    String status = rs.getString("status");
                    
                    ManagerTrackingBirdDTO dto
                            = new ManagerTrackingBirdDTO(idRequiredOrder,
                                    status, trackingDate, birdFather, birdMother, fullName);
                    
                    if (this.requiredOrderDetailList == null) {
                        this.requiredOrderDetailList = new ArrayList<>();
                    }
                    this.requiredOrderDetailList.add(dto);
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
    
    public void showUpdateTrackingBird(int searchValue)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "  Select ro.idRequiredOrder, u.fullName, ro.receiverName,\n"
                        + "                                ro.status, ro.reason,ro.imgTracking, ro.Total, \n"
                        + "                                ro.trackingDate,bf1.feeBirdNestMale as priceBirdDad,bf2.feeBirdNestFemale as priceBirdMom, \n"
                        + "                                 b1.name as birdFather , b2.name as birdMother,  rd.birdNestMale ,\n"
                        + "                                rd.birdNestFemale , rd.fee , cu.email, rd.idBirdNest, \n"
                        + "                        b1.imageURL as imageBirdFather, b2.imageURL as imageBirdMother,\n"
                        + "                        b1.shortDescription as shortDescriptionBirdFather,\n"
                        + "                         b2.shortDescription as shortDescriptionBirdMother \n"
                        + "                                from  RequiredOrder ro \n"
                        + "                                join RequiredOrderDetail rd \n"
                        + "                                 on ro.idRequiredOrder = rd.idRequiredOrder\n"
                        + "                                join BirdProduct b1 \n"
                        + "                                   on rd.idBirdFather=b1.idBird \n"
                        + "                                  join BirdProduct b2\n"
                        + "                                  on rd.idBirdMother = b2.idBird\n"
                        + "				   join BirdProfile bf1 \n"
                        + "                                   on bf1.idBird=rd.idBirdFather\n"
                        + "                                  join BirdProfile bf2\n"
                        + "                                  on rd.idBirdMother = bf2.idBird\n"
                        + "                                 join [User] u \n"
                        + "                                   on ro.idUser = u.idUser\n"
                        + "                                join [Customer] cu\n"
                        + "                                  on ro.idUser = cu.idCustomer\n"
                        + "                                      Where ro.idRequiredOrder = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, searchValue);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idRequiredOrder = rs.getInt("idRequiredOrder");
                    String fullName = rs.getString("receiverName");
                    String trackingDate = rs.getString("trackingDate");
                    String reason = rs.getString("reason");
                    String imgTracking = rs.getString("imgTracking");
                    String birdFather = rs.getString("birdFather");
                    String birdMother = rs.getString("birdMother");
                    String status = rs.getString("status");
                    int birdNestMale = rs.getInt("birdNestMale");
                    int birdNestFemale = rs.getInt("birdNestFemale");
                    Double importPriceBirdDad = rs.getDouble("priceBirdDad");
                    Double importPriceBirdMom = rs.getDouble("priceBirdMom");
                    Double fee = rs.getDouble("fee");
                    String email = rs.getString("email");
                    String idBirdNest = rs.getString("idBirdNest");
                    String imageBirdFather = rs.getString("imageBirdFather");
                    String imageBirdMother = rs.getString("imageBirdMother");
                    String shortDescriptionBirdFather = rs.getString("shortDescriptionBirdFather");
                    String shortDescriptionBirdMother = rs.getString("shortDescriptionBirdMother");
                    Double total = rs.getDouble("total");
                    ManagerTrackingBirdDTO dto
                            = new ManagerTrackingBirdDTO(idRequiredOrder, status, 
                                    reason, imgTracking, birdFather, birdMother,
                                    fullName, importPriceBirdDad, importPriceBirdMom,
                                    fee, birdNestMale, birdNestFemale, email, idBirdNest, 
                                    imageBirdFather, imageBirdMother, shortDescriptionBirdFather, 
                                    shortDescriptionBirdMother, total);
                    
                    if (this.requiredOrderDetailList == null) {
                        this.requiredOrderDetailList = new ArrayList<>();
                    }
                    this.requiredOrderDetailList.add(dto);
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
    
    public List<Chart> totalMoneyRequiredOrder(String idOrder, String start, int day) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            try {
                con = DBConnection.makeConnection();
                if (con != null) {
                    String sql = "SELECT SUM(Total)\n"
                            + "FROM [RequiredOrder]\n"
                            + "WHERE idRequiredOrder " + idOrder + "\n"
                            + "  AND createdDate <= DATEADD(DAY, ?, ?) AND createdDate >= ?";
                    
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, i);
                    stm.setString(2, start);
                    stm.setString(3, start);
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        value = rs.getInt(1);
                    }
                    sql = "select  DATEADD(DAY, ?, ?)";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, i);
                    stm.setString(2, start);
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        Chart c = Chart.builder()
                                .date(rs.getDate(1))
                                .value(value)
                                .build();
                        list.add(c);
                    }
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }
    
    public boolean updateTrackingBirdImg(int idRequiredOrder, String imgTracking)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        
        try {
            
            con = DBConnection.makeConnection();
            if (con != null) {
                
                String sql = "UPDATE RequiredOrder\n"
                        + "SET trackingDate = CAST(GETDATE() AS DATE),\n"
                        + "imgTracking = ? \n"
                        + "WHERE idRequiredOrder = ? ";
                
                stm = con.prepareStatement(sql);
                
                stm.setString(1, imgTracking);
                stm.setInt(2, idRequiredOrder);
                
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
    
    public boolean updateTrackingBird(int idRequiredOrder, String status, String reason)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        
        try {
            
            con = DBConnection.makeConnection();
            if (con != null) {
                
                String sql = " UPDATE RequiredOrder\n"
                        + "                       SET [status] = ?,\n"
                        + "                       trackingDate = CAST(GETDATE() AS DATE),\n"
                        + "                       [reason] = ?\n"
                        + "                      \n"
                        + "                       WHERE idRequiredOrder = ?";
                
                stm = con.prepareStatement(sql);
                stm.setString(1, status);
                stm.setString(2, reason);
                stm.setInt(3, idRequiredOrder);
                
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
    
    public boolean updateTrackingBirdDetail(int idRequiredOrder, int birdNestFemale1, int birdNestMale1)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        
        try {
            
            con = DBConnection.makeConnection();
            if (con != null) {
                
                String sql = "UPDATE RequiredOrderDetail \n"
                        + "                        SET [birdNestMale] = ? ,\n"
                        + "                        [birdNestFemale] = ? \n"
                        + "                        WHERE idRequiredOrder = ?";
                
                stm = con.prepareStatement(sql);
                stm.setInt(1, birdNestMale1);
                stm.setInt(2, birdNestFemale1);
                stm.setInt(3, idRequiredOrder);
                
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
    
    public boolean cancelRequiredOrderTrackingBird(int idRequiredOrder, String reason)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "UPDATE [RequiredOrder]\n"
                        + "  SET status = N'Đã hủy', "
                        + "  trackingDate = CAST(GETDATE() AS DATE),\n"
                        + "  reason = ? \n"
                        + "  WHERE idRequiredOrder = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, reason);
                stm.setInt(2, idRequiredOrder);
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
    
    public boolean cancelBirdProductTrackingBird(int idRequiredOrder)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "UPDATE BirdProduct\n"
                        + "SET isPairing = 1\n"
                        + "WHERE idBird IN (\n"
                        + "    SELECT idBirdFather\n"
                        + "    FROM RequiredOrderDetail\n"
                        + "    WHERE idRequiredOrder = ? \n"
                        + ") OR idBird IN (\n"
                        + "    SELECT idBirdMother\n"
                        + "    FROM RequiredOrderDetail\n"
                        + "    WHERE idRequiredOrder = ? \n"
                        + ")";
                stm = con.prepareStatement(sql);
                stm.setInt(1, idRequiredOrder);
                stm.setInt(2, idRequiredOrder);
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
    
    public boolean successRequiredOrderTrackingBird(int idRequiredOrder, Double total, String reason)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "UPDATE [RequiredOrder]\n"
                        + "  SET status = N'Đã hoàn thành',"
                        + "  Total = ? , "
                        + "  trackingDate = CAST(GETDATE() AS DATE),\n"
                        + "  reason = ? \n"
                        + "  WHERE idRequiredOrder = ? ";
                stm = con.prepareStatement(sql);
                stm.setDouble(1, total);
                stm.setString(2, reason);
                stm.setInt(3, idRequiredOrder);
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
    
    public boolean successBirdProductTrackingBird(int idRequiredOrder)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "UPDATE BirdProduct\n"
                        + "SET isPairing = 1\n"
                        + "WHERE idBird IN (\n"
                        + "    SELECT idBirdFather\n"
                        + "    FROM RequiredOrderDetail\n"
                        + "    WHERE idRequiredOrder = ? \n"
                        + ") OR idBird IN (\n"
                        + "    SELECT idBirdMother\n"
                        + "    FROM RequiredOrderDetail\n"
                        + "    WHERE idRequiredOrder = ? \n"
                        + ")";
                stm = con.prepareStatement(sql);
                stm.setInt(1, idRequiredOrder);
                stm.setInt(2, idRequiredOrder);
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
    
    public boolean insertTrackingBird(String idBirdNest, String imageURL, String status, String reason, String birdName)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        
        try {
            
            con = DBConnection.makeConnection();
            if (con != null) {
                
                String sql = "  INSERT INTO TrackingBirdNest (idBirdNest, imageURL, status, trackingDate, reason,name)\n"
                        + "VALUES (?, ?, ?,  CAST(CONVERT(datetime2(0), GETDATE()) AS datetime2(0)), ?, ?)";
                
                stm = con.prepareStatement(sql);
                stm.setString(1, idBirdNest);
                stm.setString(2, imageURL);
                stm.setString(3, status);
                stm.setString(4, reason);
                stm.setString(5, birdName);
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
}
