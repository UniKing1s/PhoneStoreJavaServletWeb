<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
                <form action="addProduct" method="post">
                    <button class="btn btn-primary" type="submit"
                        style="width: 200px; height: 50px; font-weight: bold; ">Thêm Sản phẩm</button>
                </form>
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

                            <tr style="text-align: center;">
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td><a href="" style="color: black;font-weight: bold; background-color: aqua;">Edit</a>
                                </td>
                                <td><a href=""
                                        style="color: white;font-weight: bold; background-color: darkred;">Delete</a>
                                </td>
                            </tr>
                        </table>
                        <hr class="mb-4" />
                        <div style="display: block; margin: auto; font-weight: bold;">Page Number</div>
                        <form action="" method="post">
                            <button class="btn btn-primary" type="submit" style="width: 4%; text-align: center;" name="pagenumber" value="1">1</button>
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
