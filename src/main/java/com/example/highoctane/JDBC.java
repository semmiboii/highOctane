package com.example.highoctane;
import java.sql.*;

public class JDBC {
    private static Connection con = null;
        static{
            try{
                Class.forName("org.h2.Driver");
                con = DriverManager.getConnection("jdbc:h2:~/highOctane","sa","");
            }catch (Exception e){
                e.getStackTrace();
            }
        }

    public static Connection getCon(){
            return con;
    }
}
