<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<style>
.layerPopup img{
margin-bottom : 20px;
}
.layerPopup:before {
display:block;
content:"";
position:fixed;
left:0;
top:0;
width:100%;
height:100%;
background:rgba(0,0,0,.5);
z-index:9000
}
.layerPopup .layerBox {
z-index:10000;
position:fixed;
left:50%;
top:48%;
width: 800px;
height: 300px;
transform:translate(-50%, -50%);
padding:30px;
background:rgb(255 248 241);
border-radius:6px;
display: flex;
flex-direction: row;
}
.layerPopup .layerBox .title {
margin-bottom:10px;
padding-bottom:10px;
font-weight:600;
text-align: center;
border-bottom:1px solid #d9d9d9;
}
.layerPopup .layerBox .btnTodayHide {
font-size:14px;
font-weight:600;
color:black; 
float: left;
text-decoration:none;
width: 150px;
height : 30px;
line-height:30px;
border:black solid 1px;
text-align : center;
text-decoration:none;
}
.layerPopup .layerBox .leftbox {
  background-color: rgb(255 248 241);
  width: 70%;
  display: flex;
  flex-direction: column;
}
.leftbox .lefttop {
  position: absolute;
  width: 515px;
  height: 240px;
  z-index: 99999;
  top: -45px;
  background-color: rgb(255 248 241);
  border-radius: 10px;
  box-shadow: 10px 10px 10px 0px rgba(0, 0, 0, 0.418);
}
.leftbox .tempbox {
  margin-top: 30%;
  height: 35%;
  text-align: right;
  background-color: rgb(255 248 241);
  padding: 40px 20px 0 20px;
}
.leftbox .leftbottom {
  bottom: 0;
  width: 100%;
  height: 10%;
  background-color: rgb(255 248 241);
  color: rgb(123 111 109);
}
.layerPopup .layerBox .rightbox {
  background-color: rgb(255 248 241);
  width: 35%;
  display: flex;
  flex-direction: column;
}
.rightbox .righttop {
  position: absolute;
  width: 241px;
  height: 20%;
  z-index: 33333;
  background-color: rgb(255 248 241);
  padding: 0 10px;
}
.rightbox .rightmiddle {
  margin-top: 28%;
  margin-left: 10px;
  width: 100%;
  height: 80%;
  z-index: 55555;
  border-top: 1px solid;
  border-top-color: rgb(159 146 143);
  background-color: rgb(255 248 241);
  padding: 0 20px;
  text-align: center;
  -webkit-text-stroke: thin;
}
.rightbox .rightbottom {
  bottom: 0;
  width: 100%;
  height: 3%;
  z-index: 99999;
  background-color: rgb(255 248 241);
}
.layerPopup div{
display : inline;
}
.layerPopup form{
font-size:14px;
font-weight:500;
line-height:30px
}
.layerPopup #close {
font-size:16px;
font-weight:600;
width: 40px;
height : 30px;
color:black;
float: right;
line-height:30px;
text-align : center;
text-decoration:underline;
color: rgb(123 111 109);
}
.layerPopup a{
text-decoration : none;
color : rgb(163 150 148);
width: 50px;
height : 40px;
}
input[type=checkbox]:checked {
  background-color: black;
}
img#logo {
  width: 250px;
  margin-bottom: 0;
}
svg#icon {
  width: 40px;
  height: 30px;
  border: 3px solid;
  border-radius: 5px;
  border-inline: none;
  color: rgb(159 146 143);
}
</style>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Today Study - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${contextPath}/css/assets/img/favicon.png" rel="icon">
  <link href="${contextPath}/css/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${contextPath}/css/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="${contextPath}/css/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/css/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${contextPath}/css/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${contextPath}/css/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link rel="stylesheet" href="${contextPath}/css/assets/css/style.css">
  <!-- =======================================================
  * Template Name: Rapid - v4.6.0
  * Template URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">Today Study</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="${contextPath}/css/assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">스터디 찾기</a></li>
          <li><a class="nav-link scrollto" href="#services">장소 찾기</a></li>
          <li><a class="nav-link scrollto" href="#services">내 스터디</a></li>
          <li class="dropdown"><a href="#"><span>고객센터</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">공지사항</a></li>
              <li><a href="#">문의게시판</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#footer">회원가입</a></li>
          <li><a class="nav-link scrollto" href="#footer">로그인</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <div class="social-links">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
      </div>

    </div>
  </header><!-- End Header -->

    <!-- 메인 팝업 -->
    <jsp:include page="mainPopup2.jsp"/>

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="clearfix">
    <div class="container d-flex h-100">
      <div class="row justify-content-center align-self-center" data-aos="fade-up">
        <div class="col-lg-6 intro-info order-lg-first order-last" data-aos="zoom-in" data-aos-delay="100">
          <h2>Todat Study<br>for Your <span>Life!</span></h2>
          <div>
            <a href="#about" class="btn-get-started scrollto">Get Started</a>
          </div>
        </div>

        <div class="col-lg-6 intro-img order-lg-last order-first" data-aos="zoom-out" data-aos-delay="200">
          <img src="${contextPath}/css/assets/img/intro-img.svg" alt="" class="img-fluid">
        </div>
      </div>

    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">

      <div class="container" data-aos="fade-up">
        <div class="row">

          <div class="col-lg-5 col-md-6">
            <div class="about-img" data-aos="fade-right" data-aos-delay="100">
              <img src="${contextPath}/img/main_2.jpg" alt="" id="main_2">
            </div>
          </div>

          <div class="col-lg-7 col-md-6">
            <div class="about-content" data-aos="fade-left" data-aos-delay="100">
              <h2>About</h2>
              <h3>Welcom to '오늘의 공부'</h3>
              <p>오늘의 공부에서 원하는 모임과 스터디를 개설하고
                새로운 사람들을 만나고, 모임 장소까지 한번에 예약할 수 있습니다.
              </p>
              <ul>
                <li><i class="bi bi-check-circle"></i> 새로운 스터디 개설하기!</li>
                <li><i class="bi bi-check-circle"></i> 스터디 카페 예약까지 한번에!</li>
                <li><i class="bi bi-check-circle"></i> 나만의 스터디를 효율적으로 관리!</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

    </section><!-- End About Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h3>Services</h3>
          <p>Laudem latine persequeris id sed, ex fabulas delectus quo. No vel partiendo abhorreant vituperatoribus.</p>
        </header>

        <div class="row">

          <div class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <div class="icon" style="background: #fceef3;"><i class="bi bi-briefcase" style="color: #ff689b;"></i></div>
              <h4 class="title"><a href="">Lorem Ipsum</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="box">
              <div class="icon" style="background: #fff0da;"><i class="bi bi-card-checklist" style="color: #e98e06;"></i></div>
              <h4 class="title"><a href="">Dolor Sitema</a></h4>
              <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="box">
              <div class="icon" style="background: #e6fdfc;"><i class="bi bi-bar-chart" style="color: #3fcdc7;"></i></div>
              <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
              <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 wow" data-aos="zoom-in" data-aos-delay="100">
            <div class="box">
              <div class="icon" style="background: #eafde7;"><i class="bi bi-binoculars" style="color:#41cf2e;"></i></div>
              <h4 class="title"><a href="">Magni Dolores</a></h4>
              <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="200"">
        <div class=" box">
            <div class="icon" style="background: #e1eeff;"><i class="bi bi-brightness-high" style="color: #2282ff;"></i></div>
            <h4 class="title"><a href="">Nemo Enim</a></h4>
            <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
          </div>
        </div>
        <div class="col-md-6 col-lg-4" data-aos="zoom-in" data-aos-delay="300">
          <div class="box">
            <div class="icon" style="background: #ecebff;"><i class="bi bi-calendar4-week" style="color: #8660fe;"></i></div>
            <h4 class="title"><a href="">Eiusmod Tempor</a></h4>
            <p class="description">Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi</p>
          </div>
        </div>

      </div>

      </div>
    </section><!-- End Services Section -->

