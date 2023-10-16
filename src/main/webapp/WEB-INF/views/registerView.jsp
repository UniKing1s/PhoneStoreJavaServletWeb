<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Đăng ký</title>
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
    <div class="container">
        <!-- Heading -->
        <h2 class="my-5 text-center">Đăng Ký</h2>
        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
                <!--Card-->
                <div class="card p-4">
                    <!--Grid row-->
                    <div class="input-group mb-4">
                        <!--Grid column-->
                            <!--firstName-->
                            <div class="form-outline">
                                <input type="text" id="typeText" class="form-control" />
                                <label class="form-label" for="typeText">Tên người dùng</label>
                            </div>
                    
                        <!--Grid column-->            
                        <!--Grid column-->
                    </div>
                    <!--Grid row-->

                    <!--Username-->
                    <div class="input-group mb-4">
                        <div class="form-outline">
                            <input type="text" id="typeText" class="form-control" />
                            <label class="form-label" for="typeText">Tên đăng nhập</label>
                        </div>                    
                    </div>

                    <!--email-->
                   
                    <div class="input-group mb-4">
                        <div class="form-outline">
                            <input type="email" id="typeText" class="form-control" required/>
                            <label class="form-label" for="typeText">Email</label>
                        </div>                    
                    </div>

                    <!--password-->
                    <div class="input-group mb-4">
                        <div class="form-outline">
                            <input type="password" id="typeText" class="form-control" required/>
                            <label class="form-label" for="typeText">Mật khẩu</label>
                        </div>                    
                    </div>
                    <!--Repassword-->
                    <div class="input-group mb-4">
                        <div class="form-outline">
                            <input type="password" id="typeText" class="form-control" required/>
                            <label class="form-label" for="typeText">Nhập lại mật khẩu</label>
                        </div>                    
                    </div>
                    <hr class="mb-4" />                    
                  <button class="btn btn-primary" type="button">Đăng Nhập</button>
                  <br>
                    <div class="row mb-3">
                        <!--Grid column-->
                        <div class="col-md-6 mb-2">
                            <!--firstName-->
                                <a href="login" class="border rounded px-2 nav-link" style=" background-color: #3b71ca ; text-align: center;" target="_blank"><font style="color: white;"><b>Đăng nhập</b></font></a>
                        </div>
                        <div class="col-md-6 mb-2">
                            <!--firstName-->
                                <span><a href="" style="padding-left: 10px;">Quên mật khẩu?</a></span>
                        </div>
                    </div>
                </div>
                <!--/.Card-->
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

