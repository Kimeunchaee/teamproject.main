<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <title>공지게시판</title>
   <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.css">
   
   <script src="../node_modules/@popperjs/core/dist/umd/popper.js"></script> <!-- 의존하는 것 우선 -->
   <script src="../node_modules/bootstrap/dist/js/bootstrap.js"></script>
  <style>
  label {
    margin-right: 5px;
    text-align: center;
    display: inline;
    width: 60px;
  }
  legend {
    text-align: center;
  }
  div {
  margin-right: 10px;
  }
  a {
  color : black;
  text-decoration : auto;
  }
  a:hover {
  color : lightgray;
  }
  </style>
</head>
<body>
<fieldset>
<br>
<legend ><b> 🔔 공지게시글 목록 </b></legend><br>
<hr>
<table class="table table-responsive">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>내용</th>
<th>파일</th>
<th>등록일</th>
</tr>
</thead>
<tbody>
<c:forEach items="${adminNoticeList}" var="noticeList">
<tr>
	<td>( ${noticeList.adminNotiNo} )</td>
	<td><a href='detail?no=${noticeList.adminNotiNo}'>${noticeList.adminNotiTitle}</a></td>
	<td>${noticeList.adminNotiContent}</td>
	<td>${noticeList.adminNotiFile}</td>
	<td>${noticeList.adminNotiRegisteredDate}</td>
</tr>
</c:forEach>
</tbody>
</table>
</fieldset>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
<button type="submit" class="btn btn-outline-dark" value="등록"><a href='form'>등록</a></button>
<button type="submit" class="btn btn-outline-dark" value="로그아웃" ><a href='/ogong/admin/logout'>로그아웃</a></button> 
</div>
</body>
</html>