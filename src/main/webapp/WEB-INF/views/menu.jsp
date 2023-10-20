<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<div class="container">
    <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark mt-3 mb-5 shadow p-2" style="background-color: #607D8B">
    <!-- Container wrapper -->
    <div class="container-fluid">
  
      <!-- Navbar brand -->
      <a class="navbar-brand" href="#"><b>HÃNG:</b></a>
  
      <!-- Toggle button -->
      <button 
         class="navbar-toggler" 
         type="button" 
         data-mdb-toggle="collapse" 
         data-mdb-target="#navbarSupportedContent2" 
         aria-controls="navbarSupportedContent2" 
         aria-expanded="false" 
         aria-label="Toggle navigation">
        <i class="fas fa-bars"></i>
      </button>
  
      <!-- Collapsible wrapper -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent2">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
  
          <!-- Link -->
          <li class="nav-item acitve">
            <a class="nav-link text-white" href="home">Tất cả</a>
          </li>
          <li class="nav-item">
                <a class="nav-link text-white" href="home?search=Iphone">Iphone</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="home?search=Samsung">Samsung</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="home?search=Xiaomi">Xiaomi</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="home?search=OPPO">OPPO</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="home?search=realme">realme</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-white" href="home?search=vivo">vivo</a>
              </li>
        </ul>
  
        <!-- Search -->
        <form class="w-auto py-1" style="max-width: 12rem">
          <input type="search" class="form-control rounded-0" placeholder="Search" aria-label="Search">
        </form>
  
      </div>
    </div>
    <!-- Container wrapper -->
  </nav>