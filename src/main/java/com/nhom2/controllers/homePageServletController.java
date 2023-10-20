package com.nhom2.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.nhom2.models.MySQLConnection;
import com.nhom2.models.Product;
import com.nhom2.models.modelsCURD.DBCrudProduct;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/home")
public class homePageServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         //List<Product> prod = new ArrayList<>();
        //lấy connection
        System.out.println("Lấy connection");
        Connection conn = MySQLConnection.getMySQLConnection();
        System.out.println(conn);
        //thực hiện lấy dữ liệu;
        System.out.println("lấy prod list");
        List<Product> prod = DBCrudProduct.getListOfProduct(conn);
        System.out.println("done");
        //đóng kết nối
        MySQLConnection.closeConnection(conn);
        //Load dữ liệu lên req
        req.setAttribute("list", prod);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/homePageViews.jsp");
        requestDispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }
}
