<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
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

  <!-- food section -->
<section class="food_section layout_padding-bottom">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          	<br>Our Menu
        </h2>
      </div>
      <div class="filters-content">
        <div class="row grid">
        
          <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="images/f1.png" alt="">
                </div>
                      <div class="detail-box">
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        PreparedStatement updateStmt = null;

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

                            // Create statement and execute query
                            stmt = conn.createStatement();
                            String sql = "SELECT * FROM menu WHERE id=1;";
                            rs = stmt.executeQuery(sql);
                            
                            String sql2 = "UPDATE menu SET PRICE=12.99 WHERE id=1;";
                            updateStmt = conn.prepareStatement(sql2);
                            
                            int rowsAffected = updateStmt.executeUpdate(sql2);

                            System.out.println(rowsAffected + " rows updated.");

                            
                            // Display menu item details
                            if (rs.next()) {
                                String name = rs.getString("name");
                                double price = rs.getDouble("price");
                                String description = rs.getString("description");
		                    %>
		
		                     <h5><%= name %></h5>
		                    <p><%= description %></p>
		                    <h4>$<%= price %></h4>
		
		                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close JDBC objects in the reverse order of their creation
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException se) {
                                se.printStackTrace();
                            }
                        }
                    %>
                    <div class="options">
                        <a href="#">
                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029"
                                 style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                <g>
                                    <g>
                                        <path
                                            d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248 c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48 C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064 c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4 C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296 c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                </g>
                            </svg>
                        </a>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
	     <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="images/f3.png" alt="">
                </div>
                      <div class="detail-box">
                       <%
					        Connection conn1 = null;
					        Statement stmt1 = null;
					        ResultSet rs1 = null;
					        PreparedStatement updateStmt1 = null;
					
					        // Define JDBC connection parameters
					        String jdbcDriver1 = "com.mysql.jdbc.Driver";
					        String jdbcUrl1 = "jdbc:mysql://10.100.0.51:3306/test";
					        String dbUser1 = "ham";
					        String dbPass1 = "1234";
					
					        try {
					            // Load the JDBC driver
					            Class.forName(jdbcDriver1);
					
					            // Establish connection
					            conn1 = DriverManager.getConnection(jdbcUrl1, dbUser1, dbPass1);
					
					            // Create statement and execute query
					            stmt1 = conn1.createStatement();
					            String sql = "SELECT * FROM menu WHERE id=2;";
					            rs1 = stmt1.executeQuery(sql);
					            
					            String sql2 = "UPDATE menu SET PRICE=10.99 WHERE id=2;";
					            updateStmt1 = conn1.prepareStatement(sql2);
					            
					            int rowsAffected = updateStmt1.executeUpdate();
					
					            // rowsAffected 변수에는 UPDATE 문에 의해 수정된 행의 수가 저장됩니다.
					            System.out.println(rowsAffected + " rows updated.");
					
					            // Display menu item details
					            if (rs1.next()) {
					                String name = rs1.getString("name");
					                double price = rs1.getDouble("price");
					                String description = rs1.getString("description");
					    %>
					    
					    <h5><%= name %></h5>
					    <p><%= description %></p>
					    <h4>$<%= price %></h4>
					
					    <% 
					            }
					        } catch (Exception e) {
					            e.printStackTrace();
					        } finally {
					            // Close JDBC objects in the reverse order of their creation
					            try {
					                if (rs1 != null) rs1.close();
					                if (stmt1 != null) stmt1.close();
					                if (updateStmt1 != null) updateStmt1.close();
					                if (conn1 != null) conn1.close();
					            } catch (SQLException se) {
					                se.printStackTrace();
					            }
					        }
					    %>
                    <div class="options">
                        <a href="#">
                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029"
                                 style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                <g>
                                    <g>
                                        <path
                                            d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248 c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48 C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064 c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4 C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296 c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                </g>
                            </svg>
                        </a>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    
		    <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="images/f6.png" alt="">
                </div>
                      <div class="detail-box">
                    <%
					        Connection conn2 = null;
					        Statement stmt2 = null;
					        ResultSet rs2 = null;
					        PreparedStatement updatestmt2 = null;
					
					        // Define JDBC connection parameters
					        String jdbcDriver2 = "com.mysql.jdbc.Driver";
					        String jdbcUrl2 = "jdbc:mysql://10.100.0.51:3306/test";
					        String dbUser2 = "ham";
					        String dbPass2 = "1234";
					
					        try {
					            // Load the JDBC driver
					            Class.forName(jdbcDriver1);
					
					            // Establish connection
					            conn2 = DriverManager.getConnection(jdbcUrl1, dbUser1, dbPass1);
					
					            // Create statement and execute query
					            stmt2 = conn2.createStatement();
					            String sql = "SELECT * FROM menu WHERE id=3;";
					            rs2 = stmt2.executeQuery(sql);
					            
					            String sql2 = "UPDATE menu SET PRICE=15.99 WHERE id=3;";
					            updatestmt2 = conn2.prepareStatement(sql2);
					            
					            int rowsAffected = updatestmt2.executeUpdate();
					
					            // rowsAffected 변수에는 UPDATE 문에 의해 수정된 행의 수가 저장됩니다.
					            System.out.println(rowsAffected + " rows updated.");
					
					            // Display menu item details
					            if (rs2.next()) {
					                String name = rs2.getString("name");
					                double price = rs2.getDouble("price");
					                String description = rs2.getString("description");
					    %>
					    
					    <h5><%= name %></h5>
					    <p><%= description %></p>
					    <h4>$<%= price %></h4>
					
					    <% 
					            }
					        } catch (Exception e) {
					            e.printStackTrace();
					        } finally {
					            // Close JDBC objects in the reverse order of their creation
					            try {
					                if (rs2 != null) rs2.close();
					                if (stmt2 != null) stmt2.close();
					                if (updatestmt2 != null) updatestmt2.close();
					                if (conn2 != null) conn2.close();
					            } catch (SQLException se) {
					                se.printStackTrace();
					            }
					        }
					    %>
                    <div class="options">
                        <a href="#">
                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029"
                                 style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                <g>
                                    <g>
                                        <path
                                            d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248 c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48 C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064 c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4 C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296 c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                </g>
                            </svg>
                        </a>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    
	      <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="images/f2.png" alt="">
                </div>
                      <div class="detail-box">
                    <%
					        Connection conn3 = null;
					        Statement stmt3 = null;
					        ResultSet rs3 = null;
					        PreparedStatement updatestmt3 = null;
					
					        // Define JDBC connection parameters
					        String jdbcDriver3 = "com.mysql.jdbc.Driver";
					        String jdbcUrl3 = "jdbc:mysql://10.100.0.51:3306/test";
					        String dbUser3 = "ham";
					        String dbPass3 = "1234";
					
					        try {
					            // Load the JDBC driver
					            Class.forName(jdbcDriver1);
					
					            // Establish connection
					            conn3 = DriverManager.getConnection(jdbcUrl1, dbUser1, dbPass1);
					
					            // Create statement and execute query
					            stmt3 = conn3.createStatement();
					            String sql = "SELECT * FROM menu WHERE id=4;";
					            rs3 = stmt3.executeQuery(sql);
					            
					            String sql3 = "UPDATE menu SET PRICE=7.99 WHERE id=4;";
					            updatestmt3 = conn3.prepareStatement(sql3);
					            
					            int rowsAffected = updatestmt3.executeUpdate();
					
					            // rowsAffected 변수에는 UPDATE 문에 의해 수정된 행의 수가 저장됩니다.
					            System.out.println(rowsAffected + " rows updated.");
					
					            // Display menu item details
					            if (rs3.next()) {
					                String name = rs3.getString("name");
					                double price = rs3.getDouble("price");
					                String description = rs3.getString("description");
					    %>
					    
					    <h5><%= name %></h5>
					    <p><%= description %></p>
					    <h4>$<%= price %></h4>
					
					    <% 
					            }
					        } catch (Exception e) {
					            e.printStackTrace();
					        } finally {
					            // Close JDBC objects in the reverse order of their creation
					            try {
					                if (rs3 != null) rs3.close();
					                if (stmt3 != null) stmt3.close();
					                if (updatestmt3 != null) updatestmt3.close();
					                if (conn3 != null) conn3.close();
					            } catch (SQLException se) {
					                se.printStackTrace();
					            }
					        }
					    %>
                    <div class="options">
                        <a href="#">
                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029"
                                 style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                <g>
                                    <g>
                                        <path
                                            d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248 c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48 C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064 c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4 C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296 c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                </g>
                            </svg>
                        </a>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="images/f9.png" alt="">
                </div>
                      <div class="detail-box">
                     <%
					        Connection conn4 = null;
					        Statement stmt4 = null;
					        ResultSet rs4 = null;
					        PreparedStatement updatestmt4 = null;
					
					        // Define JDBC connection parameters
					        String jdbcDriver4 = "com.mysql.jdbc.Driver";
					        String jdbcUrl4 = "jdbc:mysql://10.100.0.51:3306/test";
					        String dbUser4 = "ham";
					        String dbPass4 = "1234";
					
					        try {
					            // Load the JDBC driver
					            Class.forName(jdbcDriver1);
					
					            // Establish connection
					            conn4 = DriverManager.getConnection(jdbcUrl1, dbUser1, dbPass1);
					
					            // Create statement and execute query
					            stmt4 = conn4.createStatement();
					            String sql = "SELECT * FROM menu WHERE id=5;";
					            rs4 = stmt4.executeQuery(sql);
					            
					            String sql4 = "UPDATE menu SET PRICE=11.99 WHERE id=5;";
					            updatestmt4 = conn4.prepareStatement(sql4);
					            
					            int rowsAffected = updatestmt4.executeUpdate();
					
					            // rowsAffected 변수에는 UPDATE 문에 의해 수정된 행의 수가 저장됩니다.
					            System.out.println(rowsAffected + " rows updated.");
					
					            // Display menu item details
					            if (rs4.next()) {
					                String name = rs4.getString("name");
					                double price = rs4.getDouble("price");
					                String description = rs4.getString("description");
					    %>
					    
					    <h5><%= name %></h5>
					    <p><%= description %></p>
					    <h4>$<%= price %></h4>
					
					    <% 
					            }
					        } catch (Exception e) {
					            e.printStackTrace();
					        } finally {
					            // Close JDBC objects in the reverse order of their creation
					            try {
					                if (rs4 != null) rs4.close();
					                if (stmt4 != null) stmt4.close();
					                if (updatestmt4 != null) updatestmt4.close();
					                if (conn4 != null) conn4.close();
					            } catch (SQLException se) {
					                se.printStackTrace();
					            }
					        }
					    %>
                    <div class="options">
                        <a href="#">
                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029"
                                 style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                <g>
                                    <g>
                                        <path
                                            d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248 c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48 C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064 c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4 C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296 c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                </g>
                            </svg>
                        </a>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    
		     <div class="col-sm-6 col-lg-4 all pizza">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="images/f5.png" alt="">
                </div>
                      <div class="detail-box">
                     <%
					        Connection conn5 = null;
					        Statement stmt5 = null;
					        ResultSet rs5 = null;
					        PreparedStatement updatestmt5 = null;
					
					        // Define JDBC connection parameters
					        String jdbcDriver5 = "com.mysql.jdbc.Driver";
					        String jdbcUrl5 = "jdbc:mysql://10.100.0.51:3306/test";
					        String dbUser5 = "ham";
					        String dbPass5 = "1234";
					
					        try {
					            // Load the JDBC driver
					            Class.forName(jdbcDriver1);
					
					            // Establish connection
					            conn5 = DriverManager.getConnection(jdbcUrl1, dbUser1, dbPass1);
					
					            // Create statement and execute query
					            stmt5 = conn5.createStatement();
					            String sql = "SELECT * FROM menu WHERE id=6;";
					            rs5 = stmt5.executeQuery(sql);
					            
					            String sql5 = "UPDATE menu SET PRICE=2.99 WHERE id=6;";
					            updatestmt5 = conn5.prepareStatement(sql5);
					            
					            int rowsAffected = updatestmt5.executeUpdate();
					
					            // rowsAffected 변수에는 UPDATE 문에 의해 수정된 행의 수가 저장됩니다.
					            System.out.println(rowsAffected + " rows updated.");
					
					            // Display menu item details
					            if (rs5.next()) {
					                String name = rs5.getString("name");
					                double price = rs5.getDouble("price");
					                String description = rs5.getString("description");
					    %>
					    
					    <h5><%= name %></h5>
					    <p><%= description %></p>
					    <h4>$<%= price %></h4>
					
					    <% 
					            }
					        } catch (Exception e) {
					            e.printStackTrace();
					        } finally {
					            // Close JDBC objects in the reverse order of their creation
					            try {
					                if (rs5 != null) rs5.close();
					                if (stmt5 != null) stmt5.close();
					                if (updatestmt5 != null) updatestmt5.close();
					                if (conn5 != null) conn5.close();
					            } catch (SQLException se) {
					                se.printStackTrace();
					            }
					        }
					    %>
                    <div class="options">
                        <a href="#">
                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029"
                                 style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                <g>
                                    <g>
                                        <path
                                            d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248 c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48 C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064 c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4 C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                </g>
                                <g>
                                    <g>
                                        <path
                                            d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296 c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                </g>
                            </svg>
                        </a>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		</div>
		</div>
	<br>
  </div>
</section>

  <!-- end food section -->


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
