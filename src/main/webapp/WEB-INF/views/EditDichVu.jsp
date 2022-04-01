<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Quản Lý Dịch Vụ
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
            <a class="navbar-brand" href="javascript:void(0)">QUẢN LÝ DỊCH VỤ</a>
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
          
            <form action="<c:url value="/manager-category" />" method="post" class="navbar-form">
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" name="search" placeholder="Search...">
                <button type="submit" class="btn btn-default btn-round btn-just-icon">
                  <i class="material-icons">search</i>
                  <div class="ripple-container"></div>
                </button>
              </div>
            </form>
            
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
            <a href="<c:url value="/dichvu" />" type="button" class="btn btn-primary" >
            	<i class="material-icons large">arrow_back</i> Trở về
            </a>
			
              <div class="card">
					
				        <form action ="update-dichvu" method="post" class="m-5">
				        	<h3>Thông tin dịch vụ</h3>
				        	<div class="">
							    <label for="exampleFormControlFile1" class="">Mã dịch vụ</label>
							    <input type="text" class="form-control-file border p-2" id="madv" name="madv" value="${dichvu.maDV }" readonly>
							     <div id="error-madv" style="color:red;"></div><br>
							  </div>
				        	<div class="">
							    <label for="exampleFormControlFile1" class="">Tên dịch vụ</label>
							    <input type="text" class="form-control-file border p-2" id="tendv" name="tendv" value="${dichvu.tenDV }">
							     <div id="error-tendv" style="color:red;"></div><br>
							  </div>
							<div class="">
							    <label for="exampleFormControlFile1" class="">Đơn vị tính</label>
							    <input type="text" class="form-control-file border p-2" id="donvitinh" name="donvitinh" value="${dichvu.donViTinh }">
							     <div id="error-donvitinh" style="color:red;"></div><br>
							  </div>
							  <div class="">
							    <label for="exampleFormControlFile1" class="">Đơn giá</label>
							    <input type="number" class="form-control-file border p-2" id="dongia" name="dongia" value="${dichvu.donGia }">
							     <div id="error-dongia" style="color:red;"></div><br>
							  </div>
							  <br>
						        <button onclick="return validate()" type="submit" class="btn btn-primary">Cập nhật</button>    
				        </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
	<script>

	  function getValue(id) {
		    return document.getElementById(id).value.trim();
		}
		function showError(key, mess) {
		    document.getElementById('error-'+key).innerHTML = mess;
		}
	
	  function validate() {
	      var flag = true;
	      var madv = getValue('madv');
	      var tendv = getValue('tendv');
	      var donvitinh = getValue('donvitinh');
	      var dongia = getValue('dongia');
	      var formatMaDV = /^(DV)[0-9]{3}$/;
	      
	        if (madv == '') {
	          flag = false;
	          showError('madv', 'Không được để trống mã dịch vụ');
	        }
	        else if(!formatMaDV.test(madv)) {
		    	  flag = false;
	        	showError('madv', 'Sai định dạng mã dịch vụ');
	        }
	        else {
	          showError('madv', '');
	        }
	
	        if (tendv == '') {
	          flag = false;
	          showError('tendv', 'Không được để trống tên dịch vụ');
	        }
	        else {
	          showError('tendv', '');
	        }
	
	        if (donvitinh == '') {
	          flag = false;
	          showError('donvitinh', 'Không được để trống đơn vị tính');
	        }
	        else {
	          showError('donvitinh', '');
	        }
	        
	        if(dongia == ''){
	        	flag = false;
	        	showError('dongia', 'Không được để trống đơn giá');
	        }
	        else if (!/^\d*$/.test(dongia)) {
	        	flag = false;
	        	showError('dongia', 'Sai định dạng đơn giá');
	        }
	        else {
	        	showError('dongia', '');
	        }
	   
	      
	      return flag;
	  }
	
	
	  </script>
	  
	
   <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</html>