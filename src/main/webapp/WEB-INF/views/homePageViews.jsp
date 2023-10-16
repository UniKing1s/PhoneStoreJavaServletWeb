<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
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
    <jsp:include page = "header.jsp"></jsp:include>
   <!--Main layout-->
  <main>
  <jsp:include page = "menu.jsp"></jsp:include>
  <!-- Navbar -->
    
  <!-- Products -->
    <section>
    <div class="text-center">
      <div class="row">
      <!--1 item-->
        <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
              data-mdb-ripple-color="light">
              <img src="img/i15.jpg"
                class="w-100" />
              <a href="#!">
                <div class="mask">
                  <div class="d-flex justify-content-start align-items-end h-100">
                    <h5><span class="badge bg-dark ms-2">NEW</span></h5>
                  </div>
                </div>
                <div class="hover-overlay">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </div>
              </a>
            </div>
            <div class="card-body">
              <a href="" class="text-reset">
                <h5 class="card-title mb-2">Iphone 15</h5>
              </a>
              <a href="" class="text-reset ">
                <p>Iphone</p>
              </a>
              <h6 class="mb-3 price">33.000.000đ</h6>
            </div>
          </div>
        </div>
      <!--item 1-->
      <!--item 2-->
        <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
              data-mdb-ripple-color="light">
              <img src="img/nokia.jpg"
                class="w-100" />
              <a href="#!">  
                <div class="mask">
                  <div class="d-flex justify-content-start align-items-end h-100">
                    <h5><span class="badge bg-primary ms-2">bestseller</span></h5>
                  </div>
                </div>
                <div class="hover-overlay">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </div>
              </a>
            </div>
            <div class="card-body">
              <a href="" class="text-reset">
                <h5 class="card-title mb-2">NOKIA</h5>
              </a>
              <a href="" class="text-reset ">
                <p>Nokia</p>
              </a>
              <h6 class="mb-3 price">1.500.000đ</h6>
            </div>
          </div>
        </div>
         <!--item 3-->
        <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
              data-mdb-ripple-color="light">
              <img src="img/oppo-reno10-pro-plus-1-1.jpg"
                class="w-100" />
              <a href="#!">              
                <div class="hover-overlay">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </div>
              </a>
            </div>
            <div class="card-body">
              <a href="" class="text-reset">
                <h5 class="card-title mb-2">OPPO Reno 10 Pro Plus</h5>
              </a>
              <a href="" class="text-reset ">
                <p>OPPO</p>
              </a>
              <h6 class="mb-3 price">11.000.000đ</h6>
            </div>
          </div>
        </div>
   <!--item 4-->
        <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <div class="bg-image hover-zoom ripple" data-mdb-ripple-color="light">
              <img src="img/samsung-z-flod-5.jpg"
                class="w-100" />
              <a href="#!">
                <div class="mask">
                  <div class="d-flex justify-content-start align-items-end h-100">
                    <h5><span class="badge sale-badge ms-2">-10%</span></h5>
                  </div>
                </div>
                <div class="hover-overlay">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </div>
              </a>
            </div>
            <div class="card-body">
              <a href="" class="text-reset">
                <h5 class="card-title mb-2">Samsung Z flod 5</h5>
              </a>
              <a href="" class="text-reset ">
                <p>Samsung</p>
              </a>
              <h6 class="mb-3 price">
                <s>30.000.000đ</s><strong class="ms-2 sale">27.000.000đ</strong>
              </h6>
            </div>
          </div>
        </div>
      </div>
  
      <div class="row">
        
        <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
              data-mdb-ripple-color="light">
              <img src="img/vertu.jpg"
                class="w-100" />
              <a href="#!">              
                <div class="hover-overlay">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </div>
              </a>
            </div>
            <div class="card-body">
              <a href="" class="text-reset">
                <h5 class="card-title mb-2">Vertu</h5>
              </a>
              <a href="" class="text-reset ">
                <p>Có tiền cũng chẳng mua</p>
              </a>
              <h6 class="mb-3 price">Giá liên hệ</h6>
            </div>
          </div>
        </div>
  
        <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
              data-mdb-ripple-color="light">
              <img src="img/vivo.jpg"
                class="w-100" />
              <a href="#!">
                <!--<div class="mask">
                  <div class="d-flex justify-content-start align-items-end h-100">
                    <h5><span class="badge bg-success ms-2">Eco</span></h5>
                  </div>
                </div>-->
                <div class="hover-overlay">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </div>
              </a>
            </div>
            <div class="card-body">
              <a href="" class="text-reset">
                <h5 class="card-title mb-2">Vivo</h5>
              </a>
              <a href="" class="text-reset ">
                <p>Vivo</p>
              </a>
              <h6 class="mb-3 price">10.000.000đ</h6>
            </div>
          </div>
        </div>
        
        <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <div class="bg-image hover-zoom ripple" data-mdb-ripple-color="light">
              <img src="img/xiaomi.jpg"
                class="w-100" />
              <a href="#!">              
                <div class="hover-overlay">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </div>
              </a>
            </div>
            <div class="card-body">
              <a href="" class="text-reset">
                <h5 class="card-title mb-2">Xiaomi</h5>
              </a>
              <a href="" class="text-reset">
                <p>Xiaomi</p>
              </a>
              <h6 class="mb-3 price">15.000.000đ</h6>
            </div>
          </div>
        </div>
  
        <div class="col-lg-3 col-md-6 mb-4">
          <div class="card">
            <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
              data-mdb-ripple-color="light">
              <img src="img/dien_thoai_ban.jpg"
                class="w-100" />
              <a href="#!">              
                <div class="hover-overlay">
                  <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </div>
              </a>
            </div>
            <div class="card-body">
              <a href="" class="text-reset">
                <h5 class="card-title mb-2">Điện thoại bàn</h5>
              </a>
              <a href="" class="text-reset ">
                <p>Not in stock</p>
              </a>
              <h6 class="mb-3 price">500.000đ</h6>
            </div>
          </div>
        </div>
      </div>
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
