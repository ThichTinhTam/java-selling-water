<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Lịch sử mua hàng</title>

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
    <div class="container mt-5 pt-3">
    

		<table border="1" width="800" valign="top" class="table table-light">
						
                   <thead>
						<tr><th scope="col">STT</th>
							<th scope="col">Mã Khách Hàng</th>
							<th scope="col">Tên Sách</th>
							<th scope="col">Giá</th>
							<th scope="col">Số Lượng Mua</th>
							<th scope="col">Thành Tiền</th>
							<th scope="col">Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						 <c:if test="${dslichsu != null }">
		            <c:set var = "count" value = "1"/>
		             <c:forEach var="s" items="${dslichsu}">
                    <c:if test="${s.isDamua()==true }">
			             <tr>
			                <td> ${count}</td>	
			                 <c:set var = "count" value = '${count+1}'/>	
									<td>${s.getMakh() }</td>							
									<td>${s.getTennuoc() }</td>
									<td>${s.getGia() }</td>
									<td>${s.getSoLuongMua() }</td>
									<td>${s.getThanhtien() }</td>
									<td>Da xac nhan thanh toan </td>
							</tr>					
						</c:if>
						 <c:if test="${s.isDamua()==false }">
			             <tr>
			                <td> ${count}</td>	
			                 <c:set var = "count" value = '${count+1}'/>	
									<td>${s.getMakh() }</td>							
									<td>${s.getTennuoc() }</td>
									<td>${s.getGia() }</td>
									<td>${s.getSoLuongMua() }</td>
									<td>${s.getThanhtien() }</td>
									<td>Chua xac nhan thanh toan </td>
							</tr>					
						</c:if>
						</c:forEach>
						</c:if>
								 <c:if test="${dslichsu == null }">
							Bạn chưa có đơn hàng, mời bạn <a href="htnuoc">Đặt mua hàng</a>
										</c:if>
					
					</tbody>
				</table>
			</div>
		<td valign="top" width="100">
			<form action="htnuoc" method="post">
				 <input name="txttk" type="text" value="" placeholder="Search"> <br>
      			<button style="float: right;" name="butdn" type="submit" class="btn btn-primary active"  value="Search">
      			<i class="ti-search"></i>
      			Sreach</button> 
			</form>
		</td>
		
		</tr>
	</table>
</body>
</html>
