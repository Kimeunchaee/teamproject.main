<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!-- @ page import="java.sql.DriverManager"%>
@ page import="java.sql.Connection"%>
@ page import="java.sql.PreparedStatement"%>
@ page import="java.sql.ResultSet"%>
@ page import="java.sql.SQLException"%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<style>
* {
  margin:0;
  padding:0;
  font-size:14px;
  line-height:1.5;
}
ul{
  list-style:none;
}
.template-content {
  height: 1600px;
  overflow: scroll;
}
.tabmenu{
  max-width:900px;
  margin: 0 auto;
  position:relative;
  margin-top: 50px;
}
.tabmenu ul li{
  display: inline-block;
  width:33.33%; 
  float:left;
}
.tabmenu ul li a{
  display:block;
  line-height:40px;
  text-decoration:none; 
}
.tabCon{
  display:none;
  padding: 20px;
  position:absolute; 
  left:0;
  top:40px;
  box-sizing: border-box;
  width: 900px;
}
.btnCon:target  {
  background : rgb(247, 231, 215);
  xfont-weight: bold;
}
.btnCon:target .tabCon{
  display: block;
}
.card-body {
	flex: 1 1 auto;
	padding: 1rem 1rem;
	height: 185px;
}
#search {
  text-align:center;
}
#empty-study {
  text-align: center;
}
</style>
</head>
	<!-- <h3><a href="list?perno=${perno}">📖 스터디 목록</a></h3><br> -->
	<!-- <div class="row" style="background-color: yellow">
  <div class="col-md-4"><a href='list?perno=${perno}'>전체</a></div>
  <div class="col-md-4"><a href='list/ing?perno=${perno}'>진행</a></div>
  <div class="col-md-4"><a href='list/end?perno=${perno}'>완료</a></div>
  </div> -->
	<!-- <button>
		<a href='list?perno=${perno}'>전체</a>
	</button>
	<button>
		<a href='list/ing?perno=${perno}'>진행</a>
	</button>
	<button>
		<a href='list/end?perno=${perno}'>완료</a>
	</button>
	<br>
	
	<!-- [GR] Search Ver.2 -->
	<!-- <div class="input-group mb-3">
		<select name="sk">
			<option value="area">지역</option>
			<option value="subjectName">분야</option>
			<option value="studyTitle">스터디명</option>
		</select> <input type="text" name="sv" class="form-control"
			placeholder="지역 / 분야 / 스터디명으로 검색할 수 있습니다."
			aria-label="Recipient's username" aria-describedby="button-addon2">
		<input type="submit" value="검색" class="btn btn-outline-secondary"
			id="button-addon2">
	</div>  -->
	<body>
  <div class="tabmenu">
  <ul>
  <!-- 전체 스터디 목록 -->
    <li id="tab1" class="btnCon"><a class="btn first" href="#tab1">전체</a>
      <div class="tabCon" >
      <br>
	<div id="search">
    <form action="search" method='get'>
    <select name="where">
      <option value="1">분야</option>
      <option value="2">제목</option>
      <option value="3">지역</option>
    </select>
    <input type="text" name="keyword">
    <button class="btn btn-outline-dark btn-sm">검색</button>
    </form>
  </div>
  <div id="button" class="d-grid gap-2 d-md-flex justify-content-md-end">
	  <button class="btn btn-light">
	    <a href='form'>글쓰기</a>
	  </button>
  </div>
  <br>
<c:if test='${not empty studyList}'>
<div id="content">
  <div class="row row-cols-1 row-cols-md-2 g-5">
  <c:forEach items="${studyList}" var="study">
  <div class="col">
	<div class="card">
	  <div class="card-header">
	    ${study.subjectName}
	  </div>
	  <div class="card-body">
	    <h5 class="card-title" style="font-weight: bold">
        <a href='detail?studyno=${study.studyNo}'>${study.studyTitle}</a>
	    </h5>
	    <p class="card-text">${study.introduction}</p>
	    ${study.faceName}<br>
      인원 ${study.countMember}/${study.numberOfPeple}<br>
      ${study.owner.perNickname}
      ⭐${study.countBookMember}
	  </div>
  </div>
  </div>
 </c:forEach>
 </div>
 </div>
  <!-- <div id="content">
    <div class="row row-cols-1 row-cols-md-2 g-4">
    <c:forEach items="${studyList}" var="study">
      <div class="col">
        <div class="card">
          <div class="card-body">
            <span style="color:royalblue">${study.subjectName}</span><br>
            <span style="font-weight: bold"><a href='detail?studyno=${study.studyNo}'>${study.studyTitle}</a></span><br>
            ${study.faceName}<br>
            <c:if test="${study.faceName ne '비대면'}">
            ${study.area}<br>
            </c:if>
            인원 ${study.countMember}/${study.numberOfPeple}<br>
            ${study.owner.perNickname}
            🔖${study.countBookMember}
          </div>
        </div>
      </div>
    </c:forEach>
    </div>
  </div> -->
</c:if>
<div id="empty-study">
<c:if test='${empty studyList}'>
   검색 결과가 존재하지 않습니다.<br><br>
</c:if>
</div>
</div>
</li>

<!-- 진행 스터디 목록 -->
<li id="tab2" class="btnCon"><a class="btn" href="#tab2">진행</a>
      <div class="tabCon" >
      <br>
  <div id="search">
    <form action="search" method='get'>
    <select name="where">
      <option value="1">분야</option>
      <option value="2">제목</option>
      <option value="3">지역</option>
    </select>
    <input type="text" name="keyword">
    <button class="btn btn-outline-dark btn-sm">검색</button>
    </form>
  </div>
  <div id="button" class="d-grid gap-2 d-md-flex justify-content-md-end">
    <button class="btn btn-light">
      <a href='form'>글쓰기</a>
    </button>
  </div>
  <br>
