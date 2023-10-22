package com.nhom2.models.modelsCURD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.nhom2.models.Account;

public class DBCrudAccount {
    public static void addAccount(Connection conn, Account acc){
        String query ="INSERT INTO account values(?,?,?,?,?,?,?);";
        try {
            Date date = new Date();
            java.sql.Timestamp dat = new java.sql.Timestamp(date.getTime());
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setNull(1, 0);
            ps.setString(2, acc.getTk());
            ps.setString(3, acc.getMk());
            ps.setString(4, acc.getEmail());
            ps.setTimestamp(5, dat);
            ps.setString(6, acc.getName());
            if(!acc.isAdmin()){
                ps.setInt(7, 2);
            }else{
                ps.setInt(7, 1);
            }
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static boolean CheckAccount(Connection conn, Account acc){
        String query = "SELECT * FROM account where USERNAME = ?;";
        ResultSet rs = null;
        boolean check = false;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            System.out.println(acc.getTk());
            ps.setString(1, acc.getTk());
            rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                i++;
            }
            System.out.println("Gia tri cua i: "+i);
            if (i == 0) {
                check = false;
            }else{
                check = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Check account fail");
        }
        return check;
    }
    public static boolean CheckLogin(Connection conn , String tk, String mk){
        String query = "SELECT * FROM account where USERNAME = ? and PASSWORD = ?";
        ResultSet rs = null;
        boolean check = false;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, tk);
            ps.setString(2, mk);
            rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                i++;
            }
            if (i == 0) {
                check = false;
            }else{
                check = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }
    public static Account getAccount(Connection conn , String tk, String mk){
        String query = "SELECT * FROM account where USERNAME = ? and PASSWORD = ?";
        Account acc = null;
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, tk);
            ps.setString(2, mk);
            boolean admin = false;
            rs = ps.executeQuery();
            
            while (rs.next()) {
                if (rs.getInt("ISADMIN") == 1) {
                admin = true;
                }
                acc = new Account(rs.getInt("ID"), tk, mk, rs.getString("EMAIL"), rs.getTimestamp("TIMESIGNIN"), rs.getString("NAME"), admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return acc;
    }
}
