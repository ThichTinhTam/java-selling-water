<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Tiệm Bán Nước Bất Ổn</title>

    <!-- Font Awesome -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

    <!-- Bootstrap core CSS -->
    <link href="https://mdbootstrap.com/previews/templates/e-commerce/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="https://mdbootstrap.com/previews/templates/e-commerce/css/mdb.min.css" rel="stylesheet">
    <style type="text/css">
    body {
  background-color: #d5f4e6;
}
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
                <a class="navbar-brand font-weight-bold" href="htnuoc"><strong>BUY</strong></a>
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
                            <a class="nav-link" href="dangky">Resgiter</a>
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
    <div class="container ">

      
            <!-- Content -->
            <div class="col-lg-12">

                <!-- Section: Intro -->
                <section class="section pt-4">

                    <!-- Grid row -->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-lg-13 col-md-12 mb-3 pb-lg-2">
                            <!--Image -->
                            <div class="view zoom  z-depth-1">

                                <img src="bia.jpg" class="img-fluid" alt="reponsive image" width= "100%">
                                <div class="mask rgba-white-light">
                                    <div class="dark-grey-text d-flex align-items-center pt-5 pl-5">
                                        <div>
                                            <a><span class="badge badge-danger">Tiệm bán nước bất ổn</span></a>
                                            <h2 class="card-title font-weight-bold pt-2 white"><strong>Chào mừng quý khách đã đến với tiệm bán nước bất ổn</strong></h2>
                                            <p class="yellow">Chất lượng tạo nên thương hiệu, chúc quý khách lựa chọn được thức uống </p>
                                            <a class="btn btn-danger btn-sm btn-rounded clearfix d-none d-md-inline-block">Kính mời</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--Image -->
                        </div>
                        <!--Grid column-->
                        </div>
                        </section>
                        </div>
                        </div>

         <!-- Main Container -->
    <div class="container mt-5 pt-3">
          <div class="row pt-4">
               <!-- Sidebar -->
            <div class="col-lg-3">
                <div class="">
                      <!-- Grid row -->
                    <div class="row">
                        <div class="col-md-6 col-lg-12 mb-5">
                            <!-- Panel -->
                            <h3 class="font-weight-bold dark-grey-text"><strong>CÁC LOẠI THỨC UỐNG</strong></h3>
                                <div class="divider"></div>
                          <c:forEach var="l" items = "${dsnuoc1}">        		                 
           				   <p class="dark-grey-text"><a href="htnuoc?ml=${l.getMaloai()}">
               				                             ${l.getTenloai()}
                          </a>
                             </c:forEach>    
                               </div>
                        </div>
                   <!-- /Grid row -->
                </div>
                <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Mặt hàng mới</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${last.getAnh()}" />
                            <h5 class="card-title">${last.getTennuoc()}</h5>
                            <p class="card-text">${last.getNcc()}</p>
                            <p class="bloc_left_price">${last.getGia()}</p>      
                        </div>
                    </div>
                     <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Mặt hàng bán chạy nhất</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${anhbc}" />
                            <h5 class="card-title">${tennuocbanchay}</h5>
                            <p class="bloc_left_price">${SLbc}</p>      
                        </div>
                    </div>
                        </div>
                        
	
	 <!-- Content -->
            <div class="col-lg-9">
                <!-- Products Grid -->
                <section class="section pt-4">
                    <!-- Grid row -->
                    <div class="row">
                    <c:forEach var="s" items="${dsnuoc}">
                        <!--Grid column-->
                        <div class="col-lg-4 col-md-12 mb-4">
                            <!--Card-->
                            <div class="card card-ecommerce">
                                <!--Card image-->
                                	
                                <div class="view overlay">
                                    <img class='img' width="300" height="200" src="${s.getAnh()}"><br>
                                    <a>
                                        <div class="mask rgba-white-slight"></div>
                                    </a>
                                </div>
                                <!--Card image-->

                                <!--Card content-->
                                <div class="card-body">
                                    <!--Category & Title-->
                                    <h5 class="card-title mb-1"><strong><a href="" class="dark-grey-text">${s.getTennuoc()}</a></strong></h5><span class="badge badge-danger mb-2">${s.getSoluong()}</span>
                                    <!-- Rating -->
                                    <!--Card footer-->
                                    <div class="card-footer pb-0">
                                        <div class="row mb-0">
                                            <span class="float-left"><strong> ${s.getGia()}</strong></span>
                                            <span class="float-right">
                                        <a
								href="giohang?anh=${s.getAnh()}&ms=${s.getManuoc()}&ts=${s.getTennuoc()}&gia=${s.getGia()}"
								 class="" data-toggle="tooltip" data-placement="top" title="Add to Cart"><i class="fas fa-shopping-cart ml-3" ></i> </a>
                                        </span>
                                        </div>
                                    </div>                              
                                </div>
                                <!--Card content-->
                             
                            </div>
                            <!--Card-->

                        </div>
                        <!--Grid column-->
                          </c:forEach>

                    </div>
                    <!--Grid row-->
                  
                     <nav aria-label="Page navigation example" href="htnuoc?page=1">
				  <ul class="pagination">
						
				 <c:forEach var ="pg" items="${sotrang}">
								                        <li class="page-item"><a class="page-link">
								                        	<a href="htnuoc?page=${pg}&ml=${mloai}"> ${pg+1 }</a>
								                        </li>
							     </c:forEach>
				  </ul>
				</nav>
                       
                </section>
                <!-- /.Products Grid -->

            </div>
            <!-- /.Content -->

        </div>

    </div>
    <!-- /.Main Container -->

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
    
</body>

</html>
