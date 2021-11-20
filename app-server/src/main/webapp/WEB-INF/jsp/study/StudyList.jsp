<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!-- @ page import="java.sql.DriverManager"%>
@ page import="java.sql.Connection"%>
@ page import="java.sql.PreparedStatement"%>
@ page import="java.sql.ResultSet"%>
@ page import="java.sql.SQLException"%> -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<style>
.inner-page {
	height: 230vmin;
}

* {
	margin: 0;
	padding: 0;
	font-size: 14px;
	line-height: 1.5;
}

ul {
	list-style: none;
}

.tabmenu {
	max-width: 1000px;
	margin: 0 auto;
	position: relative;
	margin-top: 50px;
}

.tabmenu ul li {
	display: inline-block;
	width: 33.33%;
	float: left;
}

.tabmenu ul li a {
	display: block;
	line-height: 40px;
	text-decoration: none;
}

.tabCon {
	display: none;
	padding: 20px 0px;
	position: absolute;
	left: 0;
	top: 40px;
	box-sizing: border-box;
	width: 1000px;
}

.btnCon:target {
	background: rgb(247, 231, 215);
	xfont-weight: bold;
}

.btnCon:target .tabCon {
	display: block;
}

.card-body {
	flex: 1 1 auto;
	padding: 1rem 1rem;
	height: 185px;
}

#search {
	text-align: center;
}

#content {
	max-height: 1350px;
	overflow-y: scroll;
	overflow-x: hidden;
}

#empty-study {
	text-align: center;
}

.mb-3 select {
	height: 33.5px;
	width: 470px;
	xwidth: 100px;
}
</style>
</head>

<!-- 기존 tab ver -->
<!-- <h3><a href="list?perno=${perno}">📖 스터디 목록</a></h3><br> -->
<!-- <div class="row" style="background-color: yellow">
  <div class="col-md-4"><a href='list?perno=${perno}'>전체</a></div>
  <div class="col-md-4"><a href='list/ing?perno=${perno}'>진행</a></div>
  <div class="col-md-4"><a href='list/end?perno=${perno}'>완료</a></div>
  </div> -->
<!-- <button>
		<a href='list?perno=${perno}'>전체</a>
	</button>
	<button>
		<a href='list/ing?perno=${perno}'>진행</a>
	</button>
	<button>
		<a href='list/end?perno=${perno}'>완료</a>
	</button>
	<br>
	
	<!-- [GR] Search Ver.2 -->
<!-- <div class="input-group mb-3">
		<select name="sk">
			<option value="area">지역</option>
			<option value="subjectName">분야</option>
			<option value="studyTitle">스터디명</option>
		</select> <input type="text" name="sv" class="form-control"
			placeholder="지역 / 분야 / 스터디명으로 검색할 수 있습니다."
			aria-label="Recipient's username" aria-describedby="button-addon2">
		<input type="submit" value="검색" class="btn btn-outline-secondary"
			id="button-addon2">
	</div>  -->

