<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>상세 | 내 스터디</title>
<link rel="stylesheet" type="text/css" href="../header.css">
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
	<jsp:include page="../header.jsp" />
	<h1>📖 내 스터디 상세</h1>
	<br>
	<!--  <form action='updateform'> -->
	<input type='hidden' name='subjectNo' value='${study.subjectNo}'>
	<c:choose>
		<c:when test="${study.countMember < study.numberOfPeple}">
    [모집 중]
    </c:when>
		<c:otherwise>
    [모집 완료]
    </c:otherwise>
	</c:choose>
	<br>
	<br>
	<span>번호ㅣ</span>
	<span>${study.studyNo}</span>
	<br>
	<span>북마크ㅣ</span>
	<span>${study.countBookMember}</span>
	<br>
	<span>제목ㅣ</span>
	<span>${study.studyTitle}</span>
	<br>
	<span>조장ㅣ</span>
	<span>${study.owner.perNickname}</span>
	<br>
	<span>분야ㅣ</span>
	<span>${study.subjectName}</span>
	<br>
	<span>지역ㅣ</span>
	<span>${study.area}</span>
	<br>
	<span>인원수ㅣ</span>
	<span>${study.countMember}</span>
	<br>
	<span>최대 인원수ㅣ</span>
	<span>${study.numberOfPeple}</span>
	<br>
	<span>대면 상태ㅣ</span>
	<span>${study.faceName}</span>
	<br>
	<span>소개글ㅣ</span>
	<span>${study.introduction}</span>
	<br>
	<span>활동 점수ㅣ</span>
	<span>${study.point}</span>
	<br>
	<br>
	<hr>
	<br>
	<c:if test='${study.owner.perNo == loginUser.perNo}'>
		<button type="submit" value="수정" formaction="updateform">
			<a
				href='../study/updateform?perno=${member.perNo}&studyno=${study.studyNo}'>수정</a>
		</button>
		<button>
			<a
				href='../study/delete?perno=${member.perNo}&studyno=${study.studyNo}'>삭제</a>
		</button>
	</c:if>
	<button>
		<a href='../study/exit?perno=${member.perNo}&studyno=${study.studyNo}'>탈퇴</a>
	</button>
	<span><a
		href='guilder/list?studyNo=${study.studyNo}'>구성원&emsp;</a></span>
	<span>캘린더&emsp;</span>
	<span>To-do&emsp;</span>
	<span><a
		href="freeboardlist?studyNo=${study.studyNo}&perNo=${member.perNo}">자유게시판&emsp;</a></span>
	<span><a
		href='todo/list?studyno=${study.studyNo}&perno=${member.perNo}'>To-do&emsp;</a></span>
	<span>자유게시판&emsp;</span>
	<span>화상미팅&emsp;</span>
	<button>
		<a href='list'>목록</a>
	</button>
	<br>
	</form>
</body>
</html>
