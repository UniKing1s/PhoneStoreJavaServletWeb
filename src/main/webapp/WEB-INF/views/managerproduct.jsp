<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="java.text.NumberFormat" %>

<%
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Phone Store</title>
    <!--icon for tittle-->
    <link rel="icon" href="img/Nhom-2-Phone.ico" type="image/x-icon" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="css/mdb.min.css" />
    <!-- Custom styles -->
    <link rel="stylesheet" href="css/style.css" />

</head>

<body>
    <!--header-->
    <jsp:include page="header.jsp">
        <jsp:param name="username" value="${sessionScope.username}" />
        <jsp:param name="role" value="${sessionScope.role}" />
    </jsp:include>
    <!--Main layout-->
    <main class="mt-5 pt-4">
        <div class="container" style="width: auto;">
            <!-- Heading -->
            <h2 class="my-5 text-center">
                <a class="btn btn-primary" href="addproduct" style="width: 200px; height: 50px; font-weight: bold;text-align: center; ">Thêm Sản phẩm</a>
            </h2>
            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                    <!--Card-->
                    
                        <table>
                            <tr style="font-weight: bold; text-align: center;">
                                <td>ID</td>
                                <td>Tên Sản Phẩm</td>
                                <td>Số lượng</td>
                                <td>Đơn giá</td>
                                <td>Giảm giá</td>
                                <td>Tag</td>
                                <td>Mô tả</td>
                                <td>Mã Hàng</td>
                                <td>Mã Loại</td>
                                <td>ImgURL</td>
                                <td>IDPAP</td>
                            </tr>
                            <c:if test="${not empty list}">
                                <%  double currentValue=0.0; 
                                    String formattedCurrentMoneyValue;
                                %>
                                <c:forEach var="p" items="${list}">
                                    <tr style="text-align: center;border-bottom: 1pt solid black;">
                                        <td>${p.masp}</td>
                                        <td>${p.tensp}</td>
                                        <td>${p.sl}</td>
                                        <td>
                                            <c:set var="currentMoney" value="${p.giasp}" />
                                            <%
                                                if (pageContext.getAttribute("currentMoney") !=null) {
                                                currentValue = Double.parseDouble(pageContext.getAttribute("currentMoney").toString()); } 
                                                formattedCurrentMoneyValue = currencyFormat.format(currentValue); 
                                            %>
                                            
                                            <%= formattedCurrentMoneyValue %>
                                            
                                        </td>
                                        <td>
                                            <c:set var="number" value="${p.giamgia}"/>
                                            <c:set var="stringValue" value="${String.format('%.0f', number)}" />${stringValue}
                                        </td>
                                        <td>${p.tag}</td>
                                        <td>${p.mota}</td>
                                        <td>${p.mahang}</td>
                                        <td>${p.maloai}</td>
                                        <td><a href="${p.imgURL}" style="color: black;">${p.imgURL}</a></td>
                                        <td>${p.idNguoiThem}</td>
                                        <td><a href="edit?id=${p.masp}" style="color: black;font-weight: bold; background-color: aqua;">Edit</a>
                                        </td>
                                        <td><a href="delete?id=${p.masp}"
                                                style="color: white;font-weight: bold; background-color: darkred;">Delete</a>
                                        </td>
                                    </tr>
                                    
                                    
                                </c:forEach>
                            </c:if>
                        </table>
                        <hr class="mb-4" />
                    <!--/.Card-->
            </div>
            <!--Grid row-->
        </div>
    </main>
    <!--Main layout-->











    <!--footer-->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="js/script.js"></script>
</body>

</html>
