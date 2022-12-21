<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bean.loaibean"%>
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

<% if(request.getAttribute("ktnhap")!=null)
	out.print("<script>alert('Them khong dc');</script>");
if(request.getAttribute("ktsua")!=null)
	out.print("<script>alert('Không sửa được');</script>");
if(request.getAttribute("ktxoa")!=null)
	out.print("<script>alert('Không xóa được');</script>");
loaibean l=(loaibean)request.getAttribute("chonloai");
%>

<form action="loaiadminController" method="post">
	<label>Mã loại:</label>
	<input class="form-control" type="text" name="txtmaloai" placeholder="Mã loại" value="<%=(l!=null?l.getMaloai():"") %>" required><br>
	<label>Tên loại:</label>
	<input class="form-control" type="text" name="txttenloai" placeholder="Tên loại" value="" required ><br>
	<input type="submit" name="butthem" value="Thêm" ><br>
	<input type="submit" name="butsua" value="Sửa" ><br>
	</form>
<h2>Danh sách các loại</h2>
	
	<table width="300" class="table table-hover table-border"  align="left">
	 		<c:forEach items="${dsnuoc1}" var="s">	
	 		<tr>
	 		<td>${s.getMaloai()}</td>
	 		<td>${s.getTenloai()}</td>
	 		<td>
	 		<a href="loaiadminController?mlchon=${s.getMaloai()}">Chọn</a>
	 		</td>
	 		<td>
	 		<a href="loaiadminController?mlxoa=${s.getMaloai()}">Xóa</a>
	 		</td>
	 		</tr>
	 	</c:forEach>
	 	</table>
</body>
</html>
