<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%--Numberformatlibrary--%>
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
    <jsp:include page = "header.jsp">
      <jsp:param name="username" value="${sessionScope.username}" />
      <jsp:param name="role" value="${sessionScope.role}" />
      <jsp:param name="cartCount" value="${sessionScope.cartCount}" />
      <jsp:param name="user" value="${sessionScope.user}" />
    </jsp:include>
    


<!--Main layout-->
<main class="mt-5 pt-4">
    <div class="container" style="width: auto;">
        <!-- Heading -->
        <h2 class="my-5 text-center">
            <a class="btn btn-primary" href=""
                style="width: 200px; height: 50px; font-weight: bold;text-align: center; ">Giỏ Hàng</a>
        </h2>
        <!--Grid row-->
        <div class="row">
            <!--Grid column-->

            <!--Card-->
            <div class="card p-4">
                <table>
                    <tr style="font-weight: bold; text-align: center;">
                        <td>Ảnh</td>
                        <td>Tên Sản Phẩm</td>
                        <td>Số lượng</td>
                        <td>Đơn giá</td>
                        <td>Giảm giá</td>
                        <td>Tổng giá</td>
                    </tr>
                    <%  double currentValue=0.0; 
                        String formattedCurrentMoneyValue;
                    %>
                    <c:if test="${not empty cart}">
                            <c:forEach var="item" items="${sessionScope.cart.cartItems}">
                                <tr style="text-align: center;">
                                    <form action="updatecard" method="post">
                                        <td><img src="${item.product.imgURL}" width="75"
                                                height="100" /></td>
                                        <td>${item.product.tensp}</td>
                                        <td>
                                            <input type="number" name="sl" style="width: 20%;" min="1" value="${item.sl}">
                                        </td>
                                        <td>
                                            <c:set var="currentMoney" value="${item.product.giasp}"/>
                                            <%
                                                if (pageContext.getAttribute("currentMoney") !=null) {
                                                currentValue = Double.parseDouble(pageContext.getAttribute("currentMoney").toString()); } 
                                                formattedCurrentMoneyValue = currencyFormat.format(currentValue); 
                                            %>
                                                <%= formattedCurrentMoneyValue %>
                                        </td>
                                        <td>
                                            <c:set var="number" value="${item.product.giamgia}"/>
                                            <c:set var="stringValue" value="${String.format('%.0f', number)}" />${stringValue} %
                                        </td>
                                        <td>
                                            <c:set var="totalMoney" value="${item.tongTien}"/>
                                            <%
                                                if (pageContext.getAttribute("totalMoney") !=null) {
                                                currentValue = Double.parseDouble(pageContext.getAttribute("totalMoney").toString()); } 
                                                formattedCurrentMoneyValue = currencyFormat.format(currentValue); 
                                            %>
                                                <%= formattedCurrentMoneyValue %>
                                        </td>
                                        <td><input type="number" name="masp" value="${item.product.masp}" hidden readonly><button type="submit" class="btn btn-primary" style="color: white;font-weight: bold;">Cập nhật</button></td>
                                        
                                        <td><a href="deleteItem?masp=${item.product.masp}" class="btn btn-primary" style="color: white;font-weight: bold;">Delete</a>
                                        </td>
                                    </form>
                                </tr>
                            </c:forEach>

                        </c:if>
                    
                </table>
                <hr class="mb-4" />
                    <c:if test="${not empty cardTotal}">
                        <div class="btn btn-primary" style="display: block; margin: auto; font-weight: bold;text-align: center;">
                            <c:set var="total" value="${cardTotal}"/> 
                                            <%
                                                if (pageContext.getAttribute("total") !=null) {
                                                currentValue = Double.parseDouble(pageContext.getAttribute("total").toString()); } 
                                                formattedCurrentMoneyValue = currencyFormat.format(currentValue); 
                                            %>
                                            Tổng tiền: <%= formattedCurrentMoneyValue %>
                            </div>
                        <br>
                        <br>
                        <button class="btn btn-primary" type="button" style="text-align: center;">Thanh Toán
                        </button>  
                    </c:if>              
            </div>
            <!--/.Card-->

            <!--Grid column-->

            <!--Grid column-->

            <!--Grid column-->
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
