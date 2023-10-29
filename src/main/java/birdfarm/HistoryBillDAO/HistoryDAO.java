/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.HistoryBillDAO;

import birdfarm.dto.HistoryDTO;
import birdfarm.dto.ManagerViewFeedbackDTO;
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
public class HistoryDAO implements Serializable {

    private List<HistoryDTO> historyList;

    public List<HistoryDTO> getHistoryList() {
        return historyList;
    }

    public void showFeedback(String idBirdNest)
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT *\n"
                        + "FROM TrackingBirdNest\n"
                        + "WHERE idBirdNest LIKE ? \n"
                        + "ORDER BY trackingDate ASC";
                stm = con.prepareCall(sql);
                stm.setString(1, "%" + idBirdNest + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String imageURL = rs.getString("imageURL");
                    String status = rs.getString("status");
                    String trackingDate = rs.getString("trackingDate");
                    String reason = rs.getString("reason");
                    
                    HistoryDTO dto
                            = new HistoryDTO(imageURL, status, trackingDate, reason);   

                    if (this.historyList == null) {
                        this.historyList = new ArrayList<>();
                    }
                    this.historyList.add(dto);
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
}
