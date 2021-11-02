<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <style>
  h3 {
    text-align: center;
    font-weight: bolder;
  }
  a {
   text-decoration:none;
  }
  #search {
    text-align: center;
  }
  .form-select {
    display: inline-block;
  }
  #content {
    margin-left: 20px;
    width: 47%;
    xborder: 1px solid black;
    float: left;
  }
  .col {
    width: 355px;
  }
  .card {
    height: 350px;
  }
  </style>
</head>
<body>
<br>
<h3><a href="list?perNo=${perNo}"> 🏘 스터디카페 목록 </a></h3><br>
	<div id="search">
  	<form action="search">
  	<select name="where">
		  <option value="1">지역</option>
		  <option value="2">이름</option>
		</select>
  	<input type="text" name="keyword">
  	<button class="btn btn-outline-dark"><a>검색</a></button>
  	</form>
	</div>
  <br>
<c:if test='${not empty cafeList}'>
	<div id="content">
		<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach items="${cafeList}" var="cafe">
		  <div class="col">
		    <div class="card">
		      <svg class="bd-placeholder-img rounded" width="330" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 200x200" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="45%" y="50%" fill="#dee2e6" dy=".3em">이미지</text></svg>
		      <div class="card-body">
		        <a href='detail?no=${cafe.no}&perNo=${perNo}'>${cafe.name}</a><br>
		        ${cafe.location}<br>
		        영업시간 ${cafe.openTime} ~ ${cafe.closeTime}<br>
		        ⭐${cafe.avgReview}(${cafe.countReview})
		      </div>
		    </div>
		  </div>
		</c:forEach>
		</div>
	</div>
</c:if>
<c:if test='${empty cafeList}'>
   검색 결과가 존재하지 않습니다.<br><br>  
</c:if>

  <div id="map" style="width:755px;height:660px;"></div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요"></script>
  <script>
    var container = document.getElementById('map');
    var options = {
      center: new kakao.maps.LatLng(33.450701, 126.570667),
      level: 3
    };

    var map = new kakao.maps.Map(container, options);
  </script>
</body>
</html>

<!--
<table class="table table-striped text-center">
<thead>
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>주소</th>
    <th>운영시간</th>
    <th>조회수</th>
    <th>리뷰</th>
  </tr>
</thead>
<tbody>

<c:forEach items="${cafeList}" var="cafe">
<tr>
    <td>${cafe.no}</td>
    <td><a href='detail?no=${cafe.no}'>${cafe.name}</a></td> 
    <td>${cafe.location}</td> 
    <td>${cafe.openTime} ~ ${cafe.closeTime}</td>
    <td>${cafe.viewCount}</td>
    <td>⭐${cafe.avgReview}(${cafe.countReview})</td>
</tr>
</c:forEach>

</tbody>
</table>


      for(Cafe cafe : cafeList) {
        out.printf("<tr> "
            + " <td>%d</td>"
            + " <td><a href='detail?no=%1$d'>%s</a></td>"
            + " <td>%s</td>"
            + " <td>%s ~ %s</td>"
            + " <td>%d</td>"
            + " <td>★%.1f(%d)</td>"
            + "</tr>", 
            cafe.getNo(), 
            cafe.getName(), 
            cafe.getLocation(), 
            cafe.getOpenTime(),
            cafe.getCloseTime(),
            cafe.getViewCount(),
            cafe.getAvgReview(),
            cafe.getCountReview());
        if (cafe.getCafeStatus() == Cafe.STOP) {
          out.println(" * 운영 중단");
        }
      }

 -->