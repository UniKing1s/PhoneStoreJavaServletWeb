<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
        <c:forEach var="nav" items="${param.navItem}">
          <li class="nav-item">
            <a class="nav-link text-white" href="home?search=Iphone">${nav}</a>
          </li>
        </c:forEach>
      </ul>

      <!-- Search -->
      <form class="w-auto py-1" style="max-width: 12rem">
        <input type="search" oninput="seachByName(this)" name="tensp" class="form-control rounded-0" placeholder="Search" aria-label="Search">
      </form>

    </div>
  </div>
  <!-- Container wrapper -->
</nav>
<script >
  function seachByName(params) {
    var txtSearch = params.value;
    $.ajax(
      {
        url: "/phonestore/search",
        type: "get",//send request to url with get method get
        data:{
          tensp: txtSearch
        },
        success: function(data){
            var row = document.getElementById("itemContent");
            row.innerHTML = data;
        },
        error: function (xhr){
        }
      }
    )
  }
</script>