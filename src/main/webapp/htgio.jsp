<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Giỏ hàng</title>

    <!-- Font Awesome -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

    <!-- Bootstrap core CSS -->
    <link href="https://mdbootstrap.com/previews/templates/e-commerce/css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <style type="text/css">
   body {
  background-color: #d5f4e6;
}
        .multiple-select-dropdown li [type=checkbox]+label {
            height: 1rem;
        }
    </style>

</head>

<body >
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
				<ul class="navbar-nav m-auto">      
                        <c:choose>
					         <c:when test="${dn == null}">
					         <li class="nav-item">
                            <a class="nav-link" href="dangnhapController">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ktdk">Sign in</a>
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
	<table width="1000" align="center">
		<tr>
			<td width="200" valign="top">
				<table class="table table-hover">
					<c:forEach var="l" items="${dsnuoc2}">
						<tr>
							<td><a href="htnuoc?ml=${l.getMaloai()}">
									${l.getTenloai()} </a></td>
						</tr>
					</c:forEach>
				
				</table>
			</td>
			<td width="600" valign="top">
				<form action="suaxoa" method="post">

					<table class="table table-hover">
						<c:if test="${ds != null}">
							<tr bgcolor="00FFFF" >
							<td>chọn</td>
							<td>Ảnh </td>							
							<td>Mã nước</td>
							<td>Tên nước</td>
							<td>Giá</td>
							<td>Số lượng</td>
							<td>Sửa số lượng</td>
							<td>Tổng giá</td>
							</tr>
							<c:forEach var="h" items="${ds}">
							   	<tr>
            <td><input type="checkbox" name="check" value="${h.getManuoc()}"></td>	
                         <td><img class="card-img-top"  src="${h.getAnh()}" ></td>
                         <td> ${h.getManuoc()} 	</td>
		               	<td> ${h.getTennuoc()} 	</td>
		   	            <td> ${h.getGia()} 	      </td>
		   	            <td> ${h.getSoluong()} 	</td>
		   	               <td>
		   	   <input type="number" min="0" name="txt${h.getManuoc()}">
		   	    <button type="submit" name="butsua" value="${h.getManuoc()}">
		   	     Update</button>
		   	    <button type="submit" name="butxoa" value="${h.getManuoc()}"> 
		   	    Delete</button>
		   	
		   	</td>
		   	<td> ${h.getThanhtien()}	</td>
		   	</tr>
			   
	</c:forEach>
	</c:if>
     </table>
     <button type="submit" name="butcheck"> 
		   	    Delete check</button> 
	 <a href="dathangController"><button type="button" name="but1"> 
		   	    Đặt mua
		  </button> </a>
		   	
      <div>	
				
				<p>Thành tiền:<span style="font-weight: 600; font-size: 24px">${tongtien}</span><br>
			
				 <a href="xoaAllController" class="btn btn-default"><button type="button" name="but1">Trả Lại Toàn Bộ</button></a>
				 <a href="htnuoc" class="btn btn-default"><button type="button" name="but1">Tiếp Tục Mua Hàng</button></a>
				</p>
			</div>
					   	    
  
			
     </td>
   </tr>
</table>
  <!--Footer Links-->
        <div class="container mt-5 mb-4 text-center text-md-left">
            <div class="row mt-3">

                <!--First column-->
                <div class="col-md-3 col-lg-4 col-xl-3 mb-4">
                    <h6 class="text-uppercase font-weight-bold"><strong>Tiệm bán nước bất ổn</strong></h6>
                    <hr class="blue mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                    
                </div>
   <div class="col-md-3 col-lg-4 col-xl-3 mb-4"></div>
    <div class="col-md-3 col-lg-4 col-xl-3 mb-4"></div>
                <div class="col-md-3 col-lg-4 col-xl-3 mb-4">
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
							
