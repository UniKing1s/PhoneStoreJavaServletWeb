package com.nhom2.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet("/search")
public class SearchProductByNameServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        searchProduct(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }
    protected void searchProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //lấy định dạng chữ có dấu 
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String txt = req.getParameter("tensp");
        Connection conn = MySQLConnection.getMySQLConnection();
        List<Product> list = DBCrudProduct.getListOfProductByName(conn, txt);
        MySQLConnection.closeConnection(conn);
        PrintWriter out = resp.getWriter();
        req.setAttribute("list", list);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/searchData.jsp");
        requestDispatcher.forward(req, resp);
    }
}
