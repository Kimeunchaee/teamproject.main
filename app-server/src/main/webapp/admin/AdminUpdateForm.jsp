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
  }
  p {
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
</style>
</head>
<body>
<fieldset>
<br>
<legend><b> 🙂 마이페이지 수정 </b></legend><br>
<hr>
<table class="table table-responsive">
<td><form action='update'></td>
<br>
<p><label for='f-nickName' class='form-label' size='100px'>닉네임</label>
<input id='f-nickName' type='nickName' name='nickName' placeholder='닉네임' size='20'></p>
<p><label for='f-email' class='form-label' size='100px'>이메일</label>
<input id='f-email' type='email' name='email' placeholder='아이디' size='20'></p>
<p><label for='f-password' class='form-label' size='100px'>비밀번호</label>
<input id='f-password' type='password' name='password' placeholder='비밀번호' size='20'></p>
<br>
</table>
</fieldset>
<input type='hidden' name='no' value='${admin.masterNo}'>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
<button type="submit" class="btn btn-outline-dark" value="변경" >변경</button> 
</div>
</form>
</body>
</html>