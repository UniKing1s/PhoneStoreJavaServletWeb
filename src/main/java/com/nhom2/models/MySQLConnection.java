package com.nhom2.models;
import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLConnection {
    public static Connection getMySQLConnection(){
        String hostName ="localhost";
        String dbName = "phonestore";//"englishdictionary";"sql12652748";
        String userName = "root";//"sql12652748";//"root" ;
        String password = "khoivo99122";//"iJCrQj1X2G";//"khoivo99122";
        return getConnection(hostName, dbName, userName, password);
    }
    private static Connection getConnection(String hostName, String dbName, String userName, String password){
        String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
        Connection conn = null;
        // load driver 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(connectionURL, userName, password);
        } catch (Exception e) {
            // TODO: handle exception
        }
        return conn;
    }
    public static void closeConnection(Connection conn){
        try {
            if(conn != null)
                conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

