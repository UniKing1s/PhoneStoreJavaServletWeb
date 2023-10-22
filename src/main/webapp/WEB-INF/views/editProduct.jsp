<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%--format number--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.DecimalFormat" %>
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
        <div class="container">
            <!-- Heading -->
            <h2 class="my-5 text-center">Sửa Sản Phẩm</h2>
            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                <!--Card-->
                <form action="" method="post">
                    <div class="card p-4">
                        <!--Grid row-->
                        <div class="input-group mb-4">
                            <!--Grid column-->
                            <!--Tên Sản phẩm-->
                            <div class="form-outline">
                                <input type="text" id="typeText" name="id" class="form-control"  value="${p.masp}" readonly />
                                <label class="form-label" for="typeText">Mã sản phẩm</label>
                            </div>
    
                            <!--Grid column-->
                            <!--Grid column-->
                        </div>
                        <div class="input-group mb-4">
                            <!--Grid column-->
                            <!--Tên Sản phẩm-->
                            <div class="form-outline">
                                <input type="text" id="typeText" name="tensp" class="form-control"  value="${p.tensp}" required />
                                <label class="form-label" for="typeText">Tên Sản Phẩm</label>
                            </div>
    
                            <!--Grid column-->
                            <!--Grid column-->
                        </div>
                        <!--Grid row-->
    
                        <!--Số lượng-->
                        <div class="input-group mb-4">
                            <div class="form-outline">
                                <input type="number" id="typeText" name="sl" class="form-control" value="${p.sl}" required />
                                <label class="form-label" for="typeText">Số lượng</label>
                            </div>
                        </div>
    
                        <!--Đơn Giá-->
    
                        <div class="input-group mb-4">
                            <div class="form-outline">
                                <c:set var="gia" value="${p.giasp.toString()}" />
                                <%
                                    double number = 0.0;
                                    if (pageContext.getAttribute("gia") != null) {
                                        number = Double.parseDouble(pageContext.getAttribute("gia").toString());
                                      }
                                    DecimalFormat decimalFormat = new DecimalFormat("#");
                                    String formattedNumber = decimalFormat.format(number);
                                %>
                                <input type="number" id="typeText" name="giasp" class="form-control" required value="<%=formattedNumber%>" />
                                <label class="form-label" for="typeText">Đơn giá (đ)</label>
                            </div>
                        </div>
    
                        <!--Giảm Giá-->
                        <div class="input-group mb-4">
                            <div class="form-outline">
                                <c:set var="giam" value="${p.giamgia.toString()}" />
                                <%
                                    double giamgia = 0.0;
                                    if (pageContext.getAttribute("giam") != null) {
                                        giamgia = Double.parseDouble(pageContext.getAttribute("giam").toString());
                                      }
                                    formattedNumber = decimalFormat.format(giamgia);
                                %>
                                <input type="number" id="typeText" name="giamgia" class="form-control" value="<%=formattedNumber%>"/>
                                <label class="form-label" for="typeText">Giảm giá (%)</label>
                            </div>
                        </div>
                        <!--Tag-->
                        <div class="input-group mb-4">
                            <div class="form-outline">
                                <input type="text" id="typeText" name="tag" class="form-control" value="${p.tag}"/>
                                <label class="form-label" for="typeText">Tag (Best Seller)</label>
                            </div>
                        </div>
                        <!--Mô tả-->
                        <div class="input-group mb-4">
                            <div class="form-outline">
                                <input type="text" id="typeText" name="mota" class="form-control" value="${p.mota}"/>
                                <label class="form-label" for="typeText">Mô tả</label>
                            </div>
                        </div>
                        <!--Mã hàng-->
                        <div class="input-group mb-4">
                            <label for="cars" style="padding-right: 10px;">Mã hãng:</label>
                            <select id="cars" name="mahang" required>
                                <c:if test="${not empty hangs}">
                                    <c:forEach var="hang" items="${hangs}">
                                        <c:choose>
                                            <c:when test="${hang.maHang == p.mahang}">
                                                <option value="${hang.maHang}" selected>${hang.tenHang}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${hang.maHang}">${hang.tenHang}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <!--Mã loại-->
                        <div class="input-group mb-4">
                            <label for="cars" style="padding-right: 10px;">Mã loại:</label>
                            <select id="cars" name="maloai" required>
                                <c:if test="${not empty loais}">
                                    <c:forEach var="loai" items="${loais}">
                                        <c:choose>
                                            <c:when test="${loai.maloai == p.maloai}">
                                                <option value="${loai.maloai}" selected>${loai.tenloai}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${loai.maloai}">${loai.tenloai}</option>
                                            </c:otherwise>
                                        </c:choose>
                                        
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <!--Img text-->
                        <div class="input-group mb-4">
                            <div class="form-outline">
                                <input type="text" id="typeText" name="imgUrl" class="form-control" value="${p.imgURL}" required />
                                <label class="form-label" for="typeText">Image URL (372 x 461)</label>
                            </div>
                        </div>
                        <div>
                            <a href="https://imgur.com/upload">
                                Up ảnh sản phẩm lên đây và đưa vào Image URL!!
                            </a>
                        </div>
                        <hr class="mb-4" />
                        <div class="row mb-3">
                            <!--Grid column-->
                            <div class="col-md-6 mb-2">
                                <!--firstName-->
                                <button class="btn btn-primary" style="width: 100%; max-width: 672 px; text-align: center;"
                                    type="submit">Sửa</button>
                            </div>
                            <div class="col-md-6 mb-2">
                                <!--firstName-->
                                <a href="managerProduct" class="btn btn-primary"
                                    style=" background-color: #3b71ca ; text-align: center;width: 100%; max-width: 672 px;"
                                    target="_blank">
                                    <font style="color: white;"><b>Hủy</b></font>
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
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
