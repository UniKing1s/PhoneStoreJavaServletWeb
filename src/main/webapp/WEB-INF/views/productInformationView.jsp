<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Sản Phẩm</title>
    <!--icon-->
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
    <jsp:include page = "header.jsp"></jsp:include>
    <!--Main layout-->
<main class="mt-5 pt-4">
  <div class="container mt-5">
      <!--Grid row-->
      <div class="row">
          <!--Grid column-->
          <div class="col-md-6 mb-4">
              <img src="img/i15.jpg" class="img-fluid" alt="" />
          </div>
          <!--Grid column-->

          <!--Grid column-->
          <div class="col-md-6 mb-4">
              <!--Content-->
              <div class="p-4">
                  <div class="mb-3">
                      <a href="">
                          <span class="badge bg-dark me-1">Category 2</span>
                      </a>
                      <a href="">
                          <span class="badge bg-info me-1">New</span>
                      </a>
                      <a href="">
                          <span class="badge bg-danger me-1">Bestseller</span>
                      </a>
                  </div>

                  <p class="lead">
                    <!--
                      <span class="me-1">
                          <del>30.000.000đ</del>
                      </span>-->
                      <span>33.000.000đ</span>
                  </p>

                  <strong><p style="font-size: 20px;">Mô tả</p></strong>

                  <p>Mẫu Iphone mới vừa được ra mắt</p>

                  <form class="d-flex justify-content-left">
                      <!-- Default input -->
                      <div class="form-outline me-1" style="width: 100px;">
                          <input type="number" value="1" class="form-control" />
                      </div>
                      <button class="btn btn-primary ms-1" type="submit">
                          Add to cart
                          <i class="fas fa-shopping-cart ms-1"></i>
                      </button>
                  </form>
              </div>
              <!--Content-->
          </div>
          <!--Grid column-->
      </div>
      <!--Grid row-->
  </div>
</main>
<!--Main layout-->
  <!--footer-->
  <jsp:include page = "footer.jsp"></jsp:include>
    <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>

