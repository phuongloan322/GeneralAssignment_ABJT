<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>
    Hiển thị thông tin
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
            <a class="navbar-brand" href="javascript:void(0)">QUẢN LÝ THÔNG TIN</a>
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
			
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Hiển thị thông tin</h4>
                  
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                  	<c:choose>
		              	<c:when test="${dsSDMay.size() == 0 }">
		              		<h5 class="p-5">Không có dữ liệu nào...</h5>
		              	</c:when>
		              	<c:otherwise>
		              		<table class="table align-items-center mb-0">
			                  <thead>
			                    <tr>
			                      <th class="">Mã Khách hàng</th>
			                      <th class=" ps-2">Tên Khách hàng</th>
			                      <th class=" ps-2">Mã máy</th>
			                      <th class=" ps-2">Vị trí</th>
			                      <th class=" ps-2">Trạng thái</th>
			                      <th class=" ps-2">Ngày bắt đầu sử dụng</th>
			                      <th class=" ps-2">Giờ bắt đầu sử dụng</th>
			                      <th class=" ps-2">Thời gian sử dụng</th>
			                      <th class=" ps-2">Mã dịch vụ</th>
			                      <th class=" ps-2">Tên dịch vụ</th>
			                      <th class=" ps-2">Ngày sử dụng</th>
			                      <th class=" ps-2">Giờ sử dụng</th>
			                      <th class=" ps-2">Số lượng</th>
			                      <th class=" ps-2">Đơn giá</th>
			                      <th class=" ps-2">Tổng tiền dịch vụ</th>
			                      <th class="text-secondary opacity-7"></th>
			                    </tr>
			                  </thead>
			                  <tbody>
			                    
			                      <c:forEach var="item" items="${dsSDMay }" varStatus="loop">
			                      	<tr>
				                      <td  class="ps-4">
				                        <p class="text-xs font-weight-bold mb-0">${item.KH.maKH }</p>
				                      </td>
				                      <td class="align-middle text-sm">
				                        <span class="text-secondary text-xs font-weight-bold">${item.KH.tenKH }</span>
				                      </td>
				                      <td class="align-middle">
				                        <span class="text-secondary text-xs font-weight-bold">${item.may.maMay }</span>
				                      </td>
				                      <td class="align-middle">
				                        <span class="text-secondary text-xs font-weight-bold">${item.may.viTri }</span>
				                      </td>
				                      <td class="align-middle">
				                        <span class="text-secondary text-xs font-weight-bold">${item.may.trangThai }</span>
				                      </td>
				                      <td class="align-middle">
				                        <span class="text-secondary text-xs font-weight-bold">${item.ngayBatDauSuDung }</span>
				                      </td>
				                      <td class="align-middle">
				                        <span class="text-secondary text-xs font-weight-bold">${item.gioBatDauSuDung }</span>
				                      </td>
				                       <td class="align-middle">
				                        <span class="text-secondary text-xs font-weight-bold">${item.thoiGianSuDung }</span>
				                      </td>
				                      <c:forEach var="item2" items="${dsSDDV }" varStatus="loop2">
				                      	<c:if test="${loop.index == loop2.index }">
				                      		  <td class="align-middle text-sm">
						                        <span class="text-secondary text-xs font-weight-bold">${item2.DV.maDV }</span>
						                      </td>
						                      <td class="align-middle text-sm">
						                        <span class="text-secondary text-xs font-weight-bold">${item2.DV.tenDV }</span>
						                      </td>
						                      <td class="align-middle">
						                        <span class="text-secondary text-xs font-weight-bold">${item2.ngaySuDung }</span>
						                      </td>
						                      <td class="align-middle">
						                        <span class="text-secondary text-xs font-weight-bold">${item2.gioSuDung }</span>
						                      </td>
						                      <td class="align-middle">
						                        <span class="text-secondary text-xs font-weight-bold">${item2.soLuong }</span>
						                      </td>
						                      <td class="align-middle">
						                        <span class="text-secondary text-xs font-weight-bold">${item2.DV.donGia }</span>
						                      </td>
						                      <td class="align-middle">
						                        <span class="text-secondary text-xs font-weight-bold">${item2.DV.donGia *item2.soLuong }</span>
						                      </td>
				                      	</c:if>
				                      </c:forEach>
				                      
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

	
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

   <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</html>