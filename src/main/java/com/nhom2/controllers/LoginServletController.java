package com.nhom2.controllers;

import java.io.IOException;
import java.sql.Connection;

import org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.sym;

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
@WebServlet("/login")
public class LoginServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("username") == null || session.getAttribute("username").toString().equals("") ) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/loginView.jsp");
            requestDispatcher.forward(req, resp);
            return;
        }    
        resp.sendRedirect("home");  
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
        MySQLConnection.closeConnection(conn);
        if (acc != null) {
            MySQLConnection.closeConnection(conn);
            HttpSession session = req.getSession();
            session.setAttribute("ID", acc.getId());
            session.setAttribute("username", acc.getTk());
            System.out.println("admin? :" + acc.isAdmin());
            session.setAttribute("role", acc.isAdmin());
        }else{
            String thongbao = "Sai thông tin đăng nhập!!!";
            req.setAttribute("tb",thongbao );
            System.out.println("Sai thong tin đăng nhập");
            doGet(req, resp);
            return;
        }
        resp.sendRedirect("home");
    }
}
