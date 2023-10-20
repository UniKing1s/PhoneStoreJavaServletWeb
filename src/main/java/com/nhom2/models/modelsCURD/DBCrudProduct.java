package com.nhom2.models.modelsCURD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nhom2.models.Product;

public class DBCrudProduct {
    public static List<Product> getListOfProduct(Connection conn){
        List<Product> listProd = new ArrayList<>();
        String query = "SELECT * FROM sanpham";
        ResultSet rs = null;
        try {
            System.out.println("do get list");
            PreparedStatement ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("MASP");
                String nameProduct = rs.getString("TENSP");
                int sl = rs.getInt("SL");
                double dongia = rs.getDouble("DONGIA");
                double giamgia = rs.getDouble("GIAMGIA");
                String tag = rs.getString("TAG");
                String mota = rs.getString("MOTA");
                int mahang = rs.getInt("MAHANG");
                int maloai = rs.getInt("MALOAI");
                String imgUrl = rs.getString("IMGURL");
                int idpap = rs.getInt("IDPAP");//id người thêm
                Product pro = new Product(id, nameProduct, sl, dongia, giamgia, tag, mota, mahang, maloai, imgUrl, idpap);
                listProd.add(pro);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi ở đây");
            e.printStackTrace();
        }
        return listProd;
    }
    public static void updateProduct(Connection conn, Product prod){
        String query = "UPDATE sanpham SET TENSP = ?, SL = ? , DONGIA = ? , MOTA = ? , MAHANG = ? , MALOAI = ? , IMGURL = ?, IDPAP =? , GIAMGIA = ? , TAG = ? where MASP = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, prod.getTensp());
            ps.setInt(2, prod.getSl());
            ps.setDouble(3, prod.getGiasp());
            ps.setString(4, prod.getMota());
            ps.setInt(5, prod.getMahang());
            ps.setInt(6, prod.getMaloai());
            ps.setString(7, prod.getImgURL());
            ps.setInt(8, prod.getIdNguoiThem());
            ps.setDouble(9, prod.getGiamgia());
            ps.setString(10, prod.getTag());
            ps.setInt(11, prod.getMasp());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static Product getProductByID(Connection conn, int id){
        Product prod = null;
        String query = "SELECT * FROM sanpham where MASP = ?";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                int idPro = rs.getInt("MASP");
                String nameProduct = rs.getString("TENSP");
                int sl = rs.getInt("SL");
                double dongia = rs.getDouble("DONGIA");
                double giamgia = rs.getDouble("GIAMGIA");
                String tag = rs.getString("TAG");
                String mota = rs.getString("MOTA");
                int mahang = rs.getInt("MAHANG");
                int maloai = rs.getInt("MALOAI");
                String imgUrl = rs.getString("IMGURL");
                int idpap = rs.getInt("IDPAP");
                prod = new Product(id, nameProduct, sl, dongia, giamgia, tag, mota, mahang, maloai, imgUrl, idpap);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return prod;
    }
    public static void addProduct(Connection conn, Product prod){
        String query ="INSERT INTO sanpham values(?,?,?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setNull(1, 0);
            ps.setString(2, prod.getTensp());
            ps.setInt(3, prod.getSl());
            ps.setDouble(4, prod.getGiasp());
            ps.setDouble(5, prod.getGiamgia());
            ps.setString(6, prod.getTag());
            ps.setString(7, prod.getMota());
            ps.setInt(8, prod.getMahang());
            ps.setInt(9, prod.getMaloai());
            ps.setString(10, prod.getImgURL());
            ps.setInt(11, prod.getIdNguoiThem());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void deleteProduct(Connection conn, int id){
        String query = "DELETE FROM sanpham where MASP = ? ";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
}

