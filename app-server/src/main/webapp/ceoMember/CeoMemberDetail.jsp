<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
</style>
</head>

<body>
  <jsp:include page="../header.jsp"/>
   <b> 📖 기업회원 상세</b>
   <hr>
   <form action='updateform'>
	   <span>(${loginCeoUser.ceoNo})</span><br>
	   <span>이름ㅣ</span> <span>${loginCeoUser.ceoName}</span><br>
	   <span>닉네임ㅣ</span> <span>${loginCeoUser.ceoNickname}</span><br>
	   <span>이메일ㅣ</span> <span>${loginCeoUser.ceoEmail}</span><br>
	   <span>사진ㅣ</span> <img src="..." alt="#" class="img-circle"><br>
	   <span>전화번호ㅣ</span> <span>${loginCeoUser.ceoTel}</span><br>
	   <span>대표자명ㅣ</span> <span>${loginCeoUser.ceoBossName}</span><br>
	   <span>사업자 번호ㅣ</span> <span>${loginCeoUser.ceoLicenseNo}</span><br>
	   <span>가입일ㅣ</span> <span>${loginCeoUser.ceoRegisteredDate}</span><br>
	   <button type="submit" value="수정" formaction="updateform">
	      <a href='updateform'>프로필 수정하기</a>
	   </button>
	   <button type="submit" value="삭제" formaction="delete">
	      <a href='deleteform'>탈퇴하기</a>
	    </button>
    </form>
</body>
</html>