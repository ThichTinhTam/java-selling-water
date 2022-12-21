<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Đăng nhập</title>

    <!-- Font Awesome -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

    <!-- Bootstrap core CSS -->
    <link href="https://mdbootstrap.com/previews/templates/e-commerce/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="https://mdbootstrap.com/previews/templates/e-commerce/css/mdb.min.css" rel="stylesheet">
    <style type="text/css">
    
        .multiple-select-dropdown li [type=checkbox]+label {
            height: 1rem;
        }
    </style>

</head>

<body class="category-v1 hidden-sn white-skin animated">

    <!--Navigation-->
    <header>
        <!-- Sidebar navigation -->
        <ul id="slide-out" class="side-nav custom-scrollbar">
            <!-- Side navigation links -->
            <li>
                <ul class="collapsible collapsible-accordion">
                <li><a href="htnuoc" class="collapsible-header "><i class="far fa-bookmark"></i> Trang chủ<i class="fas fa-angle-down rotate-icon"></i></a></li>
                    <li><a href="htgio" class="collapsible-header "><i class="fas fa-shopping-cart"></i> Giỏ hàng<i class="fas fa-angle-down rotate-icon"></i></a></li>
                    <li><a href="lichsumuahang" class="collapsible-header "><i class="fas fa-camera-retro"></i> Lịch sử mua hàng<i class="fas fa-angle-down rotate-icon"></i></a>
                </ul>
            </li>
            <!--/. Side navigation links -->
            
        </ul>
        <!--/. Sidebar navigation -->
        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg  navbar-light scrolling-navbar white">
            <div class="container">
                <!-- SideNav slide-out button -->
                <div class="float-left mr-2">
                    <a href="htnuoc" data-activates="slide-out" class="button-collapse"><i class="fas fa-bars"></i></a>
                </div>
                <a class="navbar-brand font-weight-bold" href="htnuoc"><strong>Tiệm bán nước bất ổn</strong></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4" aria-controls="navbarSupportedContent-4"
                    aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                    <ul class="navbar-nav ml-auto">
                        <!-- Search form -->
                <form  action="htnuoc" method="post">
                    <div class="form-group md-form my-0 waves-light">
                        <input name="txttk" type="text" class="form-control" placeholder="Search">
                    </div>
                </form>
                
				<ul class="navbar-nav m-auto">
                        
                        <c:choose>
					         <c:when test="${dn == null}">
					         <li class="nav-item">
                            <a class="nav-link" href="dangnhapController">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="dangky">Resigter</a>
                        </li>
                       </c:when>
					<c:otherwise>
					
					<li class="nav-item">
                            <a class="nav-link" href="#">Hi:  ${dn.getHoten()}</a>
                        </li>         
                        <li class="nav-item">
                            <a class="nav-link" href="thoat">Logout</a>
                        </li>
                        </c:otherwise>
				</c:choose>
                    </ul>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- /.Navbar -->

    </header>
    <!-- /.Navigation -->
     <!-- Mega menu -->
    <div class="container mt-5 pt-3"></div>
    <!-- /.Main Container -->
    

<!--Section: Docs content-->
<section>
 <section class="vh-100" style="background-color: #508bfc;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-left">
    <section class="w-100 p-4 d-flex justify-content-center pb-4">
      <form action="ktdn" class="form-style" id="login-form" action="/user/sign_in" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="37uW586AteMrihI8Ewkpz2P936Wn+zU7N5jRFOdDw+2WUupUI7L1MkfztHQxy5vASab70/obiC5PedIGkpkp3A==" />
          <h2>Welcome</h2> 
        <!-- Email input -->
        <div class="form-outline mb-4">
          <input name="txtun" id="txt" class="form-control" />
          <label class="form-label" for="form2Example1">Username</label>
        </div>
        <!-- Password input -->
        <div class="form-outline mb-4">
          <input type="password" name="txtpass" id="form2Example2" class="form-control" />
          <label class="form-label"  >Password</label>          
          </div>
