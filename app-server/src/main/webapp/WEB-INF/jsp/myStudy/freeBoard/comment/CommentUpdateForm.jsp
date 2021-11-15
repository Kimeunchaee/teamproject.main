<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
  font-size:14px;
}
label {
  margin-right: 5px;
  text-align: center;
  display: inline;
  width: 60px;
}

legend {
  text-align: center;
}

input {
  border: white;
  outline-color: lightgray;
}
</style>
</head>
<body>
  <fieldset>
    <br>
    <legend>
      <b>🪧 댓글 수정</b>
    </legend>
    <table class="table table-responsive">
      <form action='update' method='post'>
        <input type='hidden' name='studyno' value='${comment.studyNo}'>
        <input type='hidden' name='freeboardno' value='${comment.freeBoardNo}'>
        <input type='hidden' name='commentno' value='${comment.commentNo}'>
        <input id='f-commentText' type="text" name='commenttext' class="form-control"
              placeholder="내용을 입력하세요." aria-describedby="button-addon2"/>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <button class="btn btn-outline-dark">수정</button>
  </div>
    </form>
    </table>
  </fieldset>
</body>
</html>
