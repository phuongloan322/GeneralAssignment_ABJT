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
            <a class="navbar-brand" href="javascript:void(0)">QUẢN LÝ MỤC THUÊ</a>
          </div>
          
          <div class="collapse navbar-collapse justify-content-end">
          
            <form action="<c:url value="/may" />" method="post" class="navbar-form">
              <div class="input-group no-border">
                <input type="text" style="color:#fff" class="form-control" name="search" placeholder="Search...">
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
				<li class="action"><a href="<c:url value="/may/${loop.index }"/>">${loop.index }</a></li>
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
                  <h4 class="card-title ">Quản lý máy</h4>
                  <p class="card-category"> Danh sách Máy</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                  	<c:choose>
		              	<c:when test="${mayList.size() == 0 }">
		              		<h5 class="p-5">Không có dữ liệu máy nào...</h5>
		              	</c:when>
		              	<c:otherwise>
		              		<table class="table align-items-center mb-0">
			                  <thead>
			                    <tr>
			                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Author</th>
			                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Function</th>
			                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Status</th>
			                      <th class="text-secondary opacity-7"></th>
			                    </tr>
			                  </thead>
			                  <tbody>
			                    
			                      <c:forEach var="item" items="${mayList }">
			                      	<tr>
				                      <td  class="ps-4">
				                        <p class="text-xs font-weight-bold mb-0">${item.maMay }</p>
				                      </td>
				                      <td class="align-middle text-sm">
				                        <span class="text-secondary text-xs font-weight-bold">${item.viTri }</span>
				                      </td>
				                      <td class="align-middle">
				                        <span class="text-secondary text-xs font-weight-bold">${item.trangThai }</span>
				                      </td>
				                      <td class="align-middle">
				                      	<a href="<c:url value="/may/findById/${item.maMay }" />" id="editButton"><i class="material-icons edit">mode_edit</i></a>
				                        <a href="<c:url value="/delete/${item.maMay }"/>" id="deleteButton" ><i class="material-icons delete" style="color:red">delete</i></a>
		                   
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
	        <h5 class="modal-title" id="exampleModalLabel">Tạo mới máy</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<c:url value="/add-may"/>" method="post">
				<label for="exampleFormControlFile1" class="">Mã máy:</label><br>
				<input type="text" class="form-control-file border p-2" id="mamay" name="mamay">
	            <div id="error-mamay" style="color:red; "></div><br>
				  
				<label for="exampleFormControlFile1" class="">Vị trí:</label>
				<input type="text" class="form-control-file  border p-2" id="vitri" name="vitri">
	            <div id="error-vitri" style="color:red;"></div><br>
				
				<label for="message-text" class="col-form-label">Trạng thái:</label><br>
	            <select class="form-select border p-2"  id="trangthai" name="trangthai" style="width: 100%">
				  <option value="" selected>--SELECT A CHOOSE--</option>
				  <option value="Rảnh">Rảnh</option>
				  <option value="Bận">Bận</option>
				  <option value="Đang sửa chữa">Đang sửa chữa</option>
				</select>
				<div id="error-trangthai" style="color:red; "></div><br>
				  
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
			        <button onclick="return validate()" type="submit" class="btn btn-primary">Tạo</button>
			    </div>        
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- MODAL EDIT -->	

	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Thông tin Khách hàng</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<c:url value="/update-may"/>" method="post">
	        
	        	<div class="">
				    <label for="exampleFormControlFile1" class="">Mã máy</label>
				    <input type="text" class="form-control-file border p-2" id="edit-mamay" name="mamay"  readonly>
				    <div id="error-edit-mamay" style="color:red;"></div>
				  </div>
	        	<div class="">
				    <label for="exampleFormControlFile1" class="">Tên máy</label>
				    <input type="text" class="form-control-file border p-2" id="edit-vitri" name="vitri" >
				    <div id="error-edit-vitri" style="color:red;"></div>
				  </div>
				  <div class="">
				    <label for="exampleFormControlFile1" class="">Trạng thái</label>
				    <select class="form-select border p-2"  id="edit-trangthai" name="trangthai" style="width: 100%">
					  <option value="" selected>--SELECT A CHOOSE--</option>
					  <option value="Rảnh">Rảnh</option>
					  <option value="Bận">Bận</option>
					  <option value="Đang sửa chữa">Đang sửa chữa</option>
					</select>
					<div id="error-edit-trangthai" style="color:red;"></div>
				  </div>
				  
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
			        <button onclick="return validateEdit()" type="submit" class="btn btn-primary">Cập nhật</button>
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
	        <h5 class="modal-title" id="exampleModalLabel">Xóa máy</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	       Bạn có chắc chắn muốn xóa máy này không?
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
		document.getElementById('error-' + key).innerHTML = mess;
	}

	function validate() {
		var flag = true;
		var mamay = getValue('mamay');
		var vitri = getValue('vitri');
		var trangthai = getValue('trangthai');

		if (mamay == '') {
			flag = false;
			showError('mamay', 'Không được để trống mã máy');
		} else {
			showError('mamay', '');
		}

		if (vitri == '') {
			flag = false;
			showError('vitri', 'Không được để trống vị trí');
		} else {
			showError('vitri', '');
		}

		if (trangthai == '' || trangthai == null) {
			flag = false;
			showError('trangthai', 'Vui lòng chọn trạng thái');
		} else {
			showError('trangthai', '');
		}

		return flag;
	}

	function showErrorEdit(key, mess) {
		document.getElementById('error-edit-' + key).innerHTML = mess;
	}

	function validateEdit() {
		var flag = true;
		var mamay = getValue('edit-mamay');
		var vitri = getValue('edit-vitri');
		var trangthai = getValue('edit-trangthai');

		console.log(mamay);
		if (mamay == '') {
			flag = false;
			showErrorEdit('mamay', 'Không được để trống mã máy');
		} else {
			showErrorEdit('mamay', '');
		}

		if (vitri == '') {
			flag = false;
			showErrorEdit('vitri', 'Không được để trống vị trí');
		} else {
			showErrorEdit('vitri', '');
		}

		if (trangthai == '' || trangthai == null) {
			flag = false;
			showErrorEdit('trangthai', 'Vui lòng chọn trạng thái');
		} else {
			showErrorEdit('trangthai', '');
		} 

		return flag;
	}


	</script>
	
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

	 <script type="text/javascript">
	  $(document).ready(function(){
		  
		  $('table #editButton').on('click', function(event){
				event.preventDefault();
				
				var href= $(this).attr('href')
				 $.get(href, function(may, status){
					$('#edit-mamay').val(may.MaMay);
					$('#edit-vitri').val(may.ViTri);
					$('#edit-trangthai').val(may.TrangThai);
				});  
				
				$('#editModal').modal();
			});
		
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