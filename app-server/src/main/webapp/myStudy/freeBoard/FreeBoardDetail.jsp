<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>상세 | 자유 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>
label {
  margin-right: 5px;
  text-align: right;
  display: inline-block;
  width: 60px;
}
</style>
</head>
<body>
<jsp:include page="../../header.jsp"/>
  <h1>🪧 자유 게시판 상세</h1>
  <form >
    <span>번호ㅣ</span> <span>${freeBoard.freeBoardNo}</span><br>
    <span>제목ㅣ</span> <span>${freeBoard.freeBoardTitle}</span><br>
    <span>작성자ㅣ</span> <span>${freeBoard.freeBoardWriter.perNickname}</span><br>
    <span>내용ㅣ</span> <span>${freeBoard.freeBoardContent}</span><br>
    <span>작성일ㅣ</span> <span>${freeBoard.freeBoardRegisteredDate}</span><br>
    <span>조회수ㅣ</span> <span>${freeBoard.freeBoardViewcount}</span><br>
    <div class="input-group mb-3">
    <span>댓글</span><br>
    <form action='add'>
    <input type='hidden' name='loginUser' value='${loginUser.perNo}'>
	  <input type='hidden' name='freeboardno' value='${freeBoard.freeBoardNo}'>
	  <input type="text" class="form-control" placeholder="내용을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
	  <button class="btn btn-outline-secondary" type="submit" id="button-addon2"><a href='../comment/add?studyno=${freeBoard.studyNo}'>등록</a></button>
    </form>
	  </div>
    <button>
      <a href='freeboardlist?studyno=${freeBoard.studyNo}&perNo=${loginUser.perNo}'>목록</a>
    </button>
    <button>
      <a href='freeboardupdateform?studyno=${freeBoard.studyNo}&freeNo=${freeBoard.freeBoardNo}&perNo=${loginUser.perNo}'>수정</a>
    </button>
    <button>
      <a href='freeboarddelete?studyno=${freeBoard.studyNo}&freeNo=${freeBoard.freeBoardNo}&perNo=${loginUser.perNo}'>삭제</a>
    </button>
 </form>
</body>
</html>
