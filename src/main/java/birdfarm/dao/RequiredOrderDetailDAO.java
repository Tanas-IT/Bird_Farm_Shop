/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.RequiredOrderDetailDTO;
import birdfarm.util.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minh
 */
public class RequiredOrderDetailDAO {
     private static final String INSERT_REQUIRED_ORDER_DETAIL = "INSERT INTO RequiredOrderDetail (idRequiredOrder, idBirdNest, fee) VALUES(?,?,?)";
     private static final String UPDATE_ID_FATHER_BIRD =" UPDATE RequiredOrderDetail SET idBirdFather = ? WHERE idRequiredOrder=?";
     private static final String UPDATE_ID_MOTHER_BIRD =" UPDATE RequiredOrderDetail SET idBirdMother = ? WHERE idRequiredOrder=?";
     private static final String UPDATE_IS_PAIRING = "Update BirdProduct Set isPairing = 'True' Where idBird = ?";
     private List<RequiredOrderDetailDTO> listTracking;

    public List<RequiredOrderDetailDTO> getListTracking() {
        return listTracking;
    }
     
     public boolean insert(int lastInsertID,String idBirdNest, double totalFee) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_REQUIRED_ORDER_DETAIL);
                ptm.setInt(1, lastInsertID);
                ptm.setString(2, idBirdNest);
                ptm.setDouble(3, totalFee);
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
     public void updateIdBirdFather(String idBirdFather,int idRequireOrder) throws SQLException {
        Connection conn= null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(UPDATE_ID_FATHER_BIRD);
                ptm.setString(1, idBirdFather);
                ptm.setInt(2, idRequireOrder);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close();
        }
    }
     public void updateIdBirdMother(String idbirdMother, int idRequireOrder) throws SQLException {
        Connection conn= null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(UPDATE_ID_MOTHER_BIRD);
                ptm.setString(1, idbirdMother);
                ptm.setInt(2, idRequireOrder);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close();
        }
    }
     
     public void updateIsPairing(String idBird) throws SQLException {
        Connection conn= null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(UPDATE_IS_PAIRING);
                ptm.setString(1, idBird);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close();
        }
    }
    public void createBirdNest(String idBird) throws SQLException {
        Connection conn= null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.makeConnection();
            if(conn!=null){
                ptm = conn.prepareStatement("Insert Into TrackingBirdNest\n" +
                                            "  (idBirdNest)\n" +
                                            "  Values\n" +
                                            "  (\n" +
                                            "	?\n" +
                                            "  )");
                ptm.setString(1, idBird);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close();
        }
    }
    
    public void getTrackingBird(int idRequiredOrder) 
            throws SQLException {
        Connection conn= null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.makeConnection();
            if(conn!=null){
                ptm = conn.prepareStatement("SELECT ro.[idRequiredOrder]\n" +
"                                              ,bp.name as BirdFatherName\n" +
"                                              ,rod.[idBirdNest]\n" +
"                                              ,bp1.name as BirdMotherName\n" +
"                                              ,[fee],\n" +
"                                        	  tbn.imageURL,\n" +
"                                        	  tbn.reason,\n" +
"                                        	  tbn.trackingDate,\n" +
"                                        	  ro.status\n" +
"                                              ,[birdNestMale]\n" +
"                                              ,[birdNestFemale],\n" +
"                                         tbn.name as BirdNestName\n" +
"                                          FROM [BIRD_FARM_SHOP].[dbo].[RequiredOrderDetail] rod\n" +
"                                          Join TrackingBirdNest tbn\n" +
"                                          On rod.idBirdNest = tbn.idBirdNest\n" +
"                                         Join BirdProduct bp\n" +
"                                          On rod.idBirdFather = bp.idBird\n" +
"                                          Join BirdProduct bp1\n" +
"                                          ON rod.idBirdMother = bp1.idBird\n" +
"                                          Join RequiredOrder ro\n" +
"                                          ON ro.idRequiredOrder = rod.idRequiredOrder\n" +
"                                          Where rod.idRequiredOrder = ? \n" +
"                                          ORDER BY trackingDate DESC");
                 ptm.setInt(1, idRequiredOrder);
                 rs = ptm.executeQuery();
                while (rs.next()) {
                    int getIdRequiredOrder = rs.getInt("idRequiredOrder");
                    String BirdFatherName = rs.getString("BirdFatherName");
                    String BirdMotherName = rs.getString("BirdMotherName");
                    String imageURL = rs.getString("imageURL");
                    String reason = rs.getString("reason");
                    Date trackingDate = rs.getDate("trackingDate");
                    String status = rs.getString("status");
                    int birdNestMale = rs.getInt("birdNestMale");
                    int birdNestFemale = rs.getInt("birdNestFemale");
                    String birdNestName = rs.getString("BirdNestName");
                    RequiredOrderDetailDTO rod = new RequiredOrderDetailDTO(getIdRequiredOrder, birdNestMale, birdNestFemale, status, BirdFatherName,BirdMotherName,reason,imageURL,trackingDate,birdNestName);
                    if(this.listTracking == null) {
                        this.listTracking = new ArrayList<>();
                    }
                    this.listTracking.add(rod);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm!=null) ptm.close();
            if (conn!=null) conn.close();
            if(rs != null) rs.close();
        }
    }
}
