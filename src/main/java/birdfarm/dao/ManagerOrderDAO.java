/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.dao;

import birdfarm.dto.Chart;
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
public class ManagerOrderDAO implements Serializable {

    public List<Chart> getChartRevenueArea(String idOrder, String start, int day) throws SQLException, NamingException, ClassNotFoundException {
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
                            + "FROM [Order]\n"
                            + "WHERE idOrder " + idOrder + "\n"
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

    public List<Chart> getTotalOrder(String start, int day) throws 
            SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Chart> list = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            int value = 0;
            try {
                con = DBConnection.makeConnection();
                if (con != null) {
                    String sql = "SELECT COUNT(*) FROM [Order] "
                            + "WHERE createdDate <= DATEADD(DAY, ?, ?) "
                            + "AND createdDate >= ? ";

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
            } finally {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            }

        }
        return list;
    }
    
    
}
