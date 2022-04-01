<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Đăng ký sử dụng máy
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
            <a class="navbar-brand" href="javascript:void(0)">ĐĂNG KÝ SỬ DỤNG MÁY</a>
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
					
				        <form action ="<c:url value="/dangkymay"/>" method="post" class="m-5">
				        	<b style="font-size: 22px">Đăng ký sử dụng máy</b><br><br>
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
							    <label for="exampleFormControlFile1" class="">Mã máy</label>
							    <select id="mamay" name="mamay" class="form-select border p-2"  style="width: 100%">
								  <option value="" selected>--Chọn máy--</option>
								  <c:forEach var="item" items="${mayList }">
								  		<option value="${item.maMay }">${item.maMay }</option>
								  </c:forEach>
								</select>
							     <div id="error-mamay" style="color:red;"></div><br>
							  </div>
							<div class="">
							    <label for="exampleFormControlFile1" class="">Ngày bắt đầu sử dụng</label>
							    <input type="date" class="form-control-file border p-2" id="ngaybd" name="ngaybd" >
							     <div id="error-ngaybd" style="color:red;"></div><br>
							  </div>
							  <div class="">
							    <label for="exampleFormControlFile1" class="">Giờ bắt đầu sử dụng</label>
							    <input type="time" class="form-control-file border p-2" id="giobd" name="giobd">
							     <div id="error-giobd" style="color:red;"></div><br>
							  </div>
							  <div class="">
							    <label for="exampleFormControlFile1" class="">Thời gian sử dụng</label>
							    <input type="number" class="form-control-file border p-2" id="thoigiansudung" name="thoigiansudung" >
							     <div id="error-thoigiansudung" style="color:red;"></div><br>
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
		/* var timepicker = new TimePicker('giobd', {
			lang : 'en',
			theme : 'dark'
		});
		timepicker.on('change', function(evt) {

			var value = (evt.hour || '00') + ':' + (evt.minute || '00');
			evt.element.value = value;

		}); */

		function getValue(id) {
			return document.getElementById(id).value.trim();
		}
		function showError(key, mess) {
			document.getElementById('error-' + key).innerHTML = mess;
		}

		function validate() {
			var flag = true;
			var makh = getValue('makh');
			var mamay = getValue('mamay');
			var ngaybd = getValue('ngaybd');
			var giobd = getValue('giobd');
			var thoigiansudung = getValue('thoigiansudung');

			if (makh == '') {
				flag = false;
				showError('makh', 'Vui lòng chọn mã khách hàng');
			} else {
				showError('makh', '');
			}

			if (mamay == '') {
				flag = false;
				showError('mamay', 'Vui lòng chọn mã máy');
			} else {
				showError('mamay', '');
			}

			if (ngaybd == '') {
				flag = false;
				showError('ngaybd', 'Vui lòng chọn ngày bắt đầu');
			} else {
				showError('ngaybd', '');
			}

			if (giobd == '') {
				flag = false;
				showError('giobd', 'Vui lòng chọn giờ bắt đầu');
			} else {
				showError('giobd', '');
			}

			if (thoigiansudung == '') {
				flag = false;
				showError('thoigiansudung',
						'Không được để trống thời gian sử dụng');
			} else if (!/^\d*$/.test(dongia)) {
				flag = false;
				showError('thoigiansudung', 'Sai định dạng thời gian sử dụng');
			} else {
				showError('thoigiansudung', '');
			}

			return flag;
		}
	</script>
	  
	
   <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</html>