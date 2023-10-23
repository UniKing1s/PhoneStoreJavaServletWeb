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
  <main>
  <!-- Navbar -->
  <div class="container">
    <!-- Navbar have js load data from search -->
    
    <jsp:include page = "navbar.jsp">
      <jsp:param name="navItem" value="${listhang}" />
    </jsp:include>
    
  <!-- Products -->
    <section>
    <div class="text-center">
      <div class="row" id="itemContent">




        <c:forEach var="p" items="${list}">
          <!--1 item-->
          <div class="col-lg-3 col-md-6 mb-4">
            <div class="card">
              <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
                data-mdb-ripple-color="light">
                <img src="${p.imgURL}"
                  class="w-100" />
                <a href="product?masp=${p.masp}">
                  <div class="mask">
                    <div class="d-flex justify-content-start align-items-end h-100">
                      <c:if test="${not empty p.tag}"><h5><span class="badge bg-dark ms-2">${p.tag}</span></h5></c:if>
                      <c:if test="${p.giamgia != 0.0}"><h5>
                        <span class="badge sale-badge ms-2">
                        
                        <c:set var="number" value="${p.giamgia}"/>
                        <c:set var="stringValue" value="${String.format('%.0f', number)}" />Sale ${stringValue} %
                      </span></h5>
                      </c:if>
                    </div>
                  </div>
                  <div class="hover-overlay">
                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                  </div>
                </a>
              </div>
              <div class="card-body">
                <a href="product?masp=${p.masp}" class="text-reset">
                  <h5 class="card-title mb-2">${p.tensp}</h5>
                </a>
                <a href="product?masp=${p.masp}" class="text-reset ">
                  <p>${p.mota}</p>
                </a>
                <h6 class="mb-3 price">
                  <c:set var="currentMoney" value="${p.giasp}"/>
                  <c:set var="moneyValue" value="${p.giasp*(1-(p.giamgia/100))}" />
                  <%
                    double currentValue = 0.0;
                    if (pageContext.getAttribute("currentMoney") != null) {
                      currentValue = Double.parseDouble(pageContext.getAttribute("currentMoney").toString());
                    }
                    String formattedCurrentMoneyValue = currencyFormat.format(currentValue);
                    %>
                  <c:if test="${p.giamgia == 0.0}"><%= formattedCurrentMoneyValue %>
                  <br>
                  <strong class="ms-2 sale" style="opacity: 0%;">
                    H:>
                  </strong>
                  </c:if>
                    
                  <c:if test="${p.giamgia != 0.0}">
                    <s><%= formattedCurrentMoneyValue %></s><br>
                    <strong class="ms-2 sale">
                      <%
                        double moneyValueDouble = 0.0;
                        if (pageContext.getAttribute("moneyValue") != null) {
                          moneyValueDouble = Double.parseDouble(pageContext.getAttribute("moneyValue").toString());
                        }
                        String formattedMoneyValue = currencyFormat.format(moneyValueDouble);
                      %> 
                      <%= formattedMoneyValue %>
                    </strong>
                  </c:if>
                    
                </h6>
              </div>
            </div>  
          </div>
          <!--item 1-->
        </c:forEach>
    </div>
  </section>
    
  <!-- Pagination -->
    <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
    <ul class="pagination">
      <li class="page-item disabled">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <li class="page-item active"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">4</a></li>
      <li class="page-item"><a class="page-link" href="#">5</a></li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>  
  <!-- Pagination -->  
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