<div class="g-recaptcha" data-sitekey="6LdFKBMjAAAAADCYVmxuxZooLabzQ9tYmiGjONxi"></div>
          <div id="error"></div>
        </div>
        <!-- Submit button -->
        <button name="but1" type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>
          <c:if test="${tb!= null}">
               <h5 style="color: red">thông tin đăng nhập không hợp lệ</h5>   
         </c:if>
        <!-- Register buttons -->
        <div class="text-center">
          <p>Not a member? <a href="dangky">Register</a></p>
          <p>or sign up with:</p>
           Đăng nhập với quyền quản lý cửa hàng? <a href="dangnhapadminController">Admin</a>
        </div>
      </form>
       </div>
      </div>
    </div>
  </div>
    </section>
 </section>
     <%
		if (request.getParameter("kt") != null)
			out.print("<script>alert('thông tin đăng nhập không hợp lệ');</script>");
		%>
 
           
        
        <!--Footer Links-->
        <div class="container mt-5 mb-4 text-center text-md-left">
            <div class="row mt-3">

                <!--First column-->
                <div class="col-md-3 col-lg-4 col-xl-3 mb-4">
                    <h6 class="text-uppercase font-weight-bold"><strong>Tiệm bán nước bất ổn</strong></h6>
                    <hr class="blue mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                    
                </div>
                <!--/.First column-->

               

                <!--Fourth column-->
                <div class="col-md-4 col-lg-3 col-xl-3">
                    <h6 class="text-uppercase font-weight-bold"><strong>Liên hệ</strong></h6>
                    <hr class="blue mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                    <p><i class="fas fa-home mr-3"></i> Vinh Hà, Phú Vàng, T-T-Huế</p>
                    <p><i class="fas fa-envelope mr-3"></i> 20T1020639@husc.edu.vn</p>
                    <p><i class="fas fa-phone mr-3"></i> +84 3 445 699 877</p>
                </div>
                <!--/.Fourth column-->

            </div>
        </div>
        
      
        
        
        
        
        
        
        
        
        <!--/.Footer Links-->
    <!-- SCRIPTS -->

    <!-- JQuery -->
    <script type="text/javascript" src="https://mdbootstrap.com/previews/templates/e-commerce/js/jquery-3.3.1.min.js"></script>

    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://mdbootstrap.com/previews/templates/e-commerce/js/popper.min.js"></script>

    <!-- Bootstrap core JavaScript -->
    <script type="https://mdbootstrap.com/previews/templates/e-commerce/js/bootstrap.min.js"></script>

    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://mdbootstrap.com/previews/templates/e-commerce/js/mdb.min.js"></script>

    <script type="text/javascript">
        /* WOW.js init */
        new WOW().init();

        // Tooltips Initialization
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <script>
        var slider = $("#calculatorSlider");
        var developerBtn = $("#developerBtn");
        var corporateBtn = $("#corporateBtn");
        var privateBtn = $("#privateBtn");
        var reseller = $("#resellerEarnings");
        var client = $("#clientPrice");
        // var percentageBonus = 30; // = 30%
        var license = {
            corpo: {
                active: true,
                price: 319,
            },
            dev: {
                active: false,
                price: 149,
            },
            priv: {
                active: false,
                price: 79,
            }
        }

        function calculate(price, value) {
            client.text((Math.round((price - (value / 100 * price)))) + '$');
            reseller.text((Math.round(((percentageBonus - value) / 100 * price))) + '$')
        }

        function reset(price) {
            slider.val(0);
            client.text(price + '$');
            reseller.text((Math.round((percentageBonus / 100 * price))) + '$');
        }
        developerBtn.on('click', function (e) {
            license.dev.active = true;
            license.corpo.active = false;
            license.priv.active = false;
            reset(license.dev.price)
        });
        privateBtn.on('click', function (e) {
            license.dev.active = false;
            license.corpo.active = false;
            license.priv.active = true;
            reset(license.priv.price);
        });
        corporateBtn.on('click', function (e) {
            license.dev.active = false;
            license.corpo.active = true;
            license.priv.active = false;
            reset(license.corpo.price);
        });
        slider.on("input change", function (e) {
            if (license.priv.active) {
                calculate(license.priv.price, $(this).val());
            } else if (license.corpo.active) {
                calculate(license.corpo.price, $(this).val());
            } else if (license.dev.active) {
                calculate(license.dev.price, $(this).val());
            }
        })
    </script>
    <script>
        // Material Select Initialization
        $(document).ready(function () {
            $('.mdb-select').material_select();
        });
    </script>
    <script>
        // SideNav Initialization
        $(".button-collapse").sideNav();
    </script>
     <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        
             <script>
			    window.onload = function (){
				let isValid = false;
				const form = document.getElementById("form");
				const error = document.getElementById("error");
				
				form.addEventListener("submit", function (event){
					event.preventDefault();
					const response = grecaptcha.getResponse();
					if (response){
						form.submit();
					} else {
						error.innerHTML = "Please check";
					}
				});
			}
		</script>  
		<script type="text/javascript">
        /* WOW.js init */
        new WOW().init();

        // Tooltips Initialization
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>

    <script>
        // Material Select Initialization
        $(document).ready(function () {
            $('.mdb-select').material_select();
        });
    </script>
    <script>
            // SideNav Initialization
            $(".button-collapse").sideNav();
    </script>
		    
</body>
</html>