<body>
	<div class="tabmenu">
		<ul>
			<!--===== 전체 스터디 목록 =====-->
			<li id="tab1" class="btnCon"><a class="btn first" href="#tab1">전체</a>
				<div class="tabCon">
					<br>

					<!-- 검색 -->
					<div id="search">
						<form action="search" method='get'>
							<select name="where">
								<option value="1">분야</option>
								<option value="2">제목</option>
								<option value="3">지역</option>
							</select> <input type="text" name="keyword">
							<button class="btn btn-outline-dark btn-sm">검색</button>
						</form>
					</div>

					<!-- 회원 -->
					<c:if test="${loginUser ne null}">
						<!-- 기존 스터디 등록 -->
						<!-- <div id="button"
							class="d-grid gap-2 d-md-flex justify-content-md-end">
							<a href='form' class="btn btn-light">글쓰기</a>
						</div> -->

						<!-- 스터디 등록 -->
						<button type="button" class="btn btn-light" data-bs-toggle="modal"
							data-bs-target="#exampleModal" data-bs-whatever="@mdo">글쓰기</button>

						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- 상단 헤더 -->
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">스터디 등록</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>

									<div class="modal-body">
										<form action='add' method='post'>
											<!-- 제목 -->
											<div class="mb-3">
												<label for='f-studyTitle'>제목</label> <input
													id='f-studyTitle' type='text' name='studyTitle'
													class="form-control" required
													oninvalid="this.setCustomValidity('제목을 입력하세요.')"
													oninput="this.setCustomValidity('')">
											</div>

											<!-- 분야 -->
											<div class="mb-3">
												<label for='f-subjectNo'>분야</label> <select name="subjectNo">
													<option value="1" name="subjectNo" selected>어학</option>
													<option value="2" selected>자격증</option>
													<option value="3" selected>취업</option>
													<option value="4" selected>IT</option>
													<option value="5" selected>예체능</option>
													<option value="6" selected>기타</option>
												</select>
											</div>



											<!-- <input type="text" id="sample6_postcode" placeholder="우편번호">
											<input type="button" onclick="sample6_execDaumPostcode()"
												value="우편번호 찾기"><br> <input type="text"
												id="sample6_address" placeholder="주소"><br> <input
												type="text" id="sample6_detailAddress" placeholder="상세주소">
											<input type="text" id="sample6_extraAddress"
												placeholder="참고항목">

											<script
												src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
											<script>
												function sample6_execDaumPostcode() {
													new daum.Postcode(
															{
																oncomplete : function(
																		data) {
																	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

																	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
																	// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																	var addr = ''; // 주소 변수
																	var extraAddr = ''; // 참고항목 변수

																	//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
																	if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																		addr = data.roadAddress;
																	} else { // 사용자가 지번 주소를 선택했을 경우(J)
																		addr = data.jibunAddress;
																	}

																	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
																	if (data.userSelectedType === 'R') {
																		// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																		// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																		if (data.bname !== ''
																				&& /[동|로|가]$/g
																						.test(data.bname)) {
																			extraAddr += data.bname;
																		}
																		// 건물명이 있고, 공동주택일 경우 추가한다.
																		if (data.buildingName !== ''
																				&& data.apartment === 'Y') {
																			extraAddr += (extraAddr !== '' ? ', '
																					+ data.buildingName
																					: data.buildingName);
																		}
																		// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																		if (extraAddr !== '') {
																			extraAddr = ' ('
																					+ extraAddr
																					+ ')';
																		}
																		// 조합된 참고항목을 해당 필드에 넣는다.
																		document
																				.getElementById("sample6_extraAddress").value = extraAddr;

																	} else {
																		document
																				.getElementById("sample6_extraAddress").value = '';
																	}

																	// 우편번호와 주소 정보를 해당 필드에 넣는다.
																	document
																			.getElementById('sample6_postcode').value = data.zonecode;
																	document
																			.getElementById("sample6_address").value = addr;
																	// 커서를 상세주소 필드로 이동한다.
																	document
																			.getElementById(
																					"sample6_detailAddress")
																			.focus();
																}
															}).open();
												}
											</script> -->



											<!-- 지역 -->
											<div class="mb-3">
												<label for='f-area'>지역</label> <input id='f-area'
													type='text' name='area' class="form-control" required
													oninvalid="this.setCustomValidity('시 / 도 / 구를 입력하세요.')"
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
												<textarea id='f-introduction' type='text'
													name='introduction' class="form-control" rows="3" required
													oninvalid="this.setCustomValidity('소개글을 입력하세요.')"
													oninput="this.setCustomValidity('')"></textarea>
											</div>

											<!-- 진행 상태 -->
											<div class="mb-3">
												<label for='f-studyStatus'>진행 상태</label> <select
													name="studyStatus">
													<option value="1" name="studyStatus" selected>진행</option>
													<option value="2" disabled>종료</option>
												</select>
											</div>

											<!-- 하단 버튼 -->
											<div class="modal-footer">
												<button type="button" class="btn btn-light"
													data-bs-dismiss="modal">취소</button>
												<button class="btn btn-dark">등록</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<br>

					<c:if test='${not empty studyList}'>
						<div id="content">
							<div class="row row-cols-1 row-cols-md-2 g-5">
								<c:forEach items="${studyList}" var="study">
									<div class="col">
										<div class="card">

											<!-- 스터디 메인 -->
											<div class="card-header">

												<!-- 스터디 모집 상태 -->
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

												${study.subjectName}
											</div>

											<!-- 스터디 부가 정보 -->
											<div class="card-body">
												<h5 class="card-title" style="font-weight: bold">
													<a href='detail?studyno=${study.studyNo}'>${study.studyTitle}</a>
												</h5>
												<p class="card-text">${study.introduction}</p>
												${study.faceName}<br> 인원
												${study.countMember}/${study.numberOfPeple}<br>
												${study.owner.perNickname} ⭐${study.countBookMember}
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:if>

					<!-- 검색 결과 -->
					<div id="empty-study">
						<c:if test='${empty studyList}'>
   검색 결과가 존재하지 않습니다.<br>
							<br>
						</c:if>
					</div>
				</div></li>

			<!-- 기존 스터디 목록 ver -->
			<!-- <div id="content">
    <div class="row row-cols-1 row-cols-md-2 g-4">
    <c:forEach items="${studyList}" var="study">
      <div class="col">
        <div class="card">
          <div class="card-body">
            <span style="color:royalblue">${study.subjectName}</span><br>
            <span style="font-weight: bold"><a href='detail?studyno=${study.studyNo}'>${study.studyTitle}</a></span><br>
            ${study.faceName}<br>
            <c:if test="${study.faceName ne '비대면'}">
            ${study.area}<br>
            </c:if>
            인원 ${study.countMember}/${study.numberOfPeple}<br>
            ${study.owner.perNickname}
            🔖${study.countBookMember}
          </div>
        </div>
      </div>
    </c:forEach>
    </div>
  </div> -->

			<!--===== 진행 스터디 목록 =====-->
			<li id="tab2" class="btnCon"><a class="btn" href="#tab2">진행</a>
				<div class="tabCon">
					<br>

					<!-- 검색 -->
					<div id="search">
						<form action="search" method='get'>
							<select name="where">
								<option value="1">분야</option>
								<option value="2">제목</option>
								<option value="3">지역</option>
							</select> <input type="text" name="keyword">
							<button class="btn btn-outline-dark btn-sm">검색</button>
						</form>
					</div>

					<!-- 회원 -->
					<c:if test="${loginUser ne null}">

						<!-- 스터디 등록 -->
						<button type="button" class="btn btn-light" data-bs-toggle="modal"
							data-bs-target="#exampleModal" data-bs-whatever="@mdo">글쓰기</button>

						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- 상단 헤더 -->
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">스터디 등록</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>

									<div class="modal-body">
										<form action='add' method='post'>
											<!-- 제목 -->
											<div class="mb-3">
												<label for='f-studyTitle'>제목</label> <input
													id='f-studyTitle' type='text' name='studyTitle'
													class="form-control" required
													oninvalid="this.setCustomValidity('제목을 입력하세요.')"
													oninput="this.setCustomValidity('')">
											</div>

											<!-- 분야 -->
											<div class="mb-3">
												<label for='f-subjectNo'>분야</label> <select name="subjectNo">
													<option value="1" name="subjectNo" selected>어학</option>
													<option value="2" selected>자격증</option>
													<option value="3" selected>취업</option>
													<option value="4" selected>IT</option>
													<option value="5" selected>예체능</option>
													<option value="6" selected>기타</option>
												</select>
											</div>

											<!-- 지역 -->
											<div class="mb-3">
												<label for='f-area'>지역</label> <input id='f-area'
													type='text' name='area' class="form-control" required
													oninvalid="this.setCustomValidity('지역을 입력하세요.')"
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
												<textarea id='f-introduction' type='text'
													name='introduction' class="form-control" rows="3" required
													oninvalid="this.setCustomValidity('소개글을 입력하세요.')"
													oninput="this.setCustomValidity('')"></textarea>
											</div>

											<!-- 진행 상태 -->
											<div class="mb-3">
												<label for='f-studyStatus'>진행 상태</label> <select
													name="studyStatus">
													<option value="1" name="studyStatus" selected>진행</option>
													<option value="2" disabled>종료</option>
												</select>
											</div>

											<!-- 하단 버튼 -->
											<div class="modal-footer">
												<button type="button" class="btn btn-light"
													data-bs-dismiss="modal">취소</button>
												<button class="btn btn-dark">등록</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<br>

					<c:if test='${not empty studyIngList}'>
						<div id="content">
							<div class="row row-cols-1 row-cols-md-2 g-5">
								<c:forEach items="${studyIngList}" var="study">
									<div class="col">
										<div class="card">

											<!-- 스터디 메인 -->
											<div class="card-header">

												<!-- 스터디 모집 상태 -->
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

												${study.subjectName}
											</div>

											<!-- 스터디 부가 정보 -->
											<div class="card-body">
												<h5 class="card-title" style="font-weight: bold">
													<a href='detail?studyno=${study.studyNo}'>${study.studyTitle}</a>
												</h5>
												<p class="card-text">${study.introduction}</p>
												${study.faceName}<br> 인원
												${study.countMember}/${study.numberOfPeple}<br>
												${study.owner.perNickname} ⭐${study.countBookMember}
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:if>

					<!-- 검색 결과 -->
					<div id="empty-study">
						<c:if test='${empty studyIngList}'>
   검색 결과가 존재하지 않습니다.<br>
							<br>
						</c:if>
					</div>
				</div></li>

			<!--===== 종료 스터디 목록 =====-->
			<li id="tab3" class="btnCon"><a class="btn" href="#tab3">종료</a>
				<div class="tabCon">
					<br>

					<!-- 검색 -->
					<div id="search">
						<form action="search" method='get'>
							<select name="where">
								<option value="1">분야</option>
								<option value="2">제목</option>
								<option value="3">지역</option>
							</select> <input type="text" name="keyword">
							<button class="btn btn-outline-dark btn-sm">검색</button>
						</form>
					</div>

					<!-- 회원 -->
					<c:if test="${loginUser ne null}">

						<!-- 스터디 등록 -->
						<button type="button" class="btn btn-light" data-bs-toggle="modal"
							data-bs-target="#exampleModal" data-bs-whatever="@mdo">글쓰기</button>

						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- 상단 헤더 -->
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">스터디 등록</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>

									<div class="modal-body">
										<form action='add' method='post'>
											<!-- 제목 -->
											<div class="mb-3">
												<label for='f-studyTitle'>제목</label> <input
													id='f-studyTitle' type='text' name='studyTitle'
													class="form-control" required
													oninvalid="this.setCustomValidity('제목을 입력하세요.')"
													oninput="this.setCustomValidity('')">
											</div>

											<!-- 분야 -->
											<div class="mb-3">
												<label for='f-subjectNo'>분야</label> <select name="subjectNo">
													<option value="1" name="subjectNo" selected>어학</option>
													<option value="2" selected>자격증</option>
													<option value="3" selected>취업</option>
													<option value="4" selected>IT</option>
													<option value="5" selected>예체능</option>
													<option value="6" selected>기타</option>
												</select>
											</div>

											<!-- 지역 -->
											<div class="mb-3">
												<label for='f-area'>지역</label> <input id='f-area'
													type='text' name='area' class="form-control" required
													oninvalid="this.setCustomValidity('지역을 입력하세요.')"
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
												<textarea id='f-introduction' type='text'
													name='introduction' class="form-control" rows="3" required
													oninvalid="this.setCustomValidity('소개글을 입력하세요.')"
													oninput="this.setCustomValidity('')"></textarea>
											</div>

											<!-- 진행 상태 -->
											<div class="mb-3">
												<label for='f-studyStatus'>진행 상태</label> <select
													name="studyStatus">
													<option value="1" name="studyStatus" selected>진행</option>
													<option value="2" disabled>종료</option>
												</select>
											</div>

											<!-- 하단 버튼 -->
											<div class="modal-footer">
												<button type="button" class="btn btn-light"
													data-bs-dismiss="modal">취소</button>
												<button class="btn btn-dark">등록</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<br>

					<c:if test='${not empty studyEndList}'>
						<div id="content">
							<div class="row row-cols-1 row-cols-md-2 g-5">
								<c:forEach items="${studyEndList}" var="study">
									<div class="col">
										<div class="card">

											<!-- 스터디 메인 -->
											<div class="card-header">

												<!-- 스터디 모집 상태 -->
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

												${study.subjectName}
											</div>

											<!-- 스터디 부가 정보 -->
											<div class="card-body">
												<h5 class="card-title" style="font-weight: bold">
													<a href='detail?studyno=${study.studyNo}'>${study.studyTitle}</a>
												</h5>
												<p class="card-text">${study.introduction}</p>
												${study.faceName}<br> 인원
												${study.countMember}/${study.numberOfPeple}<br>
												${study.owner.perNickname} ⭐${study.countBookMember}
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:if>

					<!-- 검색 결과 -->
					<div id="empty-study">
						<c:if test='${empty studyEndList}'>
   검색 결과가 존재하지 않습니다.<br>
							<br>
						</c:if>
					</div>
				</div></li>
		</ul>
	</div>

	<script>
		location.href = "#tab1";
	</script>

