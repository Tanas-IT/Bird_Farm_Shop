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
import javax.naming.NamingException;

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
"                                        	  tbn.status\n" +
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
                    String trackingDate = rs.getString("trackingDate");
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
     public List<RequiredOrderDetailDTO> getDetailAllOrder(int requiredOrderId) 
        {
            Connection conn = null;
            RequiredOrderDetailDTO detail = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            List<RequiredOrderDetailDTO> list = new ArrayList<>();
            try {
                conn = DBConnection.makeConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(" select ro.idRequiredOrder, idBirdNest, bp1.name as BirdFatherName, bp1.imageURL as BirdFatherImage, bp2.name as BirdMotherName, bp2.imageURL as BirdMotherImage,  birdNestMale, birdNestFemale, bp1.shortDescription as DescriptionOfBirdFather, bp2.shortDescription as DescriptionOfBirdMother, bp1.isPairing, bf1.feeBirdNestMale, bf2.feeBirdNestFemale  from [RequiredOrderDetail] join BirdProduct as bp1 \n" +
"                        on [RequiredOrderDetail].idBirdFather = bp1.idBird\n" +
"						join BirdProduct as bp2 \n" +
"                        on [RequiredOrderDetail].idBirdMother = bp2.idBird\n" +
"						Join [RequiredOrder] ro ON ro.idRequiredOrder = RequiredOrderDetail.idRequiredOrder\n" +
"						Join Customer c On ro.idUser = c.idCustomer\n" +
"						Join BirdProfile bf1 \n" +
"						ON bf1.idBird = bp1.idBird\n" +
"						Join BirdProfile bf2\n" +
"						On bf2.idBird = bp2.idBird\n" +
"            			where ro.idRequiredOrder = ?");
                    ptm.setInt(1, requiredOrderId);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        int roId = rs.getInt("idRequiredOrder");
                        String idBirdNest = rs.getString("idBirdNest");
                        int numOfBirdNestMale = rs.getInt("birdNestMale");
                        int numOfBirdNestFemale = rs.getInt("birdNestFemale");
                        String shortDescriptionBirdFather = rs.getString("DescriptionOfBirdFather");
                        String shortDescriptionBirdMother = rs.getString("DescriptionOfBirdMother");
                        boolean isPairing = rs.getBoolean("isPairing");
                        double feeBirdNestMale = rs.getDouble("feeBirdNestMale");
                        double feeBirdNestFemale = rs.getDouble("feeBirdNestFemale");
                        String birdFatherImage = rs.getString("BirdFatherImage");
                        String birdMotherImage = rs.getString("BirdMotherImage");
                        String birdFatherName = rs.getString("BirdFatherName");
                        String birdMotherName = rs.getString("BirdMotherName");
                        detail = new RequiredOrderDetailDTO(roId, idBirdNest, numOfBirdNestMale, numOfBirdNestFemale, shortDescriptionBirdFather, shortDescriptionBirdMother, isPairing, feeBirdNestMale, feeBirdNestFemale, birdFatherImage, birdMotherImage, birdFatherName, birdMotherName);
                        list.add(detail);
                    }
                }
            } catch (SQLException e) {
                System.out.println(e);

            } catch(NamingException e) {
                System.out.println(e);
            } catch(ClassNotFoundException e) {
                System.out.println(e);
            }
            return list;
        }
}
