package com.nhom2.controllers.product;

import java.io.IOException;
import java.sql.Connection;
import com.nhom2.models.MySQLConnection;
import com.nhom2.models.modelsCURD.DBCrudProduct;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/delete")
public class DeleteProductServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("role") != null && session.getAttribute("role").toString().equals("true") ) {
            int id = Integer.parseInt(req.getParameter("id"));
            Connection conn = MySQLConnection.getMySQLConnection();
            DBCrudProduct.deleteProduct(conn, id);
            MySQLConnection.closeConnection(conn);
        }
        resp.sendRedirect("managerProduct");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }
}