</body>
</html>

<!-- 테이블 ver 스터디 목록 -->
<!-- <table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>북마크</th>
				<th>제목</th>
				<th>대면/비대면</th>
				<th>조장</th>
				<th>분야</th>
				<th>지역</th>
				<th>인원수</th>
				<th>최대 인원수</th>
			</tr>
			</thead> -->

<!-- [GR] Search Ver.2 -->
<!-- request.setCharacterEncoding("utf-8");
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			Class.forName("com.mysql.jdbc.Driver");
			String sk = request.getParameter("sk");
			String sv = request.getParameter("sv");

			try {
			  String jdbcDriver =
			  "jdbc:mysql://localhost:3306/doublesdb?" + "useUnicode=true&characterEncoding=euckr";
			  String dbUser = "doublesid";
			  String dbpass = "doublespw";
			  conn = DriverManager.getConnection(jdbcDriver, dbUser, dbpass);
			  if (sk == null & sv == null) {
			    pstmt = conn.prepareStatement("select * from study");
			  } else if (sk != null & sv.equals("")) {
			    pstmt = conn.prepareStatement("select * from study");
			  } else if (sk != null & sv != null) {
			    pstmt = conn.prepareStatement("select * from study where " + sk + "=?");
			    pstmt.setString(1, sv);
			  }
			  rs = pstmt.executeQuery();
			  while (rs.next()) {
			
			<tr>
				<td>=rs.getString("area")%></td>
				<td>=rs.getString("subjectName")</td>
				<td>=rs.getString("studyTitle")</td>
			</tr>
			
			}
			} catch (SQLException ex) {
			ex.printStackTrace();

			} finally {
			if (rs != null)
			try {
			  rs.close();
			} catch (SQLException ex) {
			}
			if (pstmt != null)
			try {
			  pstmt.close();
			} catch (SQLException ex) {
			}

			if (conn != null)
			try {
			  conn.close();
			} catch (SQLException ex) {
			}
			} -->

