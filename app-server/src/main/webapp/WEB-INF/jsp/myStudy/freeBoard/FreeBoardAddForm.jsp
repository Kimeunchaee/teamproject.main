<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
  font-size:14px;
}
.all-content {
  width: 100%;
  margin: 0 auto;
	display: flex;
	justify-content: center;
}
#button {
  text-align: center;
}
</style>
<script type="text/javascript">
  function checkValue() {

  var form = document.freeBoardInfo;

  if (!form.freeBoardTitle.value) {
    alert("제목을 입력하세요.");
    return false;
  }

  if (!form.freeBoardContent.value) {
    alert("내용을 입력하세요.");
    return false;
  }

  if (!form.freeBoardFile.value) {
    alert("파일을 선택하세요.");
    return false;
  }
}
</script>
</head>
<body>
<div class="all-content">
  <form action='add' method='post' name='freeBoardInfo' onsubmit="return checkValue()">
	<input type='hidden' name='studyNo' value='${studyno}'>
	<div id='content'>
      <br>
  <div class="mb-3 row">
    <label for='f-freeBoardTitle'>제목</label>
    <input id='f-freeBoardTitle' type='text' name='freeBoardTitle' class="form-control">
  </div>

  <div class="mb-3 row">
    <label for='f-freeBoardContent'>내용</label>
    <textarea id='f-freeBoardContent' type='text' name='freeBoardContent' class="form-control" rows="3"></textarea>
  </div>

  <div class="mb-3 row">
    <label for='f-freeBoardFile'>파일</label>
    <input id='f-freeBoardFile' type='file' name='freeBoardFile' class="form-control">
  </div>

   <%-- <label for='f-freeBoardFile' class='form-label'>파일</label>
   <input id='f-freeBoardFile' type='file' name='freeBoardFile' /><br>
   
   <c:if test="${empty freeBoardFile}">
     <input id='f-freeBoardFile' type='hidden' name='freeBoardFile' value="freeboard_80x80.jpg"/><br>
   </c:if> --%>
  </div>
	<div id='button'>
    <button class="btn btn-dark">등록</button>
  </div>
	</form>
</div>
</body>
</html>
