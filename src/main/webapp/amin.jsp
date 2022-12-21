<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Quản Lý Loại</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
body {
  background-color: #fefbd8;
}
.form-insert{
	display: inline-grid;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="adminController">Trang chủ</a></li>
      <li><a href="loaiadminController">Quản lý loại</a></li>
        <li><a href="nuocadminController">Quản lý sách</a></li>
        <li><a href="xacnhanController">Xác nhận</a></li>
        <li><a href="danhsachchuyentienController">Khách hàng chuyển tiền</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <c:choose>
					         <c:when test="${admin == null}">
					         <li class="nav-item">
                            <a class="nav-link" href="dangnhapadminController">Sign in</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="dangkyadmin">Register</a>
                        </li>
                       </c:when>
					<c:otherwise>
					
					<li class="nav-item">
                            <a class="nav-link" href="#">Hi:  ${admin.getTenDangNhap()}</a>
                        </li>         
                        <li class="nav-item">
                            <a class="nav-link" href="logoutAdminController">Logout</a>
                        </li>
                        </c:otherwise>
				</c:choose>
    </ul>
  </div>
</nav>
<form action="adminController" method="post" >
   <h1>Sau 3 tháng kinh doanh, Tiệm bán nước tạp bất ổn đã bắt đầu ổn định </h1>
   <h3>Thống kê kinh doanh sau 3 tháng kinh doanh </h3>
		<table border="1" width="800" valign="top" class="table table-light">	
				<tr><td>Số lượng đơn hàng đã bán: <span style="font-weight: 600; font-size: 24px">${tongsldh}</span></td></tr>
	            <tr><td>Tổng doanh thu: <span style="font-weight: 600; font-size: 24px">${tongdoanhthu}</span></td></tr>
	            </table>
	            <h3>Cảm ơn đội ngũ nhân viên và góp công xây dựng tiệm bán nước.</h3>
		
		</form>
		
</body>
</html>
 