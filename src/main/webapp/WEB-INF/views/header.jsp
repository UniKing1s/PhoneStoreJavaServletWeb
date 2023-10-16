<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

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
          <li class="nav-item">
            <a class="nav-link" href="https://mdbootstrap.com/education/bootstrap/">Dash board</a>
          </li>
        </ul>
        <!-- Left links -->      
      </div>
      <!-- Collapsible wrapper -->
      
      <!-- Right elements -->
      <div class="d-flex align-items-center">
        <!-- Icon -->
        <a class="nav-link me-3" href="#">
          <i class="fas fa-shopping-cart"></i>
          <span class="badge rounded-pill badge-notification bg-danger">1</span>
        </a>
  
        <a class="nav-link me-3" href="https://www.facebook.com/profile.php?id=100007709749110">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="login" class="border rounded px-2 nav-link"
                target="_blank">Đăng nhập
        </a>
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
        <img src="img/phonebanner.png" class="d-block w-100" alt="Wild Landscape"/>
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