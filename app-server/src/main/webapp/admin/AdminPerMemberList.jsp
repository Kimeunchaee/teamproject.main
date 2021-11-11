<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 개인 회원 목록</title>
<style>
  label {
    margin-right: 5px;
    text-align: center;
    display: inline;
  }
  legend {
  text-align: center;
  }
  legend:hover {
    color: lightgrey;
  }
  button[type=button] {
    margin-block: 10px;
    border-radius: 10px;
    background-color: beige;
    color: black;
  }
  button[type=button]:hover {
    background-color: blanchedalmond;
    color: black;
  }
  .btn-secondary:focus {
  background-color: beige;
  color: black;
  }
  button[type=button1] {
    margin-left: 15px;
    border-radius: 10px;
    border-color: lightgray;
    background-color: beige;
    color: black;
  }
  button[type=button1]:hover {
    background-color: blanchedalmond;
    color: black;
  }
  .dropdown-menu {
  background-color: rgba(211, 211, 211, 0);
  border: rgba(211, 211, 211, 0);
  }
  .btn-group {
  margin-top: 10px;
  display: block;
  }
  .offcanvas-start {
  width: 350px;
  }
  button[type=button2] {
  margin-left: 70px;
    color: black;
  }
  button[type=button2]:hover {
    color: black;
  }
  div {
  margin-right: 10px;
  }
</style>
</head>
<body>
<br>
  <fieldset>
<legend data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample"><b> 📗 개인 회원 목록 </b></legend><br>
<hr>
    <table class="table">

        <thead>
          <tr>
            <th>번호</th>
            <th>이름</th>
            <th>닉네임</th>
            <th>이메일</th>
            <th>가입일</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${perMemberList}" var="perMember">
             <tr>
              <td>${perMember.perNo}</td>
              <td><a href='permemberdetail?no=${perMember.perNo}'>${perMember.perName}</a></td> 
              <td>${perMember.perNickname}</td> 
              <td>${perMember.perEmail}</td> 
              <td>${perMember.perRegisteredDate}</td>
             </tr>
         </c:forEach>
        </tbody>
  </table>
  </fieldset>
  </body>
  
  <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h4 class="offcanvas-title" id="offcanvasExampleLabel">👑 관리자 👑</h4>
    <button type="button2" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    <hr>
  </div>
  
  <div class="offcanvas-body">
    <div>
      <b>이동하고 싶은 탭을 선택해 주세요!</b>
    </div>

    <div class="btn-group dropend">
      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        👑 관리자 페이지
      </button>
      <div class="dropdown-menu" role="menu" style="border-color: white;">
        <button class="dromdown-item" type="button1">
          <a href='logout' style="color: black;">🖐 로그아웃</a></button><br>
        <%-- <button class="dromdown-item" type="button1">
          <a href='detail?no=${admin.masterNo}' style="color: black;">🙂 마이페이지</a></button> --%>
      </div>
    </div>
    
    <div class="btn-group dropend">
      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        📁 회원 관리
      </button>
      <div class="dropdown-menu" role="menu" style="border-color: white;">
        <button class="dromdown-item" type="button1">
          <a href="/ogong/admin/permemberlist" style="color: black;">🎓 개인 회원</a></button><br>
        <button class="dromdown-item" type="button1">
          <a href="/ogong/admin/ceomember/list" style="color: black;">👔 기업 회원</a></button>
      </div>
    </div>
      
    <div class="btn-group dropend">
      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        📖 스터디 관리
      </button>
      <div class="dropdown-menu" role="menu" style="border-color: white;">
        <button class="dromdown-item" type="button1">
          <a href="study/list" style="color: black;">📚 스터디 목록</a></button><br>
        <!-- <button class="dromdown-item" type="button1">
          <a href="/study/list" style="color: black;">📔 스터디 삭제</a></button> -->
      </div>
    </div>
    
    <div class="btn-group dropend">
      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        🏘 장소 관리
      </button>
      <div class="dropdown-menu" role="menu" style="border-color: white;">
        <button class="dromdown-item" type="button1">
          <a href="/ogong/admin/cafeList" style="color: black;">📝 장소 목록</a></button><br>
        <button class="dromdown-item" type="button1">
          <a href="/ogong/admin/reviewList" style="color: black;">🔖 장소 리뷰</a></button>
      </div>
    </div>
    
    <div class="btn-group dropend">
      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        💌 고객센터 관리
      </button>
      <div class="dropdown-menu" role="menu" style="border-color: white;">
        <button class="dromdown-item" type="button1">
          <a href="/ogong/adminNotice/list" style="color: black;">📢 공지사항</a></button><br>
        <button class="dromdown-item" type="button1">
          <a href="/ogong/admin/askboardlist" style="color: black;">💬 문의사항</a></button>
      </div>
    </div>
      
  </div>

</html>




