<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div class="sidebar" data-color="purple" data-background-color="black" data-image=<c:url value="/assets/img/sidebar-2.jpg"/>">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo"><a href="<c:url value="/index" />" class="simple-text logo-normal">
          <h2>Lona</h2>
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
        
          
          <li class="nav-item  ">
            <a class="nav-link" href="<c:url value="/index" />">
              <i class="material-icons">dashboard</i>
              <p>Trang chủ</p>
            </a>
          </li>
          
          <li class="nav-item ">
            <a class="nav-link" href="<c:url value="/may" />">
              <i class="material-icons">content_paste</i>
              <p>Quản lý máy</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="<c:url value="/khachhang" />">
              <i class="material-icons">home</i>
              <p>Quản lý khách hàng</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="<c:url value="/dichvu" />">
              <i class="material-icons">account_circle</i>
              <p>Quản lý dịch vụ</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="<c:url value="/dangkysudungmay" />">
              <i class="material-icons">assignment_turned_in</i>
              <p>Đăng ký sử dụng máy</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="<c:url value="/dangkysudungdichvu" />">
              <i class="material-icons">library_books</i>
              <p>Đăng ký sử dụng dịch vụ</p>
            </a>
          </li>
          
          <li class="nav-item ">
            <a class="nav-link" href="<c:url value="/hienthithongtin" />">
              <i class="material-icons">arrow_forward</i>
              <p>Hiển thị thông tin</p>
            </a>
          </li>
         
        </ul>
      </div>
    </div>