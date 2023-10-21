/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

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
                        + "Where ro.status NOT IN (N'Đã hoàn thành', N'Đã hủy') \n"
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
                String sql = "Select ro.idRequiredOrder, u.fullName, "
                        + "ro.status, ro.reason,ro.imgTracking, "
                        + "ro.trackingDate,b1.importPrice as priceBirdDad,b2.importPrice as priceBirdMom, "
                        + "b1.name as birdFather , b2.name as birdMother, rd.feePairing, rd.birdNestMale , "
                        + "rd.birdNestFemale , rd.fee "
                        + "from  RequiredOrder ro \n"
                        + "join RequiredOrderDetail rd \n"
                        + "on ro.idRequiredOrder = rd.idRequiredOrder\n"
                        + "join BirdProduct b1 \n"
                        + "on rd.idBirdFather=b1.idBird \n"
                        + "join BirdProduct b2\n"
                        + "on rd.idBirdMother = b2.idBird\n"
                        + "join [User] u \n"
                        + "on ro.idUser = u.idUser\n"
                        + "Where ro.idRequiredOrder = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, searchValue);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int idRequiredOrder = rs.getInt("idRequiredOrder");
                    String fullName = rs.getString("fullName");
                    String trackingDate = rs.getString("trackingDate");
                    String reason = rs.getString("reason");
                    String imgTracking = rs.getString("imgTracking");
                    String birdFather = rs.getString("birdFather");
                    String birdMother = rs.getString("birdMother");
                    String status = rs.getString("status");
                    Double feePairing = rs.getDouble("feePairing");
                    int birdNestMale = rs.getInt("birdNestMale");
                    int birdNestFemale = rs.getInt("birdNestFemale");
                    Double importPriceBirdDad = rs.getDouble("priceBirdDad");
                    Double importPriceBirdMom = rs.getDouble("priceBirdMom");
                    Double fee = rs.getDouble("fee");

                    ManagerTrackingBirdDTO dto
                            = new ManagerTrackingBirdDTO(idRequiredOrder, status,
                                    reason, imgTracking, birdFather, birdMother,
                                    feePairing, fullName, importPriceBirdDad,
                                    importPriceBirdMom, fee, birdNestMale, birdNestFemale);

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

}
