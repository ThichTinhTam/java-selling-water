<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
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
    <div class="container mt-5 pt-3"></div>
    <!-- /.Main Container -->
<section>
 <section class="vh-100" style="background-color: #508bfc;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-left">
                    <h2 style="text-align:center">ĐĂNG KÝ ADMIN</h2><table align="center">

                        <form action="dangkyadminController" method="post">
                        <tbody>
                            
                            <tr style="height:40px">
                                <td> Tên đăng nhập:</td>
                                <td>
                                    <input id="TenDangNhap" name="TenDangNhap" type="text" value="">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td>  Mật khẩu:</td>
                                <td>
                                    <input id="MatKhau" name="MatKhau" type="password">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td>Mật khẩu nhập lại: </td>
                                <td>
                                    <input id="MatKhauNhapLai" name="MatKhauNhapLai" type="password">
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