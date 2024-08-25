<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
// 세션에서 사용자 정보 가져오기
HttpSession httpSession = request.getSession();
String userId = (String) httpSession.getAttribute("userId");
String password = (String) httpSession.getAttribute("password");
String address = (String) httpSession.getAttribute("address");
String phoneNumber = (String) httpSession.getAttribute("phoneNumber");
%>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="">

  <title> Team 5 </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
   <header class="header_section">
        <div class="container">
            <nav class="navbar navbar-expand-lg custom_nav-container ">
                <a class="navbar-brand" href="index.jsp">
                    <span>
                        Team 5
                    </span>
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""> </span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav  mx-auto ">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="menu.jsp">Menu</a>
                        </li>
                    </ul>
                    <div class="user_option">
                        <% if (session.getAttribute("userId") != null) { %>
                            <a href="mypage.jsp" class="user_link">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </a>
                            <a href="login.jsp?action=logout" class="order_online">
                                Logout
                            </a>
                        <% } else { %>
                            <a href="join.jsp" class="order_online">
                                Join us!
                            </a>
                            <a href="login.jsp" class="order_online">
                                Login
                            </a>
                        <% } %>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!-- end header section -->
  </div>

  <!-- book section -->
  <section class="book_section layout_padding">
    <div class="container">
      <div class="heading_container">
        <h2>
          My Page
        </h2>
        
      </div>

      <div class="row">
      
      
<div class="col-md-6">
    <div class="form_container">
        <form action="">
            <div>
                <input type="text" class="form-control" placeholder="ID" value="id : &nbsp;<%= session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>" readonly />
            </div>
            
            <div>
                <input type="text" class="form-control" placeholder="Password" value="password : <%= session.getAttribute("password") != null ? session.getAttribute("password") : "" %>" readonly />
            </div>
            <div>
                <input type="text" class="form-control" placeholder="Address" value="address : <%= session.getAttribute("address") != null ? session.getAttribute("address") : "" %>" readonly />
            </div>
            <div>
                <input type="text" class="form-control" placeholder="Phone-Number" value="phone : <%= session.getAttribute("phone") != null ? session.getAttribute("phone") : "" %>" readonly />
            </div>
             <div>
                
                  <%
					        Connection conn = null;
					        Statement stmt = null;
					        ResultSet rs = null;
					        PreparedStatement updatestmt = null;
					
					        // Define JDBC connection parameters
					        String jdbcDriver = "com.mysql.jdbc.Driver";
					        String jdbcUrl = "jdbc:mysql://10.100.0.51:3306/test";
					        String dbUser = "ham";
					        String dbPass = "1234";
					
					        try {
					            // Load the JDBC driver
					            Class.forName(jdbcDriver);
					
					            // Establish connection
					            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
					
					            
					            String sql = "UPDATE users SET address='1212' WHERE id='1234';";
					            updatestmt = conn.prepareStatement(sql);
					            
					            int rowsAffected = updatestmt.executeUpdate();
					
					            // rowsAffected 변수에는 UPDATE 문에 의해 수정된 행의 수가 저장됩니다.
					            System.out.println(rowsAffected + " rows updated.");
					
					        } catch (Exception e) {
					            e.printStackTrace();
					        } finally {
					            // Close JDBC objects in the reverse order of their creation
					            try {
					                if (rs != null) rs.close();
					                if (stmt != null) stmt.close();
					                if (updatestmt != null) updatestmt.close();
					                if (conn != null) conn.close();
					            } catch (SQLException se) {
					                se.printStackTrace();
					            }
					        }
					    %>
                
                <input type="text" class="form-control" placeholder="Grade" value="grade :  &nbsp;<%= address %>" readonly />
                
            </div>
        </form>
    </div>
</div>

        <div class="col-md-6">
          <div class="map_container ">
            <img src="images/ham.png">
          </div>
        </div>
            
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end book section -->

 <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <div class="footer_contact">
            <h4>
              Contact Us
            </h4>
            <div class="contact_link_box">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
                  Location : SEOUL
                </span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  Call +82 010-1234-5678
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>
                  TEAM_5@gamil.com
                </span>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div class="footer_detail">
            <a href="" class="footer-logo">
              Feane
            </a>
            <p>
              GOOD FOOD
            </p>
            <div class="footer_social">
              <a href="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-pinterest" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <h4>
            Opening Hours
          </h4>
          <p>
            Everyday
          </p>
          <p>
            09.00 Am -06.00 Pm
          </p>
        </div>
      </div>
      <div class="footer-info">
        <p>
          &copy; <span id="displayYear"></span> TEAM 5
          <a href="https://themewagon.com/" target="_blank">Project</a>
        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

</body>

</html>
