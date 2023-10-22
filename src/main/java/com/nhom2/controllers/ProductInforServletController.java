package com.nhom2.controllers;

import java.io.IOException;
import java.sql.Connection;

import com.nhom2.models.Cart;
import com.nhom2.models.CartItem;
import com.nhom2.models.MySQLConnection;
import com.nhom2.models.Product;
import com.nhom2.models.modelsCURD.DBCrudCartItem;
import com.nhom2.models.modelsCURD.DBCrudProduct;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/product")
public class ProductInforServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showProductInformation(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doAddItemToCart(req, resp);
    }
    private void doAddItemToCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int masp = Integer.parseInt(req.getParameter("id"));
        int sl = Integer.parseInt(req.getParameter("soluong"));
        HttpSession session = req.getSession();
        Cart giohang = (Cart) session.getAttribute("cart");
        Connection conn = MySQLConnection.getMySQLConnection();
        Product product = DBCrudProduct.getProductByID(conn, masp);
        CartItem cardItem = null;
        if(product != null){
            cardItem = new CartItem(sl, product, 0);
            cardItem.setTongTien();
        }       
        //Nếu đã đăng nhập vật phẩm dc đưa vào database 
        if(session.getAttribute("ID") != null){
            int IDP = Integer.parseInt(session.getAttribute("ID").toString());
            DBCrudCartItem.addCardItemToDBWithLogin(conn, cardItem, IDP);
            Cart card = new Cart();
            card.setCartItems(DBCrudCartItem.getListOfItemByID(conn, IDP)); 
            card.setSumtotal();
            session.setAttribute("cart", card);
            session.setAttribute("cartCount", card.getCountItem());
        //chưa đăng nhập sản phẩm chỉ lưu trong session 
        }else{
            giohang.addItem(cardItem);
            giohang.setSumtotal();
            session.setAttribute("cart", giohang);
            session.setAttribute("cartCount", giohang.getCountItem());
        }
        MySQLConnection.closeConnection(conn);
        doGet(req, resp);
    }
    private void showProductInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Set card khi truy cập bất kì trang nào
        HttpSession session = req.getSession();
        if(session.getAttribute("cart") == null){
            Cart giohang = new Cart();
            session.setAttribute("cartCount", giohang.getCountItem());
            session.setAttribute("cart", giohang);
        }
        String masp = req.getParameter("masp");
        int maspProd = Integer.parseInt(masp);
        //lấy connection
        Connection conn = MySQLConnection.getMySQLConnection();
        //Tìm SP liệu liên quan
        Product prod = DBCrudProduct.getProductByID(conn, maspProd);
        //ngắt kết nối
        MySQLConnection.closeConnection(conn);
        req.setAttribute("product", prod);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/productInformationView.jsp");
        requestDispatcher.forward(req, resp);
    }
}
