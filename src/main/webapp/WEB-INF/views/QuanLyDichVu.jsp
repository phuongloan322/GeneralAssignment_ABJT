<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Quản Lý Mục Thuê
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
          
            <form action="<c:url value="/dichvu" />" method="post" class="navbar-form">
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

		<ul class="pagination modal-6">
			<li><a href="#" class="prev">&laquo</a></li>
			<c:forEach begin="1" end="${totalPageNumber }" varStatus="loop">
				<li class="action"><a href="<c:url value="/dichvu/${loop.index }"/>">${loop.index }</a></li>
			</c:forEach>
			<li><a href="#" class="next">&raquo;</a></li>
		</ul>
      
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalThem">
            	<i class="material-icons large">add_box</i> Add new
            </button>
			
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Quản lý dịch vụ</h4>
                  <p class="card-category"> Danh sách dịch vụ</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                  	<c:choose>
		              	<c:when test="${dvList.size() == 0 }">
		              		<h5 class="p-5">Không có dữ liệu dịch vụ nào...</h5>
		              	</c:when>
		              	<c:otherwise>
		              		<table class="table align-items-center mb-0">
			                  <thead>
			                    <tr>
			                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Mã dịch vụ</th>
			                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Tên dịch vụ</th>
			                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Đơn vị tính</th>
			                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Đơn giá</th>
			                      <th class="text-secondary opacity-7"></th>
			                    </tr>
			                  </thead>
			                  <tbody>
			                    
			                      <c:forEach var="item" items="${dvList }">
			                      	<tr>
				                      <td  class="ps-4">
				                        <p class="text-xs font-weight-bold mb-0">${item.maDV }</p>
				                      </td>
				                      <td class="align-middle text-sm">
				                        <span class="text-secondary text-xs font-weight-bold">${item.tenDV }</span>
				                      </td>
				                      <td class="align-middle">
				                        <span class="text-secondary text-xs font-weight-bold">${item.donViTinh }</span>
				                      </td>
				                      <td class="align-middle">
				                        <span class="text-secondary text-xs font-weight-bold">${item.donGia }</span>
				                      </td>
				                      <td class="align-middle">
				                      	<a href="<c:url value="update-dichvu/${item.maDV }"/>" id="editButton"><i class="material-icons edit">mode_edit</i></a>
				                        <a href="<c:url value="delete-dv/${item.maDV }" />" id="deleteButton"><i class="material-icons delete" style="color:red">delete</i></a>
		                   
				                      </td>
				                      </tr>
			                      </c:forEach>
			                    
			                  </tbody>
			                </table>
		              	</c:otherwise>
		              </c:choose>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Modal ADD-->
	<div class="modal fade" id="modalThem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Tạo mới dịch vụ</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<c:url value="/add-dichvu"/>" method="post">
				<label for="exampleFormControlFile1" class="">Mã dịch vụ:</label><br>
				<input type="text" class="form-control-file border p-2" id="madv" name="madv">
	            <div id="error-madv" style="color:red; "></div><br>
				  
				<label for="exampleFormControlFile1" class="">Tên dịch vụ:</label>
				<input type="text" class="form-control-file  border p-2" id="tendv" name="tendv">
	            <div id="error-tendv" style="color:red;"></div><br>
				
				<label for="exampleFormControlFile1" class="">Đơn vị tính:</label>
				<input type="text" class="form-control-file  border p-2" id="donvitinh" name="donvitinh">
	            <div id="error-donvitinh" style="color:red;"></div><br>
	            
	            <label for="exampleFormControlFile1" class="">Đơn giá:</label>
				<input type="text" class="form-control-file  border p-2" id="dongia" name="dongia">
	            <div id="error-dongia" style="color:red;"></div><br>
	            
				  
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
			        <button onclick="return validate()" type="submit" class="btn btn-primary">Tạo</button>
			    </div>        
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	 <!-- DELETE MODAL -->
	 
	<div class="modal " id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Xóa dịch vụ</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       Bạn có chắc chắn muốn xóa dịch vụ này không?
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
	        <a href="" id="confirmDeleteButton" type="button" class="btn btn-primary">Xóa</a>
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
	        else if (dongia < 1000 || dongia > 10000) {
	        	flag = false;
	        	showError('dongia', 'Don gia phai tu 1000 den 10000');
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
	  
	
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

	 <script type="text/javascript">
	  $(document).ready(function(){
		
		  $('table #deleteButton').on('click', function() {
				event.preventDefault();
				var href = $(this).attr('href');
				$('#confirmDeleteButton').attr('href', href);
				$('#deleteModal').modal();
			});
	  });
	  
	</script>
   <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</html>