<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!-- Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
    <!-- Container wrapper -->
    <div class="container">    
      <!-- Toggle button -->
      <button
        class="navbar-toggler"
        type="button"
        data-mdb-toggle="collapse"
        data-mdb-target="#navbarSupportedContent1"
        aria-controls="navbarSupportedContent1"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <i class="fas fa-bars"></i>
      </button>
  
      <!-- Collapsible wrapper -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent1">      
        <!-- Navbar brand -->
        <a class="navbar-brand mt-2 mt-sm-0" href="home">
          <img
            src="img/Nhom-2-Phone.png"
            height="20"
            alt="MDB Logo"
            loading="lazy"
          />
        </a>
        <!-- Left links -->
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item active">
            <a class="nav-link " href="home">Trang chủ</a>
          </li>

          <c:set var="role" value="${param.role}" />
          <c:if test="${role eq true}">
            <li class="nav-item">
              <a class="nav-link" href="managerProduct">Quản lý sản phẩm</a>
            </li>
          </c:if>        
        </ul>
        <!-- Left links -->      
      </div>
      <!-- Collapsible wrapper -->
      
      <!-- Right elements -->
      <div class="d-flex align-items-center">
        <!-- Icon -->
        <a class="nav-link me-3" href="cart">
          <i class="fas fa-shopping-cart"></i>
          <span class="badge rounded-pill badge-notification bg-danger">
          ${param.cartCount}
          </span>
        </a>
  
        <a class="nav-link me-3" href="https://www.facebook.com/profile.php?id=100007709749110">
          <i class="fab fa-facebook-f"></i>
        </a>

        <c:set var="username" value="${param.username}" />
        <c:choose>
          <c:when test="${not empty username}">
              <c:set var="user" value="${param.user}" />
              <a class="border rounded px-2 nav-link" href="">Wellcome: <strong>${user}</strong></a>
              <span style="opacity: 0%;">--</span>
              <a href="logout" class="btn btn-primary" target="_blank" style="font-weight: bold;">Đăng xuất</a>
          </c:when>
          <c:otherwise>
              <a href="login" class="btn btn-primary" target="_blank" style="font-weight: bold;">Đăng nhập</a>
              <span style="opacity: 0%;">--</span>
              <span>
              <a href="register" class="btn btn-primary" target="_blank"style="font-weight: bold;">Đăng ký</a>
              </span>
          </c:otherwise>
        </c:choose>
      </div>
      
      <!-- Right elements -->
      
    </div>
    <!-- Container wrapper -->
  </nav>
  <!-- Navbar -->
  
  <!-- carousel -->
  <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-mdb-ride="carousel">
    <div class="carousel-indicators">
      <!--
      <button
        type="button"
        data-mdb-target="#carouselExampleCaptions"
        data-mdb-slide-to="0"
        class="active"
        aria-current="true"
        aria-label="Slide 1"
      ></button>-->
      <!--
      <button
        type="button"
        data-mdb-target="#carouselExampleCaptions"
        data-mdb-slide-to="1"
        aria-label="Slide 2"
      ></button>-->
       <!--
      <button
        type="button"
        data-mdb-target="#carouselExampleCaptions"
        data-mdb-slide-to="2"
        aria-label="Slide 3"
      ></button>-->
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="img/space.gif" class="d-block w-100" alt="Wild Landscape"/>
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
        
      </div>
    </div>
    <!--
    <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>-->
  </div>