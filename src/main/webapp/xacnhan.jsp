<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Quản lý</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
body {
  background-color: #fefbd8;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="adminController">Trang chủ</a></li>
      <li><a href="loaiadminController">Quản lý loại</a></li>
       <li><a href="nuocadminController">Quản lý nước</a></li>
      <li><a href="xacnhanController">Xác nhận</a></li>
      <li><a href="danhsachchuyentienController">danh sách chuyển tiền</a></li>
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

<table border="1" width="800" valign="top" class="table table-light">
						
                   <thead>
						<tr><th scope="col">STT</th>
							<th scope="col">Họ tên khách hàng</th>
							<th scope="col">Tên thức uông</th>
							<th scope="col">Ngày mua</th>
							<th scope="col">Giá</th>
							<th scope="col">Thành tiền</th>
			             	<th scope="col">Xác nhận</th>

						</tr>
					</thead>
					<tbody>
					   <c:if test="${ds != null }">
		<c:set var = "count" value = "1"/>
		<c:forEach var="xn" items="${ds}" >
			<tr>
			  <td> ${count}</td>	
			  <c:set var = "count" value = '${count+1}'/>
      	<td> ${xn.getHoten()} </td>
      	<td> ${xn.getTennuoc()}</td>
      	<td> ${xn.getNgayMua() }</td>
      	<td> ${xn.getGia() }</td>
      	<td> ${xn.getThanhTien() } </td>
      	<td> <a href="xacnhanchuyentienController?mct=${xn.getMaChiTietHD()}">
      	Xác nhận </a> </td>
      </tr>
    </c:forEach>
	</c:if>
      
 </table>
</body>
</html>

