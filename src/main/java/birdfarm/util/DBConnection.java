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
import javax.sql.DataSource;

/**
 *
 * @author Admin
 */


public class DBConnection {

    public static Connection makeConnection()
            throws /*ClassNotFoundException,*/ SQLException, NamingException, ClassNotFoundException {
//        //1. Get current context
//        Context currentContext = new InitialContext();
//        //2. Get web app server context
//        Context tomcatContext =(Context)currentContext.lookup("java:comp/env");
//        //3. Look up DS from web app context
//        DataSource ds = (DataSource)tomcatContext.lookup("DSSE1729");
//        //4. Get connection
//        Connection con = ds.getConnection();      
//        return con;
        //1.Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create Connection String
         String url = "jdbc:sqlserver://"
                + "localhost:1433;"
                + "databaseName=BIRD_FARM_SHOP";
        //3. Open Connection
        Connection con = DriverManager.getConnection(url, "sa", "12345");
        //4. Return connection to caller
        return con;
    }
}
