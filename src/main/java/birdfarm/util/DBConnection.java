/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package birdfarm.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author HP
 */
public class DBConnection {

    public static Connection makeConnection()
            throws /*ClassNotFoundException,*/ SQLException, NamingException, ClassNotFoundException {
        Context context = new InitialContext();
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create Connection String
        String url = "jdbc:sqlserver://"
                + "localhost:1433;"
                + "databaseName=BIRD_FARM_SHOP;"
                + "instanceName=SQLEXPRESS";
        Connection con = DriverManager.getConnection(url, "sa", "12345");
        return con;
    }
}