<c:if test='${not empty studyIngList}'>
<div id="content">
  <div class="row row-cols-1 row-cols-md-2 g-5">
  <c:forEach items="${studyIngList}" var="study">
  <div class="col">
  <div class="card">
    <div class="card-header">
      ${study.subjectName}
    </div>
    <div class="card-body">
      <h5 class="card-title" style="font-weight: bold">
        <a href='detail?studyno=${study.studyNo}'>${study.studyTitle}</a>
      </h5>
      <p class="card-text">${study.introduction}</p>
      ${study.faceName}<br>
      인원 ${study.countMember}/${study.numberOfPeple}<br>
      ${study.owner.perNickname}
      ⭐${study.countBookMember}
    </div>
  </div>
  </div>
 </c:forEach>
 </div>
 </div>
</c:if>
<div id="empty-study">
<c:if test='${empty studyIngList}'>
   검색 결과가 존재하지 않습니다.<br><br>
</c:if>
</div>
</div>
</li>

<!-- 종료 스터디 목록 -->
<li id="tab3" class="btnCon"><a class="btn" href="#tab3">종료</a>
      <div class="tabCon" >
      <br>
  <div id="search">
    <form action="search" method='get'>
    <select name="where">
      <option value="1">분야</option>
      <option value="2">제목</option>
      <option value="3">지역</option>
    </select>
    <input type="text" name="keyword">
    <button class="btn btn-outline-dark btn-sm">검색</button>
    </form>
  </div>
  <div id="button" class="d-grid gap-2 d-md-flex justify-content-md-end">
    <button class="btn btn-light">
      <a href='form'>글쓰기</a>
    </button>
  </div>
  <br>
<c:if test='${not empty studyEndList}'>
  <div id="content">
  <div class="row row-cols-1 row-cols-md-2 g-5">
  <c:forEach items="${studyEndList}" var="study">
  <div class="col">
  <div class="card">
    <div class="card-header">
      ${study.subjectName}
    </div>
    <div class="card-body">
      <h5 class="card-title" style="font-weight: bold">
        <a href='detail?studyno=${study.studyNo}'>${study.studyTitle}</a>
      </h5>
      <p class="card-text">${study.introduction}</p>
      ${study.faceName}<br>
      인원 ${study.countMember}/${study.numberOfPeple}<br>
      ${study.owner.perNickname}
      ⭐${study.countBookMember}
    </div>
  </div>
  </div>
 </c:forEach>
 </div>
 </div>
</c:if>
<div id="empty-study">
<c:if test='${empty studyEndList}'>
   검색 결과가 존재하지 않습니다.<br><br>
</c:if>
</div>
</div>
</li>
</ul>
</div>
<script>
location.href = "#tab1";
</script>
</body>
</html>
	<!-- <table class="table table-hover">
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
			</thead> -->
			<!-- [GR] Search Ver.2 -->
			<!-- request.setCharacterEncoding("utf-8");
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			Class.forName("com.mysql.jdbc.Driver");
			String sk = request.getParameter("sk");
			String sv = request.getParameter("sv");

			try {
			  String jdbcDriver =
			  "jdbc:mysql://localhost:3306/doublesdb?" + "useUnicode=true&characterEncoding=euckr";
			  String dbUser = "doublesid";
			  String dbpass = "doublespw";
			  conn = DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
			  if (sk == null & sv == null) {
			    pstmt = conn.prepareStatement("select * from study");
			  } else if (sk != null & sv.equals("")) {
			    pstmt = conn.prepareStatement("select * from study");
			  } else if (sk != null & sv != null) {
			    pstmt = conn.prepareStatement("select * from study where " + sk + "=?");
			    pstmt.setString(1, sv);
			  }
			  rs = pstmt.executeQuery();
			  while (rs.next()) {
			
			<tr>
				<td>=rs.getString("area")%></td>
				<td>=rs.getString("subjectName")</td>
				<td>=rs.getString("studyTitle")</td>
			</tr>
			
			}
			} catch (SQLException ex) {
			ex.printStackTrace();

			} finally {
			if (rs != null)
			try {
			  rs.close();
			} catch (SQLException ex) {
			}
			if (pstmt != null)
			try {
			  pstmt.close();
			} catch (SQLException ex) {
			}

			if (conn != null)
			try {
			  conn.close();
			} catch (SQLException ex) {
			}
			} -->

			<!-- [GR] Search Ver.3 -->
			<!-- @ include file="/study/StudySearch.jsp"%>
			
			request.setCharacterEncoding("utf-8");
			String sk = request.getParameter("sk");
			String sv = request.getParameter("sv");

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			Class.forName("org.mariadb.jdbc.Driver");

			String jdbcDriver = "jdbc:mariadb://localhost:8080/jdbc.url";
			String dbUser = "ogong";
			String dbPass = "1111";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

			if (sk == null & sv == null) {
			  pstmt = conn.prepareStatement("select * from study");
			} else if (sk != null & sv.equals("")) {
			  pstmt = conn.prepareStatement("select * from study");
			} else if (sk != null & sv != null) {
			  if (sk.equals("area")) {
			    pstmt = conn.prepareStatement("select * from study where area=?");
			    pstmt.setString(1, sv);
			  } else if (sk.equals("name")) {
			    pstmt = conn.prepareStatement("select * from study_subject where name=?");
			    pstmt.setString(1, sv);
			  } else if (sk.equals("name")) {
			    pstmt = conn.prepareStatement("select * from study where name=?");
			    pstmt.setString(1, sv);
			  }
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
			%> -->
		<!-- <tbody>
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
		</tbody> -->
		<!-- }
		rs.close();
		pstmt.close();
		conn.close();
		%>  -->
	<!-- </table> -->
