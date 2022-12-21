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
							<th scope="col">Mã Khách Hàng</th>
							<th scope="col">Tên Nước</th>
							<th scope="col">Giá</th>
							<th scope="col">Số Lượng Mua</th>
							<th scope="col">Thành Tiền</th>
							<th scope="col">Trạng thái</th>
						</tr>
					</thead>
					<tbody>
					
					 <c:if test="${dschuyentien != null }">
		            <c:set var = "count" value = "1"/>
		             <c:forEach var="s" items="${dschuyentien}">
                    <c:if test="${s.isDamua()==true }">
			             <tr>
			                <td> ${count}</td>	
			                 <c:set var = "count" value = '${count+1}'/>									
			                        <td>${s.getMakh()}</td>							
									<td>${s.getTennuoc()}</td>
									<td>${s.getGia()}</td>
									<td>${s.getSoLuongMua() }</td>
									<td>${s.getThanhtien() }</td>
									<td> Đã thanh toán </td>
							</tr>
							</c:if>
						</c:forEach>
	</c:if>
					</tbody>
				</table>
			
		<td valign="top" width="100">
			<form action="adminController" method="post">
				 <input name="txttk" type="text" value="" placeholder="Search"> <br>
      			<button style="float: right;" name="butdn" type="submit" class="btn btn-primary active"  value="Search">
      			<i class="ti-search"></i>
      			Sreach</button> 
			</form>
		</td>
		
		
	
	
</body>
</html>
