<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sticky-footer/">

    <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

<!-- <script type="text/javascript">
  function checkValue() {

  var form = document.studyInfo;
  var studyStatus = ${study.studyStatus};
  
  console.log(studyStatus);
  
  if (studyStatus == 2) {
    alert("완료된 스터디 입니다.");
    return false;
  }
  
  for (Member guilder : form.members.value) {
     if (form.guilder.perNo.value == form.loginUser.perNo.value) {
       alert("이미 참여 중인 스터디입니다.");
       return false;
     }
   }

    for (Member memberWating : form.waitingMember.value) {
      if (form.memberWating.perNo.value == form.loginUser.perNo.value) {
        alert("이미 승인 대기 중인 스터디입니다.");
        return false;
      }
    }
  
  if (form.countMember.value == form.numberOfPeple.value) {
      alert("참여 가능 인원수를 초과하였습니다.");
      return false;
  }
}
</script> -->

<!-- <input name="members" type="text" value="${study.members}"/>
<input name="waitingMember" type="text" value="${study.waitingMember}"/>
<input name="studyStatus" type="text" value="${study.studyStatus}"/>
<input name="countMember" type="text" value="${study.countMember}"/>
<input name="numberOfPeple" type="text" value="${study.numberOfPeple}"/> -->

    <!-- Custom styles for this template -->
    <!-- <link href="sticky-footer.css" rel="stylesheet"> -->
  </head>
  <body class="d-flex flex-column h-100">

<!-- Begin page content -->
<main class="flex-shrink-0">
  <div class="container">
  <input type="hidden" name="members" value="${study.members}">
  <input type="hidden" name="waitingMember" value="${study.waitingMember}">
  <input type="hidden" name="studyStatus" value="${study.studyStatus}">
  <input type="hidden" name="countMember" value="${study.countMember}">
  <input type="hidden" name="numberOfPeple" value="${study.numberOfPeple}">
    <h1 class="mt-5">${study.studyTitle}</h1>
    <span>${study.owner.perNickname}</span>
    <td><fmt:formatDate value="${study.registeredDate}" pattern="yyyy.MM.dd" /></td>
    <p class="lead">${study.introduction}</p>
    <c:choose>
        <c:when test="${study.countMember ne study.numberOfPeple && study.studyStatus ne '2'}">
          <button type="button" class="btn btn-primary btn-sm">모집중</button>
        </c:when>
        <c:when test="${study.countMember eq study.numberOfPeple && study.studyStatus ne '2'}">
          <button type="button" class="btn btn-primary btn-sm">모집중</button>
        </c:when>
        <c:when test="${study.countMember ne study.numberOfPeple && study.studyStatus eq '2'}">
          <button type="button" class="btn btn-secondary btn-sm">모집완료</button>
        </c:when>
        <c:when test="${study.countMember eq study.numberOfPeple && study.studyStatus eq '2'}">
          <button type="button" class="btn btn-secondary btn-sm">모집완료</button>
        </c:when>
      </c:choose>
    <ul class="list-group">
      <li class="list-group-item d-flex justify-content-between align-items-center">
        🔎 분야
        <span class="badge bg-primary rounded-pill">${study.subjectName}</span>
      </li>
      <li class="list-group-item d-flex justify-content-between align-items-center">
        🌐 지역
        <span class="badge bg-primary rounded-pill">${study.area}</span>
      </li>
      <li class="list-group-item d-flex justify-content-between align-items-center">
        🎭 대면 상태
        <span class="badge bg-primary rounded-pill">${study.faceName}</span>
      </li>
      <li class="list-group-item d-flex justify-content-between align-items-center">
        🏆 활동 점수
        <span class="badge bg-primary rounded-pill">${study.point}</span>
      </li>
    </ul>
  </div>
</main><br>

<footer class="footer mt-auto py-3 bg-light">
  <div class="container">
    <div class="btn-group" role="group" aria-label="Basic outlined example">
      <!-- 내가 쓴 글 -->
      <c:if test="${study.owner.perNo eq loginUser.perNo}">
	      <a href='updateform?studyno=${study.studyNo}' class="btn btn-light">수정</a>
	      <a href='delete?studyno=${study.studyNo}' class="btn btn-light">삭제</a>
      </c:if>

      <c:if test="${loginUser ne null}">
        <!-- 스터디 참여 -->
        <c:if test="${study.owner.perNo ne loginUser.perNo}">
          <c:choose>
            <c:when test="${guilder == 'false'}">
              <a href='join?studyno=${study.studyNo}' class="btn btn-light">참여 신청</a>
            </c:when>
            <c:when test="${guilder == 'waitingGuilder'}">
              <p>승인 대기중</p>
            </c:when>
            <c:when test="${guilder == 'guilder'}">
              <p>참여중</p>
            </c:when>
          </c:choose>
        </c:if>
        
        <!-- 북마크 -->
        <c:if test="${myBookmark eq '0'}">
          <a href='${contextPath}/app/bookmark/add?studyno=${study.studyNo}' class="btn btn-light">북마크 추가</a>
        </c:if>
        <c:if test="${myBookmark eq '1'}">
          <a href='${contextPath}/app/bookmark/delete?studyno=${study.studyNo}' class="btn btn-light">북마크 삭제</a>
        </c:if>
      </c:if>
        
      <!-- 목록 -->
      <a href='list' class="btn btn-light">목록</a>
    </div>
  </div>
</footer>

  </body>
</html>
