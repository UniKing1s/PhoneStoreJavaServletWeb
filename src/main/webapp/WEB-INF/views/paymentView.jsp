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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    

  </head>
  <body>
    <!--header-->
    <jsp:include page = "header.jsp">
      <jsp:param name="username" value="${sessionScope.username}" />
      <jsp:param name="role" value="${sessionScope.role}" />
      <jsp:param name="cartCount" value="${sessionScope.cartCount}" />
      <jsp:param name="user" value="${sessionScope.user}" />
    </jsp:include>

    <!--header-->
    





   <!--Main layout-->
  <!--Main layout-->
<main class="mt-5 pt-4">
    <div class="container">
        <!-- Heading -->
        <h2 class="my-5 text-center">Thanh toán</h2>

        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col-md-8 mb-4">
                <!--Card-->
                <div class="card p-4">
                    <!--Grid row-->
                    
                        <!--Grid column-->
                    <div class="input-group mb-4">
                            <!--name-->
                        <div class="form-outline">
                            <input type="text" id="typeText" class="form-control" />
                            <label class="form-label" for="typeText">Tên người nhận</label>
                        </div>
                    </div>
                    <!--Grid column-->

                   
                    <!--Grid row-->

                    <!--Phonenumber-->
                    <div class="input-group mb-4">
                        <div class="form-outline">
                            <input type="text" id="typeText" class="form-control" />
                            <label class="form-label" for="typeText">Số điện thoại</label>
                        </div>                    
                    </div>

                    <!--email-->
                    
                    <div class="form-outline mb-4">
                        <div class="form-outline">
                            <input type="text" id="typeText" class="form-control" />
                            <label class="form-label" for="typeText">Email</label>
                        </div>
                    </div>

                    <!--address-->
                    <div class="form-outline mb-4">
                        <div class="form-outline">
                            <input type="text" id="typeText" class="form-control" />
                            <label class="form-label" for="typeText">Địa chỉ giao hàng</label>
                        </div>                    
                    </div>

                    <div class="my-3">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked />
                            <label class="form-check-label" for="flexRadioDefault1"> Credit card </label>
                        </div>

                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" />
                            <label class="form-check-label" for="flexRadioDefault2"> Debit card </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" />
                            <label class="form-check-label" for="flexRadioDefault3"> Paypal </label>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6 mb-3">
                            <p class="mb-0">
                                Name on card
                            </p>
                            <div class="form-outline">
                                <input type="text" class="form-control"/>
                                <div class="form-helper">Full name as displayed on card</div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <p class="mb-0">
                                Credit card number
                            </p>
                            <div class="form-outline">
                                <input type="text" class="form-control" />                                
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <p class="mb-0">
                                Expiration
                            </p>
                            <div class="form-outline">
                                <input type="text" class="form-control" />
                                
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <p class="mb-0">
                                CVV
                            </p>
                            <div class="form-outline">
                                <input type="text" class="form-control" />
                                
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4" />                    
                  <button class="btn btn-primary" type="button">Thanh toán</button>
                </div>
                <!--/.Card-->
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-md-4 mb-4">
                <!-- Heading -->
                <%  double currentValue=0.0; 
                    String formattedCurrentMoneyValue;
                %>
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">Giỏ hàng của bạn</span>
                    <span class="badge rounded-pill badge-primary">${sessionScope.cartCount}</span>
                </h4>

                <!-- Cart -->
                <ul class="list-group mb-3">
                    <c:forEach var="item" items="${sessionScope.cart.cartItems}">
                        <li class="list-group-item d-flex justify-content-between">
                            <div>
                                <h6 class="my-0">${item.product.tensp}</h6>
                                <small class="text-muted">Giá: 
                                    <c:set var="currentMoney" value="${item.product.giasp}"/>
                                    <c:set var="giamgia" value="${item.product.giamgia}"/>
                                    <%
                                        double giam = 0.0;
                                        if (pageContext.getAttribute("giamgia") !=null) {
                                            giam = Double.parseDouble(pageContext.getAttribute("giamgia").toString()); 
                                        } 
                                            formattedCurrentMoneyValue = currencyFormat.format(currentValue);
                                        if (pageContext.getAttribute("currentMoney") !=null) {
                                            currentValue = ((100 - giam)/100) * Double.parseDouble(pageContext.getAttribute("currentMoney").toString()); 
                                        } 
                                            formattedCurrentMoneyValue = currencyFormat.format(currentValue); 
                                    %>
                                    <%= formattedCurrentMoneyValue %>/ Số lượng: ${item.sl}
                                    
                                </small>
                            </div>
                            <span class="text-muted">
                                <c:set var="sumToltal1Item" value="${item.tongTien}"/>
                                    <%
                                        if (pageContext.getAttribute("sumToltal1Item") !=null) {
                                            currentValue = Double.parseDouble(pageContext.getAttribute("sumToltal1Item").toString()); } 
                                            formattedCurrentMoneyValue = currencyFormat.format(currentValue); 
                                    %>
                                    <%= formattedCurrentMoneyValue %>
                            </span>
                        </li>
                    </c:forEach>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Tổng thành tiền:  </span>
                        <strong>
                            <c:set var="totalMoney" value="${sessionScope.cardTotal}"/>
                                    <%
                                        if (pageContext.getAttribute("totalMoney") !=null) {
                                            currentValue = Double.parseDouble(pageContext.getAttribute("totalMoney").toString()); } 
                                            formattedCurrentMoneyValue = currencyFormat.format(currentValue); 
                                    %>
                                    <%= formattedCurrentMoneyValue %>
                        </strong>
                    </li>
                </ul>
                <!-- Cart -->
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
