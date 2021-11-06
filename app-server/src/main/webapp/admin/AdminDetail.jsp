<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 프로필</title>
   <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.css">
   
   <script src="../node_modules/@popperjs/core/dist/umd/popper.js"></script> <!-- 의존하는 것 우선 -->
   <script src="../node_modules/bootstrap/dist/js/bootstrap.js"></script>
<style>
  label {
    margin-left: 10px;
    text-align: center;
    display: inline;
    width: 60px;
  }
  legend {
  text-align: center;
  }
  input {
  border : white;
  outline-color : lightgray;
      margin-left: 10px;
    text-align: center;
    display: inline;
  }
  p {
    margin: 10px;
    text-align-last: center;
  }
  div {
  margin-right: 10px;
  display: flex;
  align-items: center;
  flex-direction: row;
  justify-content: center;
  }
  a {
  color : black;
  text-decoration : blink;
  }
  a:hover {
  color : white;
  }
  .card .card-header {
    padding: 0;
    height: 48px;
  }
  .card .card-header .profile-img {
    width: 130px;
    height: 130px;
    border-radius: 1000px;
    position: absolute;
    left: 50%;
    transform: translate(-50%, -50%);
    border: 4px solid wheat;
    background-color: white;
    box-shadow: 0 0 10px lightyellow;
  }
  .card .card-header .profile-img:hover {
    width: 150px;
    height: 150px;
    transform: translate(-50%, -50%);
    border: 4px solid wheat;
  }
  .card {
    max-width: 400px;
    margin: 150px auto 0;
    background-color: white;
    box-shadow: 0 10px 90px ivory;
    text-align: center;
    font-size: 20px;
    border-radius: 15px;
    border: 2px solid lightgray;
  }
  .c-top {
  width: 100%;
  padding: 20px 0 20px 0px;
  text-align: center;
  font-weight: bold;
  background-color: rgb(247, 231, 215);
}
  .c-top:hover {
    color: cornflowerblue;
  }
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<fieldset>
<section>
<div class="c-top" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
      🙂 마이페이지
      </div>
<table class="table table-responsive">

<div class="card">
  <div class="card-header">
      <img src="/ogong/img/logoface.png" alt="Profile Image" class="profile-img">
  </div>
<p><input id='f-nickName' type='nickName' name='nickName' placeholder='${loginAdmin.masterNickname} 👑' size='20' readonly></p>
<br>
<p><input id='f-email' type='email' name='email' placeholder='${loginAdmin.masterEmail}' size='20' readonly></p>
<br>
<br>
</table>  
</fieldset>
<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="transform: translate(-45%, 30%);">
<button type="submit" class="btn btn-outline-dark" value="변경" ><a href='updateForm'>변경</a></button> 
<button type="submit" class="btn btn-outline-dark" value="로그아웃" ><a href='logout'>로그아웃</a></button> 
</div>

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
        <button class="dromdown-item" type="button1">
          <a href='/ogong/admin/detail' style="color: black;">🙂 마이페이지</a></button>
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
</form>
</section>
</body>
</html>