<!-- [GR] Search Ver.3 -->
<!-- @ include file="/study/StudySearch.jsp"%>
			
			request.setCharacterEncoding("utf-8");
			String sk = request.getParameter("sk");
			String sv = request.getParameter("sv");

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			Class.forName("org.mariadb.jdbc.Driver");

			String jdbcDriver = "jdbc:mariadb://localhost:8080/jdbc.url";
			String dbUser = "ogong";
			String dbPass = "1111";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

			if (sk == null & sv == null) {
			  pstmt = conn.prepareStatement("select * from study");
			} else if (sk != null & sv.equals("")) {
			  pstmt = conn.prepareStatement("select * from study");
			} else if (sk != null & sv != null) {
			  if (sk.equals("area")) {
			    pstmt = conn.prepareStatement("select * from study where area=?");
			    pstmt.setString(1, sv);
			  } else if (sk.equals("name")) {
			    pstmt = conn.prepareStatement("select * from study_subject where name=?");
			    pstmt.setString(1, sv);
			  } else if (sk.equals("name")) {
			    pstmt = conn.prepareStatement("select * from study where name=?");
			    pstmt.setString(1, sv);
			  }
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
			%> -->
<!-- <tbody>
			<c:forEach items="${studyList}" var="study">
				<tr>
					<td>${study.studyNo}</td>
					<td>${study.countBookMember}</td>
					<td><a href='detail?studyno=${study.studyNo}&perno=${perno}'>${study.studyTitle}</a></td>
					<td>${study.faceName}</td>
					<td>${study.owner.perNickname}</td>
					<td>${study.subjectName}</td>
					<td>${study.area}</td>
					<td>${study.countMember}</td>
					<td>${study.numberOfPeple}</td>
				</tr>
			</c:forEach>
		</tbody> -->
<!-- }
		rs.close();
		pstmt.close();
		conn.close();
		%>  -->
<!-- </table> -->
