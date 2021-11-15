<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Custom styles for this template -->
    <!-- <link href="sticky-footer.css" rel="stylesheet"> -->
  </head>
  <body class="d-flex flex-column h-100">
    
<!-- Begin page content -->
<main class="flex-shrink-0">
  <div class="container" name="studyInfo">
  <input type="hidden" name="members" value="${study.members}">
  <input type="hidden" name="watingMember" value="${study.watingMember}">
  <input type="hidden" name="studyStatus" value="${study.studyStatus}">
  <input type="hidden" name="countMember" value="${study.countMember}">
  <input type="hidden" name="numberOfPeple" value="${study.numberOfPeple}">
    <h1 class="mt-5">${study.studyTitle}</h1>
    <span>${study.owner.perNickname}</span>
    <td><fmt:formatDate value="${study.registeredDate}" pattern="yyyy.MM.dd" /></td>
    <p class="lead">${study.introduction}</p>
    <c:choose>
    <c:when test="${study.countMember ne study.numberOfPeple}">[모집중]</c:when>
    <c:otherwise>[모집 완료]</c:otherwise>
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
	    <button class="btn btn-outline-light">
			<a href='../study/delete?studyno=${study.studyNo}'>삭제</a>
		</button>
		<button class="btn btn-outline-light">
			<a href='../study/list'>목록</a>
	    </button>
		</div>
  </div>
</footer>

  </body>
</html>
