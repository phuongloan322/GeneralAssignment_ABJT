<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  	<%@ include file="/WEB-INF/views/layout/header.jsp" %>
</head>

<body class="g-sidenav-show  bg-gray-200">
  <%@ include file="/WEB-INF/views/layout/sidebar.jsp" %>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/layout/navbar.jsp" %>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
        	<c:if test="${msg != null }">
	       		<div class="alert alert-success"  role="alert">${msg }</div>     
	      	</c:if>
	      	<%@ include file="/WEB-INF/views/layout/message.jsp" %>
        	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalThem">
            	<i class="material-icons large">add_box</i> Add new
            </button>
            
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">Authors table</h6>
              </div>
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
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
		                        <a href="a" onclick="deleteX()" id="deleteButton" ><i class="material-icons delete" style="color:red">delete</i></a>
                   
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
  </main>
  
  <!-- Button trigger modal -->

  <!-- Modal ADD-->
  <div class="modal fade" id="modalThem" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Tạo mới máy</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form action="add-may" method="post">
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">Mã máy:</label>
	            <input type="text" class="form-control border p-2" id="mamay" name="mamay">
	            <div id="error-mamay" style="color:red; "></div>
	          </div>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">Vị trí:</label>
	            <input type="text" class="form-control border p-2" id="vitri" name="vitri">
	            <div id="error-vitri" style="color:red;"></div>
	          </div>
	          <div class="mb-3">
	            <label for="message-text" class="col-form-label">Trạng thái:</label>
	            <select class="form-select border p-2"  id="trangthai" name="trangthai">
				  <option value="" selected>--SELECT A CHOOSE--</option>
				  <option value="Rảnh">Rảnh</option>
				  <option value="Bận">Bận</option>
				  <option value="Đang sửa chữa">Đang sửa chữa</option>
				</select>
				<div id="error-trangthai" style="color:red; "></div>
	          </div>
	          <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
		        <button onclick="return validate()" class="btn btn-primary">Tạo</button>
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
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
	        <a href="" id="confirmDeleteButton" type="button" class="btn btn-primary">Xóa</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 <script type="text/javascript">
	 function deleteX(event) {
		 event.preventDefault();
		 $('#deleteModal').modal();
	 }
	  $(document).ready(function(){
		
		  $('#deleteButton').on('click', function(event) {
			  console.log("ok")
				event.preventDefault();
				var href = $(this).attr('href');
				$('#confirmDeleteButton').attr('href', href);
				$('#deleteModal').modal();
			}); 
	  });
	  
	</script>
	
  <!--   Core JS Files   -->
  <script src="assets/js/core/popper.min.js"></script>
  <!-- <script src="asets/js/core/bootstrap.min.js"></script>  -->
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  
  <script>

  function getValue(id) {
	    return document.getElementById(id).value.trim();
	}
	function showError(key, mess) {
	    document.getElementById('error-'+key).innerHTML = mess;
	}

  function validate() {
      var flag = true;
      var mamay = getValue('mamay');
      var vitri = getValue('vitri');
      var trangthai = getValue('trangthai');
      
      if (mamay == '') {
          flag = false;
          showError('mamay', 'Không được để trống mã máy');
        }
        else {
          showError('mamay', '');
        }

        if (vitri == '') {
          flag = false;
          showError('vitri', 'Không được để trống vị trí');
        }
        else {
          showError('vitri', '');
        }

        if (trangthai == '' || trangthai == null) {
          flag = false;
          showError('trangthai', 'Vui lòng chọn trạng thái');
        }
        else {
          showError('trangthai', '');
        }
   
      
      return flag;
  }


  </script>
  
 
	
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/material-dashboard.min.js?v=3.0.1"></script>
</body>

</html>