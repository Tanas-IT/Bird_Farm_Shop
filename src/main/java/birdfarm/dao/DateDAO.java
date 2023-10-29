/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.DateDTO;
import birdfarm.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author HP
 */
public class DateDAO {

    public int CountDayByStartEnd(String start, String end) throws NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "SELECT DATEDIFF(day, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, start);
                stm.setString(2, end);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1) + 1;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public DateDTO get7day() throws NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select GETDATE(), GETDATE()-6";

                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    DateDTO date = DateDTO.builder()
                            .start(rs.getDate(2))
                            .end(rs.getDate(1))
                            .build();
                    return date;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