<!--
<i class="bi bi-bookmarks" style="color: #f058dc;"></i>
<i class="bi bi-box-seam" style="color: #ffb774;"></i>
<i class="bi bi-card-checklist" style="color: #589af1;"></i>
-->



    <!-- ======= Call To Action Section ======= -->
    <section id="call-to-action" class="call-to-action">
      <div class="container" data-aos="zoom-out">
        <div class="row">
          <div class="col-lg-9 text-center text-lg-start">
            <h3 class="cta-title">👋Hi ChatBot</h3>
            <p class="cta-text"> 오늘의 공부 챗봇을 통해 관리자에게 실시간 문의가 가능합니다.</p>
          </div>
          <div class="col-lg-3 cta-btn-container text-center">
            <a class="cta-btn align-middle" href="#">CONNECT</a>
          </div>
        </div>

      </div>
    </section><!--  End Call To Action Section -->

    <!-- ======= Features Section ======= -->
    <section id="features" class="features">
      <div class="container" data-aos="fade-up">

        <div class="row feature-item">
          <div class="col-lg-6" data-aos="fade-right" data-aos-delay="100">
            <img src="${contextPath}/css/assets/img/features-1.svg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 wow fadeInUp pt-5 pt-lg-0" data-aos="fade-left" data-aos-delay="150">
            <h4>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h4>
            <p>
              Ipsum in aspernatur ut possimus sint. Quia omnis est occaecati possimus ea. Quas molestiae perspiciatis occaecati qui rerum. Deleniti quod porro sed quisquam saepe. Numquam mollitia recusandae non ad at et a.
            </p>
            <p>
              Ad vitae recusandae odit possimus. Quaerat cum ipsum corrupti. Odit qui asperiores ea corporis deserunt veritatis quidem expedita perferendis. Qui rerum eligendi ex doloribus quia sit. Porro rerum eum eum.
            </p>
          </div>
        </div>

      </div>
    </section><!-- End Features Section -->

    <!-- ======= Cafe Section ======= -->
    <section id="pricing" class="pricing section-bg wow fadeInUp">

      <div class="container" data-aos="fade-up">

        <header class="section-header">
          <h3>Weekly Study Cafe</h3>
          <p>이번주 별점이 높은 순위의<br>스터디 카페를 추천해드립니다!</p>
        </header>

        <div class="row flex-items-xs-middle flex-items-xs-center">

          <!-- Weekly Study Cafe  -->
          <div class="col-xs-12 col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="card">
              <div class="card-header">
                
              </div>
              <div class="card-block">
                <h4 class="card-title">
                  에이 스터디 카페 강남점
                </h4>
                <ul class="list-group">
                  <li class="list-group-item">별점 ⭐5.0</li>
                  <li class="list-group-item">⩗ 친절해요</li>
                  <li class="list-group-item">⩗ 깨끗해요</li>
                </ul>
                <a href="#" class="btn">Reservation</a>
              </div>
            </div>
          </div>

          <!-- Weekly Study Cafe  -->
          <div class="col-xs-12 col-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div class="card">
              <div class="card-header">
                
              </div>
              <div class="card-block">
                <h4 class="card-title">
                  해피해피 스터디 카페
                </h4>
                <ul class="list-group">
                  <li class="list-group-item">별점 ⭐4.2</li>
                  <li class="list-group-item">⩗ 넓고 쾌적해요</li>
                  <li class="list-group-item">⩗ 음료를 제공해줘요</li>
                </ul>
                <a href="#" class="btn">Reservation</a>
              </div>
            </div>
          </div>

          <!-- Premium Plan  -->
          <div class="col-xs-12 col-lg-4" data-aos="fade-up" data-aos-delay="300">
            <div class="card">
              <div class="card-header">
                
              </div>
              <div class="card-block">
                <h4 class="card-title">
                  룰루랄라 스터디 카페
                </h4>
                <ul class="list-group">
                  <li class="list-group-item">별점 ⭐4.0</li>
                  <li class="list-group-item">⩗ 노트북 대여가 가능해요</li>
                  <li class="list-group-item">⩗ 이용금액이 저렴해요</li>
                </ul>
                <a href="#" class="btn">Choose Plan</a>
              </div>
            </div>
          </div>

        </div>
      </div>

    </section><!-- End Pricing Section -->

    <!-- ======= F.A.Q Section ======= -->
    <section id="faq" class="faq">
      <div class="container" data-aos="fade-up">
        <header class="section-header">
          <h3>Asked Questions</h3>
          <p>자주 묻는 질문</p>
        </header>

        <ul class="faq-list" data-aso="fade-up" data-aos-delay="100">

          <li>
            <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">이런저런거 어떻게 해결하나요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq1" class="collapse" data-bs-parent=".faq-list">
              <p>
                Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">으아아아아아아아? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq2" class="collapse" data-bs-parent=".faq-list">
              <p>
                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">저것도 궁금쓰? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq3" class="collapse" data-bs-parent=".faq-list">
              <p>
                Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">이것도 궁금쓰? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq4" class="collapse" data-bs-parent=".faq-list">
              <p>
                Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
              </p>
            </div>
          </li>
        </ul>

      </div>
    </section><!-- End F.A.Q Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="section-bg">
    <div class="footer-top">
      <div class="container">

        <div class="row">

          <div class="col-lg-6">

            <div class="row">

              <div class="col-sm-6">

                <div class="footer-info">
                  <h3>TODAY STUDY</h3>
                </div>

                <div class="footer-newsletter">
                  <h4>Our Newsletter</h4>
                  <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna veniam enim veniam illum dolore legam minim quorum culpa amet magna export quem.</p>
                  <form action="" method="post">
                    <input type="email" name="email"><input type="submit" value="Subscribe">
                  </form>
                </div>

              </div>

              <div class="col-sm-6">
                <div class="footer-links">
                  <h4>Useful Links</h4>
                  <ul>
                    <li><a href="#">오늘의 공부 소개</a></li>
                    <li><a href="#about">이용약관</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">1:1문의</a></li>
                    <li><a href="#">법적고지</a></li>
                  </ul>
                </div>

                <div class="footer-links">
                  <h4>Contact Us</h4>
                  <p>
                    상호명 : 오늘의 공부 <br>
                    주소 : (우)1111 서울특별시 강남구<br>
                    역삼동 819-3 삼오빌딩<br>
                    <strong>FAX:</strong> 0505-111-1111<br>
                    <strong>Email:</strong> bit.study2@gmail.com<br>
                  </p>
                </div>

                <div class="social-links">
                  <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                  <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                  <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                  <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                </div>

              </div>

            </div>

          </div>

          <div class="col-lg-6">

            <div class="form">

              <h4>Send us a message</h4>

              <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                <div class="form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
                <div class="form-group mt-3">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                </div>
                <div class="form-group mt-3">
                  <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                </div>
                <div class="form-group mt-3">
                  <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
                </div>

                <div class="my-3">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>
                </div>

                <div class="text-center"><button type="submit" title="Send Message">Send Message</button></div>
              </form>

            </div>

          </div>

        </div>

      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright ⓒ2021<strong>TODAYSTUDY</strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!--
        All the links in the footer should remain intact.
        You can delete the links only if you purchased the pro version.
        Licensing information: https://bootstrapmade.com/license/
        Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Rapid
      -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End  Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${contextPath}/css/assets/vendor/aos/aos.js"></script>
  <script src="${contextPath}/css/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${contextPath}/css/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${contextPath}/css/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${contextPath}/css/assets/vendor/php-email-form/validate.js"></script>
  <script src="${contextPath}/css/assets/vendor/purecounter/purecounter.js"></script>
  <script src="${contextPath}/css/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${contextPath}/css/assets/js/main.js"></script>

</body>

</html>