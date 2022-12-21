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
<table align="center" cellspacing="0" width="1200"  style="font-size:12px;">
  <tr>
  	<td valign="top" width="150">
  		<table class="table table-hover">
  			<c:forEach items="${dsloai}" var="loai">		
  			<tr>
  				<td>
  					<a href="nuocadminController?ml=${loai.getMaloai() }">
  					<c:out value="${loai.getTenloai() }"></c:out> 
  					</a>
  				</td>
  			</tr>
  			</c:forEach>
  		</table>
  	</td>
  	<td valign="top" width="1050">
  	<table>
  	<tr>
  		<td valign="top" >
  		<form action="nuocadminController" method="post" align="right" style="float:right;margin-bottom: 50px;margin-top: 10px;margin-right: 20px;">
  			<input type="text" name="txtTim">
  			<input type="submit" value="Search" name="but1">
  		</form>
  		<a href="#" data-toggle="modal" data-target="#myModal" style="font-size: 18px; margin-left: 50px;margin-top: 10px; float: left;"><i class="far fa-plus-square" ></i> Thêm nước</a>
  	</td>
  	</tr>
  	
  	
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Thêm nước</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	
        	
          <form method="post" action="addnuoc" enctype= "multipart/form-data"> 
          	Mã nước:  <input type="text" name="txtmanuoc" required="required" class="form-control">
          	Tên nước:<input type="text" name="txttennuoc" required="required" class="form-control">
          	Nhà cung cấp:<input type="text" name="txtncc" required="required" class="form-control">
          	Số lượng:<input type="number" min="1" required="required" name="txtsoluong" class="form-control">
          	Giá:<input type="number" min="1" name="txtgia" required="required" class="form-control">
          	Mã loại:<select name="cbbloai" required="required" class="form-control" >
	        	<c:forEach items="${dsloai }" var="s">
	        			<option value="${s.getMaloai() }"><c:out value="${s.getMaloai() }"></c:out></option>
				</c:forEach>
				</select>
          	Ảnh:<input type="file" required="required" name="anh">
          	<input type="submit" name="but1" value="Thêm nước" class="btn-primary">
          </form>
        </div>
        
      </div>
    </div>
  </div>
  
  
  	<tr>
  		<td>
  			<table class="table table-hover">
  		<thead>
  			<th>Bìa nước</th>
  			<th>Mã nước</th>
  			<th>Tên nước</th>
  			<th>Giá</th>
  			<th>Số lượng</th>
  			<th>Mã loại</th>
  			<th>Ngày nhập</th>
  			<th>Nhà cung cấp</th>
  			<th></th>
  		</thead>
  		<tbody>
  	
	    <c:forEach items="${dsnuoc}"  var="s">
	    <form  method="post" action="capnhatnuoc?manuoc=${s.getManuoc()}&fileanh=${s.getAnh()}" enctype= "multipart/form-data">
	      <tr>
	      	<td style="position: relative;"  width="50"><img alt="" src="${s.getAnh()}" width="80px" height="100px" >
	      	<input type="file" name="fileanh" style="position: absolute; bottom:30px; left:100px;z-index: 999;">
	      	</td>
	      	<td width="70"><c:out value="${s.getManuoc()}"></c:out></td>
	        <td style="font-weight:bold;"><input type="text" name="txttennuoc" size="10" value="${s.getTennuoc()}" title="${s.getTennuoc()}"></td>
	        <td width="70">
	        	<input type="text" name="txtgia" size="5" value="${s.getGia() }">
	        </td>
	        <td>
  				<input type="number" name="txtsoluong" min="1" value="${s.getSoluong()}" style="width:70px">
	        </td>
	        <td width="70">
	        	<select name="txtmaloai" id="nuoc">
	        	<c:forEach items="${dsloai}" var="h">
	        		<c:choose>
	        			<c:when test="${h.getMaloai().equals(s.getMaloai())}">
	        				<option value="${h.getMaloai() }" selected="selected"><c:out value="${h.getMaloai() }"></c:out></option>
	        			</c:when>
	        			<c:otherwise>
	        				<option value="${h.getMaloai() }"><c:out value="${h.getMaloai() }"></c:out></option>
	        			</c:otherwise>
	        		</c:choose>
				  
				</c:forEach>
				</select>
	        </td>
	        <td><input type="date" name="txtngaynhap" size="5" value="${s.getNgayNhap()}"></td>
	        <td><input type="text" name="txtncc" size="5" title="${s.getNcc()}" value="${s.getNcc()}"></td>
	      	<td width="85">
	      		<a style="padding-left: 8px;" href="nuocadminController?xoa=0&manuoc=${s.getManuoc() }">Xoá</a><br>
	      		<input class= "btn-link" type="submit" name="btncn" value="Cập nhật" >
	      	</td>
	      </tr>
	      </form>
	     </c:forEach>
	     </tbody>
	       
  </table>
   <nav aria-label="Page navigation example" href="nuocadminController?page=1">
				  <ul class="pagination">
						
				 <c:forEach var ="pg" items="${sotrang}">
								                        <li >
								                        	<a href="nuocadminController?page=${pg}&ml=${mloai}"> ${pg+1 }</a>
								                        </li>
							     </c:forEach>
				  </ul>
				</nav>
  		</td>
  	</tr>
  	</table>
  	</td>
  </tr>
  </table>
  
</body>
</html>