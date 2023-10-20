package com.nhom2.models.modelsCURD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nhom2.models.Product;
import com.nhom2.models.Hang;
import com.nhom2.models.Loai;

public class DBCrudCategory {
    public static List<Loai> GetListLoai(Connection conn){
        List<Loai> loais = new ArrayList<>();
        String query = "SELECT * FROM loai";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maloai = rs.getInt("MALOAI");
                String tenloai = rs.getString("TENLOAI");
                Loai loai = new Loai(maloai, tenloai);
                loais.add(loai);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loais;
    }
    public static List<Hang> GetListHang(Connection conn){
        List<Hang> hangs = new ArrayList<>();
        String query = "SELECT * FROM hang";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int mahang = rs.getInt("MAHANG");
                String tenhang = rs.getString("TENHANG");
                Hang loai = new Hang(mahang, tenhang);
                hangs.add(loai);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hangs;
    }
}
