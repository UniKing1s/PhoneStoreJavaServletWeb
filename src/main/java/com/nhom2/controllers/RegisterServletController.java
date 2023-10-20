package com.nhom2.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import com.nhom2.models.Account;
import com.nhom2.models.MySQLConnection;
import com.nhom2.models.modelsCURD.DBCrudAccount;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/register")
public class RegisterServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("username") == null || session.getAttribute("username").toString().equals("") ) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/registerView.jsp");
            requestDispatcher.forward(req, resp);
            return;
        } 
        resp.sendRedirect("home");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tk = req.getParameter("username");
        String mk = req.getParameter("password");
        String mkRe = req.getParameter("repassword");
        String email = req.getParameter("email");
        String name = req.getParameter("name");
        boolean isAdmin = false;
        boolean success;
        try {
            if(req.getParameter("admin").equals("admin")){
                isAdmin = true;
            }
        } catch (Exception e) {
        }
        String thongbao = null;
        if (!mk.equals(mkRe)) {
            thongbao = "Mật khẩu không trùng khớp";
            System.out.println(thongbao);
            success = false;
            req.setAttribute("success", success);
            req.setAttribute("tb", thongbao);
        }else{
            //lấy connection
            Connection conn = MySQLConnection.getMySQLConnection();
            Account acc = new Account(0, tk, mk, email, null, name, isAdmin);
            System.out.println(DBCrudAccount.CheckAccount(conn, acc));
            if(!DBCrudAccount.CheckAccount(conn, acc)) {
                System.out.println("thực hiện dk");
                //thực hiện thêm tài khoản;
                DBCrudAccount.addAccount(conn, acc);
                MySQLConnection.closeConnection(conn);
                success = true;
                thongbao = "Đăng ký thành công";
                req.setAttribute("tb", thongbao);
                req.setAttribute("success", success);
                System.out.println("Đã tạo tk thành công");
            }else{
                System.out.println("Không thực hiện dk");
                thongbao = "Tên đăng nhập đã tồn tại";
                MySQLConnection.closeConnection(conn);
                req.setAttribute("tb", thongbao);
                success = false;
                req.setAttribute("success", success);
                // TODO: handle exception
            }
        }
        System.out.println("Trả về thông báo");
        doGet(req, resp);
    }
}
