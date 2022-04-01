<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>Quản Lý Mục Thuê</title>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
</head>

<body class="light-edition">
	<div class="wrapper ">
		<%@ include file="/WEB-INF/views/layout/sidebar.jsp"%>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top "
				style="background: DarkSlateGray !important; color: #fff;"
				id="navigation-example">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<a class="navbar-brand" href="javascript:void(0)">QUẢN LÝ
							KHÁCH HÀNG</a>
					</div>

					<div class="collapse navbar-collapse justify-content-end">

						<form action="<c:url value="/khachhang" />" method="post"
							class="navbar-form">
							<div class="input-group no-border">
								<input type="text" value="" class="form-control" name="search"
									placeholder="Search...">
								<button type="submit"
									class="btn btn-default btn-round btn-just-icon">
									<i class="material-icons">search</i>
									<div class="ripple-container"></div>
								</button>
							</div>
						</form>

						<%@ include file="/WEB-INF/views/layout/navbar.jsp"%>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->

			<div class="content">

				<div id="msg">
					<c:if test="${msg != null }">
						<div class="alert alert-info" role="alert">${msg }</div>
					</c:if>
				</div>
				<%@ include file="/WEB-INF/views/layout/message.jsp"%>

				<ul class="pagination modal-6">
					<li><a href="#" class="prev">&laquo</a></li>
					<c:forEach begin="1" end="${totalPageNumber }" varStatus="loop">
						<li class="action"><a
							href="<c:url value="/khachhang/${loop.index }"/>">${loop.index }</a></li>
					</c:forEach>
					<li><a href="#" class="next">&raquo;</a></li>
				</ul>

				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#modalThem">
								<i class="material-icons large">add_box</i> Add new
							</button>

							<div class="card">
								<div class="card-header card-header-primary">
									<h4 class="card-title ">Quản lý Khách hàng</h4>
									<p class="card-category">Danh sách Khách hàng</p>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<c:choose>
											<c:when test="${customerList.size() == 0 }">
												<h5 class="p-5">Không có dữ liệu khách hàng nào...</h5>
											</c:when>
											<c:otherwise>
												<table class="table align-items-center mb-0">
													<thead>
														<tr>
															<th
																class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Mã
																Khách hàng</th>
															<th
																class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Tên
																Khách hàng</th>
															<th
																class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Địa
																chỉ</th>
															<th
																class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Số
																điện thoại</th>
															<th
																class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Địa
																chỉ Email</th>
															<th class="text-secondary opacity-7"></th>
														</tr>
													</thead>
													<tbody>

														<c:forEach var="item" items="${customerList }">
															<tr>
																<td class="ps-4">
																	<p class="text-xs font-weight-bold mb-0">${item.maKH }</p>
																</td>
																<td class="align-middle text-sm"><span
																	class="text-secondary text-xs font-weight-bold">${item.tenKH }</span>
																</td>
																<td class="align-middle"><span
																	class="text-secondary text-xs font-weight-bold">${item.diaChi }</span>
																</td>
																<td class="align-middle"><span
																	class="text-secondary text-xs font-weight-bold">${item.soDienThoai }</span>
																</td>
																<td class="align-middle"><span
																	class="text-secondary text-xs font-weight-bold">${item.diaChiEmail }</span>
																</td>
																<td class="align-middle"><a
																	href="<c:url value="/delete-kh/${item.maKH }"/>" id="deleteButton"><i
																		class="material-icons delete" style="color: red">delete</i></a>

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
	<div class="modal fade" id="modalThem" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Tạo mới khách
						hàng</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="<c:url value="/add-khachhang"/>" method="post">
						<label for="exampleFormControlFile1" class="">Mã khách
							hàng:</label><br> <input type="text"
							class="form-control-file border p-2" id="makh" name="makh">
						<div id="error-makh" style="color: red;"></div>
						<br> <label for="exampleFormControlFile1" class="">Tên
							khách hàng:</label> <input type="text"
							class="form-control-file  border p-2" id="tenkh" name="tenkh">
						<div id="error-tenkh" style="color: red;"></div>
						<br> <label for="exampleFormControlFile1" class="">Địa
							chỉ:</label> <input type="text" class="form-control-file  border p-2"
							id="diachi" name="diachi">
						<div id="error-diachi" style="color: red;"></div>
						<br> <label for="exampleFormControlFile1" class="">Số
							điện thoại:</label> <input type="text"
							class="form-control-file  border p-2" id="sdt" name="sdt">
						<div id="error-sdt" style="color: red;"></div>
						<br> <label for="exampleFormControlFile1" class="">Email:</label>
						<input type="text" class="form-control-file  border p-2"
							id="email" name="email">
						<div id="error-email" style="color: red;"></div>
						<br>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Hủy</button>
							<button onclick="return validate()" type="submit"
								class="btn btn-primary">Tạo</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- DELETE MODAL -->

	<div class="modal " id="deleteModal" tabindex="-1"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Xóa Khách hàng</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Bạn có chắc chắn muốn xóa khách hàng
					này không?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
					<a href="" id="confirmDeleteButton" type="button"
						class="btn btn-primary">Xóa</a>
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
			var makh = getValue('makh');
			var tenkh = getValue('tenkh');
			var diachi = getValue('diachi');
			var sdt = getValue('sdt');
			var email = getValue('email');
			var formatMaKH = /^(KH)[0-9]{5}$/;
			var formatSDT1 = /^(090)[0-9]{7}$/;
			var formatSDT2 = /^(091)[0-9]{7}$/;
			var formatSDT3 = /^(8490)[0-9]{7}$/;
			var formatSDT4 = /^(8491)[0-9]{7}$/;

			/* /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/; */
			var mailformat = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			if (makh == '') {
				flag = false;
				showError('makh', 'Không được để trống mã khách hàng');
			} else if (!formatMaKH.test(makh)) {
				flag = false;
				showError('makh', 'Sai định dạng mã khách hàng');
			} else {
				showError('makh', '');
			}

			if (tenkh == '') {
				flag = false;
				showError('tenkh', 'Không được để trống tên khách hàng');
			} else {
				showError('tenkh', '');
			}

			if (diachi == '') {
				flag = false;
				showError('diachi', 'Không được để trống địa chỉ');
			} else {
				showError('diachi', '');
			}

			if (sdt == '') {
				flag = false;
				showError('sdt', 'Không được để trống số điện thoại');
			} else if (!formatSDT1.test(sdt) && !formatSDT2.test(sdt)
					&& !formatSDT3.test(sdt) && !formatSDT4.test(sdt)) {
				flag = false;
				showError('sdt', 'Sai định dạng số điện thoại');
			} else {
				showError('sdt', '');
			}

			if (email == '') {
				flag = false;
				showError('email', 'Không được để trống email');
			} else if (!mailformat.test(email)) {
				flag = false;
				showError('email', 'Sai định dạng email');
			} else {
				showError('email', '');
			}

			return flag;
		}
	</script>


	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			$('table #deleteButton').on('click', function() {
				event.preventDefault();
				var href = $(this).attr('href');
				$('#confirmDeleteButton').attr('href', href);
				$('#deleteModal').modal();
			});
		});
	</script>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</html>