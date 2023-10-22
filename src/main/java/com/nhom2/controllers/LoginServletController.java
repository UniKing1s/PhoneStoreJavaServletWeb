package com.nhom2.controllers;

import java.io.IOException;
import java.sql.Connection;
import com.nhom2.models.Account;
import com.nhom2.models.Cart;
import com.nhom2.models.MySQLConnection;
import com.nhom2.models.modelsCURD.DBCrudAccount;
import com.nhom2.models.modelsCURD.DBCrudCartItem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;    
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class LoginServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("cart") == null){
            Cart giohang = new Cart();
            session.setAttribute("cartCount", giohang.getCountItem());
            session.setAttribute("cart", giohang);
        }
        if (session.getAttribute("username") == null || session.getAttribute("username").toString().equals("") ) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/loginView.jsp");
            requestDispatcher.forward(req, resp);
            return;
        }    
        resp.sendRedirect("/home");  
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tk = req.getParameter("username");
        String mk = req.getParameter("password");
        //lay connection
        Connection conn = MySQLConnection.getMySQLConnection();
        //Check login
        Account acc = null;
        acc = DBCrudAccount.getAccount(conn, tk, mk);
        if (acc != null) {
            HttpSession session = req.getSession();
            session.setAttribute("ID", acc.getId());
            session.setAttribute("user", acc.getName());
            session.setAttribute("username", acc.getTk());
            session.setAttribute("role", acc.isAdmin());
            //Lấy thông tin giỏ hàng đang lưu ở session chưa đăng nhập
            Cart giohang = (Cart) session.getAttribute("cart");
            int id = Integer.parseInt(session.getAttribute("ID").toString());
            //Đưa thông tin lên db
            DBCrudCartItem.addCardItemToDB(conn, giohang,id);
            Cart gioHang1 = new Cart();
            //Load thông tin item vào giỏ hàng
            gioHang1.setCartItems(DBCrudCartItem.getListOfItemByID(conn, id));
            gioHang1.setSumtotal();
            session.setAttribute("cart", gioHang1);
            session.setAttribute("cartCount", gioHang1.getCountItem()); 
        }else{
            String thongbao = "Sai thông tin đăng nhập!!!";
            req.setAttribute("tb",thongbao );
            MySQLConnection.closeConnection(conn);
            doGet(req, resp);
            return;
        }
        MySQLConnection.closeConnection(conn);
        resp.sendRedirect("home");
    }
}
