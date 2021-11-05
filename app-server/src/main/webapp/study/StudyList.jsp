<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>목록 | 스터디 찾기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<h1>📖 스터디 목록</h1>
	<!-- <div class="row" style="background-color: yellow">
  <div class="col-md-4"><a href='list?perno=${perno}'>전체</a></div>
  <div class="col-md-4"><a href='list/ing?perno=${perno}'>진행</a></div>
  <div class="col-md-4"><a href='list/end?perno=${perno}'>완료</a></div>
  </div> -->
<button>
    <a href='list?perno=${perno}'>전체</a>
</button>
<button>
    <a href='list/ing?perno=${perno}'>진행</a>
</button>
<button>
	<a href='list/end?perno=${perno}'>완료</a>
</button><br>
<button>
	<a href='form?perno=${perno}'>등록</a>
</button><br>
<div class="input-group mb-3">
<select name="f">
<option ${(param.f eq "area")? "selected" : ""} value="area">지역</option>
<option ${(param.f eq "subjectName")? "selected" : ""} value="subjectName">분야</option>
<option ${(param.f eq "studyTitle")? "selected" : ""} value="studyTitle">스터디명</option>
</select>
<input type="text" name="q" value="${param.q}" class="form-control" placeholder="지역 / 분야 / 스터디명으로 검색할 수 있습니다." aria-label="Recipient's username" aria-describedby="button-addon2">
<button class="btn btn-outline-secondary" type="submit" id="button-addon2">
  <a href='search'>검색</a>
</button>
</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>북마크</th>
				<th>제목</th>
				<th>대면/비대면</th>
				<th>조장</th>
				<th>분야</th>
				<th>지역</th>
				<th>인원수</th>
				<th>최대 인원수</th>
			</tr>
			</thread>
	  <!--
	  request.setCharacterEncoding("utf-8");
	  Connection conn = null;
	  PreparedStatement pstmt = null;
	  ResultSet rs = null;
	  
	  Class.forName("com.mysql.jdbc.Driver");
	  String sk = request.getParameter("sk");
	  String sv = request.getParameter("sv");
	  
	  try {
	    String jdbcDriver = "jdbc:mysql://localhost:3306/doublesdb?" +
	  "useUnicode=true&characterEncoding=euckr";
	    String dbUser = "doublesid";
	    String dbpass = "doublespw";
	    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
	    if (sk == null & sv == null) {
	      pstmt = conn.prepareStatement("select * from study");
	    } else if (sk != null & sv.equals("")) {
	        pstmt = conn.prepareStatement("select * from study");
	      } else if (sk != null & sv != null) {
	        pstmt = conn.prepareStatement("select * from study where "+sk+"=?);
	      pstmt.set
	      }
	  }
	  -->
		<tbody>
			<c:forEach items="${studyList}" var="study">
				<tr>
					<td>${study.studyNo}</td>
					<td>${study.countBookMember}</td>
					<td><a href='detail?studyno=${study.studyNo}&perno=${perno}'>${study.studyTitle}</a></td>
					<td>${study.faceName}</td>
					<td>${study.owner.perNickname}</td>
					<td>${study.subjectName}</td>
					<td>${study.area}</td>
					<td>${study.countMember}</td>
					<td>${study.numberOfPeple}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
