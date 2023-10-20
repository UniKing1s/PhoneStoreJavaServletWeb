package com.nhom2.controllers;

import java.io.IOException;
import java.sql.Connection;

import com.nhom2.models.MySQLConnection;
import com.nhom2.models.Product;
import com.nhom2.models.modelsCURD.DBCrudProduct;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/product")
public class ProductInforServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
    @Override
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doOptions(req, resp);
    }
}
