package com.nhom2.controllers.product;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.nhom2.models.Hang;
import com.nhom2.models.Loai;
import com.nhom2.models.MySQLConnection;
import com.nhom2.models.Product;
import com.nhom2.models.modelsCURD.DBCrudCategory;
import com.nhom2.models.modelsCURD.DBCrudProduct;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/edit")
public class EditProductServletController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("role") != null && session.getAttribute("role").toString().equals("true") ) {
            int id = Integer.parseInt(req.getParameter("id"));
            Connection conn = MySQLConnection.getMySQLConnection();
            Product product = null;
            product = DBCrudProduct.getProductByID(conn, id);

            //get loais
            List<Loai> loais = DBCrudCategory.GetListLoai(conn);
            //setAttribute loais
            req.setAttribute("loais", loais);
            //get hangs
            List<Hang> hangs = DBCrudCategory.GetListHang(conn);
            MySQLConnection.closeConnection(conn);
            req.setAttribute("hangs", hangs);
            req.setAttribute("p", product);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/editProduct.jsp");
            requestDispatcher.forward(req, resp);
        }else{
            resp.sendRedirect("home");
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = MySQLConnection.getMySQLConnection();
        //Lấy giá trị từ trang sửa
        int masp = Integer.parseInt(req.getParameter("id"));
        String tensp = req.getParameter("tensp");
        int sl = Integer.parseInt(req.getParameter("sl"));
        double giasp = Double.parseDouble(req.getParameter("giasp"));
        double giamgia = Double.parseDouble(req.getParameter("giamgia"));
        String tag = req.getParameter("tag");
        String mota = req.getParameter("mota");
        int mahang = Integer.parseInt(req.getParameter("mahang"));
        int maloai = Integer.parseInt(req.getParameter("maloai"));
        String imgURL = req.getParameter("imgUrl");
        int idNguoiThem = 1;
        Product product = new Product(masp, tensp, sl, giasp, giamgia, tag, mota, mahang, maloai, imgURL, idNguoiThem);
        DBCrudProduct.updateProduct(conn, product);
        MySQLConnection.closeConnection(conn);
        resp.sendRedirect("home");
    }
}
