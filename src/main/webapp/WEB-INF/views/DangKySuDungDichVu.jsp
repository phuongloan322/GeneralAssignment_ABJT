<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Đăng ký sử dụng dịch vụ
  </title>
  <%@ include file="/WEB-INF/views/layout/header.jsp" %>
</head>

<body class="light-edition">
  <div class="wrapper ">
    <%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " style="background: DarkSlateGray !important;color: #fff;" id="navigation-example">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:void(0)">ĐĂNG KÝ SỬ DỤNG DỊCH VỤ</a>
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
          
            
            
            <%@ include file="/WEB-INF/views/layout/navbar.jsp" %>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      
      <div class="content">
      
     <div id="msg">
	      <c:if test="${msg != null }">
	       		<div class="alert alert-info"  role="alert">${msg }</div>     
	      </c:if>
      </div>
      <%@ include file="/WEB-INF/views/layout/message.jsp" %>

      
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
            
			
              <div class="card">
					
				        <form action ="<c:url value="/dangkydichvu"/>" method="post" class="m-5">
				        	<b style="font-size: 22px">Đăng ký sử dụng dịch vụ</b><br><br>
				        	<div class="">
							    <label for="exampleFormControlFile1" class="">Mã khách hàng</label>
							    <select class="form-select border p-2"  id="makh" name="makh" style="width: 100%">
								  <option value="" selected>--Chọn khách hàng--</option>
								  <c:forEach var="item" items="${customerList }">
								  		<option value="${item.maKH }">${item.tenKH }</option>
								  </c:forEach>
								</select>
							     <div id="error-makh" style="color:red;"></div><br>
							  </div>
				        	<div class="">
							    <label for="exampleFormControlFile1" class="">Mã dịch vụ</label>
							    <select id="madv" name="madv" class="form-select border p-2"  style="width: 100%">
								  <option value="" selected>--Chọn dịch vụ--</option>
								  <c:forEach var="item" items="${dichvuList }">
								  		<option value="${item.maDV }">${item.tenDV }</option>
								  </c:forEach>
								</select>
							     <div id="error-madv" style="color:red;"></div><br>
							  </div>
							<div class="">
							    <label for="exampleFormControlFile1" class="">Ngày sử dụng</label>
							    <input type="date" class="form-control-file border p-2" id="ngaysd" name="ngaysd" >
							     <div id="error-ngaysd" style="color:red;"></div><br>
							  </div>
							  <div class="">
							    <label for="exampleFormControlFile1" class="">Giờ sử dụng</label>
							    <input type="time" class="form-control-file border p-2" id="giosd" name="giosd">
							     <div id="error-giosd" style="color:red;"></div><br>
							  </div>
							  <div class="">
							    <label for="exampleFormControlFile1" class="">Số lượng</label>
							    <input type="number" class="form-control-file border p-2" id="soluong" name="soluong" >
							     <div id="error-soluong" style="color:red;"></div><br>
							  </div>
							  <br>
						        <button onclick="return validate()" type="submit" class="btn btn-primary">Đăng ký</button>    
				        </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  	<script src="https://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.js"></script>
	<link href="https://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css" rel="stylesheet"/>
  	
	<script>

		function getValue(id) {
			return document.getElementById(id).value.trim();
		}
		function showError(key, mess) {
			document.getElementById('error-' + key).innerHTML = mess;
		}

		function validate() {
			var flag = true;
			var makh = getValue('makh');
			var madv = getValue('madv');
			var ngaysd = getValue('ngaysd');
			var giosd = getValue('giosd');
			var soluong = getValue('soluong');

			if (makh == '') {
				flag = false;
				showError('makh', 'Vui lòng chọn mã khách hàng');
			} else {
				showError('makh', '');
			}

			if (madv == '') {
				flag = false;
				showError('madv', 'Vui lòng chọn dịch vụ');
			} else {
				showError('madv', '');
			}

			if (ngaysd == '') {
				flag = false;
				showError('ngaysd', 'Vui lòng chọn ngày sử dụng');
			} else {
				showError('ngaysd', '');
			}

			if (giosd == '') {
				flag = false;
				showError('giosd', 'Vui lòng chọn giờ sử dụng');
			} else {
				showError('giosd', '');
			}

			if (soluong == '') {
				flag = false;
				showError('soluong',
						'Không được để trống số lượng');
			} else if (!/^\d*$/.test(dongia)) {
				flag = false;
				showError('soluong', 'Sai định dạng số lượng');
			} else {
				showError('soluong', '');
			}

			return flag;
		}
	</script>
	  
	
   <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</html>