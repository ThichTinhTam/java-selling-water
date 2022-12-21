<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Đăng ký</title>

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
<section>
 <section class="vh-100" style="background-color: #508bfc;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-left">
                    <h2 style="text-align:center">ĐĂNG KÝ KHÁCH HÀNG</h2><table align="center">

                        <form action="ktdk" method="post">
                        <tbody>
                            <tr style="height:40px">
                                <td> Họ tên khách hàng:</td>
                                <td>
                                    <input id="HotenKH" name="HotenKH" type="text" value="">

                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td> Tên đăng nhập:</td>
                                <td>
                                    <input id="TenDN" name="TenDN" type="text" value="">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td>  Mật khẩu:</td>
                                <td>
                                    <input id="Matkhau" name="Matkhau" type="password">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td>Mật khẩu nhập lại: </td>
                                <td>
                                    <input id="Matkhaunhaplai" name="Matkhaunhaplai" type="password">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td> Email:</td>
                                <td>
                                    <input id="Email" name="Email" type="text" value="">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td> Địa chỉ:</td>
                                <td>
                                    <input id="Diachi" name="Diachi" type="text" value="">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td>Điện thoại:</td>
                                <td>
                                    <input id="Dienthoai" name="Dienthoai" type="text" value="">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td> Ngày sinh :</td>
                                <td>
                                    <input type="date" name="Ngaysinh">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td></td>
                                <td>
                                    <input type="Submit" value="Đăng ký">
                                </td>
                            </tr>
                        </tbody>
                        </form>
                    </table>
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
</body>
</html>