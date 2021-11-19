<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.1/examples/sticky-footer/">

<!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
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

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.mb-3 select {
	height: 38px;
	width: 466px;
	xwidth: 100px;
}
</style>

<!-- Custom styles for this template -->
</head>
<body class="d-flex flex-column h-100">

	<!-- 스터디 상세 -->
	<main class="flex-shrink-0">
		<div class="container">
			<input type="hidden" name="members" value="${study.members}">
			<input type="hidden" name="waitingMember"
				value="${study.waitingMember}"> <input type="hidden"
				name="studyStatus" value="${study.studyStatus}"> <input
				type="hidden" name="countMember" value="${study.countMember}">
			<input type="hidden" name="numberOfPeple"
				value="${study.numberOfPeple}">

			<!-- 스터디 메인 정보 -->
			<h1 class="mt-5">${study.studyTitle}</h1>
			<span>${study.owner.perNickname}</span>
			<td><fmt:formatDate value="${study.registeredDate}"
					pattern="yyyy-MM-dd" /></td>
			<p class="lead">${study.introduction}</p>

			<!-- 스터디 모집 여부 -->
			<c:choose>
				<c:when
					test="${study.countMember ne study.numberOfPeple && study.studyStatus ne '2'}">
					<button type="button" class="btn btn-primary btn-sm">모집중</button>
				</c:when>
				<c:when
					test="${study.countMember eq study.numberOfPeple && study.studyStatus ne '2'}">
					<button type="button" class="btn btn-primary btn-sm">모집중</button>
				</c:when>
				<c:when
					test="${study.countMember ne study.numberOfPeple && study.studyStatus eq '2'}">
					<button type="button" class="btn btn-secondary btn-sm">모집완료</button>
				</c:when>
				<c:when
					test="${study.countMember eq study.numberOfPeple && study.studyStatus eq '2'}">
					<button type="button" class="btn btn-secondary btn-sm">모집완료</button>
				</c:when>
			</c:choose>

			<!-- 스터디 부가 정보 -->
			<ul class="list-group">
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					🔎 분야 <span class="badge bg-primary rounded-pill">${study.subjectName}</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					🌐 지역 <span class="badge bg-primary rounded-pill">${study.area}</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					🎭 대면 상태 <span class="badge bg-primary rounded-pill">${study.faceName}</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between align-items-center">
					🏆 활동 점수 <span class="badge bg-primary rounded-pill">${study.point}</span>
				</li>
			</ul>
		</div>
	</main>
	<br>

	<footer class="footer mt-auto py-3 bg-light">
		<div class="container">
			<div class="btn-group" role="group"
				aria-label="Basic outlined example">
				<!-- 내가 쓴 글 -->
				<c:if test="${study.owner.perNo eq loginUser.perNo}">

					<!-- 기존 스터디 수정 -->
					<!-- <a href='updateform?studyno=${study.studyNo}' class="btn btn-light">수정</a> -->

					<!-- 스터디 수정 -->
					<button type="button" class="btn btn-light" data-bs-toggle="modal"
						data-bs-target="#exampleModal" data-bs-whatever="@mdo">수정</button>

					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- 상단 헤더 -->
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">스터디 수정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>

								<div class="modal-body">
									<form action='update' method='post'>
										<input type="hidden" name="studyNo" value="${study.studyNo}">

										<!-- 제목 -->
										<div class="mb-3">
											<label for='f-studyTitle'>제목</label> <input id='f-studyTitle'
												type='text' name='studyTitle' class="form-control" required
												oninvalid="this.setCustomValidity('제목을 입력하세요.')"
												oninput="this.setCustomValidity('')">
										</div>

										<!-- 최대 인원수 -->
										<div class="mb-3">
											<label for='f-numberOfPeple'>최대 인원수</label> <select
												name="numberOfPeple">
												<option value="2" name="numberOfPeple" selected>2</option>
												<option value="3" selected>3</option>
												<option value="4" selected>4</option>
												<option value="5" selected>5</option>
												<option value="6" selected>6</option>
												<option value="7" selected>7</option>
												<option value="8" selected>8</option>
												<option value="9" selected>9</option>
												<option value="10" selected>10</option>
												<option value="11" selected>11</option>
												<option value="12" selected>12</option>
												<option value="13" selected>13</option>
												<option value="14" selected>14</option>
												<option value="15" selected>15</option>
												<option value="16" selected>16</option>
												<option value="17" selected>17</option>
												<option value="18" selected>18</option>
												<option value="19" selected>19</option>
												<option value="20" selected>20</option>
												<option value="21" selected>21</option>
												<option value="22" selected>22</option>
												<option value="23" selected>23</option>
												<option value="24" selected>24</option>
												<option value="25" selected>25</option>
												<option value="26" selected>26</option>
												<option value="27" selected>27</option>
												<option value="28" selected>28</option>
												<option value="29" selected>29</option>
												<option value="30" selected>30</option>
											</select>
										</div>

										<!-- 대면 상태 -->
										<div class="mb-3">
											<label for='f-faceNo'>대면 상태</label> <select name="faceNo">
												<option value="1" name="faceNo" selected>대면</option>
												<option value="2" selected>비대면</option>
												<option value="3" selected>대면/비대면</option>
											</select>
										</div>

										<!-- 소개글 -->
										<div class="mb-3">
											<label for='f-introduction'>소개글</label>
											<textarea id='f-introduction' type='text' name='introduction'
												class="form-control" rows="3" required
												oninvalid="this.setCustomValidity('소개글을 입력하세요.')"
												oninput="this.setCustomValidity('')"></textarea>
										</div>

										<!-- 진행 상태 -->
										<div class="mb-3">
											<label for='f-studyStatus'>진행 상태</label> <select
												name="studyStatus">
												<option value="1" name="studyStatus" selected>진행</option>
												<option value="2" selected>종료</option>
											</select>
										</div>

										<!-- 하단 버튼 -->
										<div class="modal-footer">
											<button type="button" class="btn btn-light"
												data-bs-dismiss="modal">취소</button>
											<button class="btn btn-dark">수정</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- 스터디 삭제 -->
					<a href='delete?studyno=${study.studyNo}' class="btn btn-light">삭제</a>
				</c:if>

				<!-- 회원 -->
				<c:if test="${loginUser ne null}">
					<!-- 스터디 참여 -->
					<c:if test="${study.owner.perNo ne loginUser.perNo}">
						<c:choose>
							<c:when test="${guilder == 'false'}">
								<a href='join?studyno=${study.studyNo}' class="btn btn-light">참여
									신청</a>
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
						<a href='${contextPath}/app/bookmark/add?studyno=${study.studyNo}'
							class="btn btn-light">북마크 추가</a>
					</c:if>
					<c:if test="${myBookmark eq '1'}">
						<a
							href='${contextPath}/app/bookmark/delete?studyno=${study.studyNo}'
							class="btn btn-light">북마크 삭제</a>
					</c:if>
				</c:if>

				<!-- 회원 & 비회원 -->
				<!-- 스터디 목록 -->
				<a href='list' class="btn btn-light">목록</a>
			</div>
		</div>
	</footer>

</body>
</html>
