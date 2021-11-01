<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 프로필</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
</style>
</head>
<body>
<fieldset>
<br>
<legend><b> 🙂 마이페이지 </b></legend><br>
<hr>
<table class="table table-responsive">

<div class="card">
  <div class="card-header">
      <img src="https://lh3.googleusercontent.com/ogw/ADea4I5r4FiJPO5QcSWwbxnVlYE-NDM7GrABSzLctf_I=s83-c-mo" alt="Profile Image" class="profile-img">
  </div>
<p><input id='f-nickName' type='nickName' name='nickName' placeholder='${adminpro.masterNickname} 👑' size='20' readonly></p>
<br>
<p><input id='f-email' type='email' name='email' placeholder='${adminpro.masterEmail}' size='20' readonly></p>
<br>
<br>
</table>  
</fieldset>
<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="transform: translate(-45%, 30%);">
<button type="submit" class="btn btn-outline-dark" value="변경" ><a href='updateForm?no=${adminpro.masterNo}'>변경</a></button> 
<button type="submit" class="btn btn-outline-dark" value="로그아웃" ><a href='logout'>로그아웃</a></button> 
</div>
</form>
</body>
</html>