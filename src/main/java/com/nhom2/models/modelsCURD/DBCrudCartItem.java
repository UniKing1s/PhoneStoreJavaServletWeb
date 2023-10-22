package com.nhom2.models.modelsCURD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.nhom2.models.Cart;
import com.nhom2.models.CartItem;
import com.nhom2.models.Product;

public class DBCrudCartItem {
    public static ArrayList<CartItem> getListOfItemByID(Connection conn, int id){
        ArrayList<CartItem> cardItems = new ArrayList<CartItem>();
        String query = "SELECT * FROM carditem where ID = ?";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = DBCrudProduct.getProductByID(conn, rs.getInt("MASP"));
                CartItem cardItem = new CartItem(rs.getInt("SLITEM"), product, 0);
                cardItem.setTongTien();
                cardItems.add(cardItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cardItems;
    }
    //Add sản phẩm lên db khi từ ko đăng nhập sang đã đăng nhập
    public static void addCardItemToDB(Connection conn, Cart card, int id){
        String qString = "insert into carditem values(?,?,?);";  
        for (CartItem cardItem : card.getCartItems()) {
            System.out.println("Do check masp cua ID");
            //System.out.println("cardItem2 = " + cardItem2.getProduct().getMasp());
            if (findItemByIDAndMaSP(conn, id, cardItem.getProduct().getMasp()) == null) {
                System.out.println("check xong không có sp trong id");
                try {
                    PreparedStatement ps = conn.prepareStatement(qString);
                    ps.setInt(1, id);
                    ps.setInt(2,cardItem.getProduct().getMasp());
                    ps.setInt(3, cardItem.getSl());
                    ps.executeUpdate();
                }
                catch (SQLException e) {
                    System.out.println("vật phẩm đã có hoặc lỗi");
                    e.printStackTrace();
                }
            }else{
                System.out.println("check xong có sp trong id");
                CartItem cardItem2 = findItemByIDAndMaSP(conn, id, cardItem.getProduct().getMasp());
                cardItem2.setSl(cardItem.getSl()+cardItem2.getSl());
                updateQuantity(conn, id , cardItem2);
            }
        } 
    }
    //Add sản phẩm lên DB khi đang đăng nhập
    public static void addCardItemToDBWithLogin(Connection conn, CartItem card, int id){
        String qString = "insert into carditem values(?,?,?);";  
            System.out.println("Do check masp cua ID");
            //System.out.println("cardItem2 = " + cardItem2.getProduct().getMasp());
            if (findItemByIDAndMaSP(conn, id, card.getProduct().getMasp()) == null) {
                System.out.println("check xong không có sp trong id");
                try {
                    PreparedStatement ps = conn.prepareStatement(qString);
                    ps.setInt(1, id);
                    ps.setInt(2,card.getProduct().getMasp());
                    ps.setInt(3, card.getSl());
                    ps.executeUpdate();
                }
                catch (SQLException e) {
                    System.out.println("vật phẩm đã có hoặc lỗi");
                    e.printStackTrace();
                }
            }else{
                System.out.println("check xong có sp trong id");
                CartItem cardItem2 = findItemByIDAndMaSP(conn, id, card.getProduct().getMasp());
                cardItem2.setSl(card.getSl()+cardItem2.getSl());
                updateQuantity(conn, id , cardItem2);
            }
    }

    //update số lượng cho vật phẩm tương ứng người dùng đã có
    public static void updateQuantity(Connection conn, int id , CartItem cardItem){
        String qString = "UPDATE carditem SET SLITEM = ? where ID = ? and MASP = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(qString);
            ps.setInt(1, cardItem.getSl());
            ps.setInt(2, id);
            ps.setInt(3, cardItem.getProduct().getMasp());
            ps.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("vật phẩm đã có hoặc lỗi");
            e.printStackTrace();
        }
    }
    private static CartItem findItemByIDAndMaSP(Connection conn, int id, int masp){
        CartItem cardItem = null;
        String query = "SELECT * FROM carditem where ID = ? and MASP = ? ";
        ResultSet rs = null;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, masp);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = DBCrudProduct.getProductByID(conn, masp);
                cardItem = new CartItem(rs.getInt("SLITEM"), product, 0);
                cardItem.setTongTien();
            }
        }
        catch (SQLException e) {
            System.out.println("vật phẩm đã có hoặc lỗi");
            e.printStackTrace();
        }
        return cardItem;
    }
    public static void deleteCardItem(Connection conn,int id, int masp){
        deleteItem(conn, id, masp);
    }
    private static void deleteItem(Connection conn,int id, int masp){
        String query = "DELETE FROM carditem where MASP = ? and ID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, masp);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
}
