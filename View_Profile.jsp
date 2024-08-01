<%-- 
    Document   : Users
    Created on : Jan 21, 2020, 12:01:10 PM
    Author     : Acer
--%>

<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Opinion_ Mining_On_Comments</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/animate.css">
	<link href="css/style.css" rel="stylesheet" />	
 <link href="style.css" rel="stylesheet" />	
  </head>
  <body>
	<header>
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navigation">
				<div class="container">					
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<div class="navbar-brand">
							<a href="index.html"><h1>Opinion_ Mining_On_Comments</h1></a>
						</div>
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation"><a href="UserHome.jsp" class="active">Home</a></li>
								
                                                                <li role="presentation"><a href="Users.jsp">Logout</a></li>
														
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		</nav>			
	</header>
	
	 <div id="home">
		<div class="slider">
			<div class="">
				<div id="about-slider">
					<div id="carousel-slider" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators visible-xs">
							<li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-slider" data-slide-to="1"></li>
							<li data-target="#carousel-slider" data-slide-to="2"></li>
						</ol>

						<div class="carousel-inner">
							<div class="item active">
								<img src="images/1.jpg" class="img-responsive" alt="" style="width:100%;height:500px;"> 
						   </div>
						   <div class="item">
								<img src="images/3.jpg" class="img-responsive" alt="" style="width:100%;height:500px;"> 
						   </div> 
						   <div class="item">
								<img src="images/1.png" class="img-responsive" alt="" style="width:100%;height:500px;"> 
						   </div> 
						</div>
						
						<a class="left carousel-control hidden-xs" href="#carousel-slider" data-slide="prev">
							<i class="fa fa-angle-left"></i> 
						</a>
						
						<a class=" right carousel-control hidden-xs"href="#carousel-slider" data-slide="next">
							<i class="fa fa-angle-right"></i> 
						</a>
					</div> <!--/#carousel-slider-->
				</div><!--/#about-slider-->
			</div>
		</div>
	</div>
	
	<section id="about">
		<div class="container">
			<div class="center">
				<div class="col-md-6 col-md-offset-3">
                                    <%String email=(String)session.getAttribute("email");
                                    String username=(String)session.getAttribute("username");
                                        %>
					<h2>Profile</h2>
					<hr>
                                      
            <table>
                                         
                  <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Mobile</th>
                      <th>Address</th>
                       <th>Status</th>
                  </tr>
                  <%
                      try{
                      String query="select * from register where email='"+email+"'";
                      ResultSet r=Queries.getExecuteQuery(query);
                      while(r.next()){
                   
                       %>
                       <tr>
                           <td><%=r.getString("id")%></td>
                            <td><%=r.getString("name")%></td>
                             <td><%=r.getString("email")%></td>
                              <td><%=r.getString("mobile")%></td>
                               <td><%=r.getString("address")%></td>
                                 <td><%=r.getString("status")%></td>     
                                
                       </tr>
                       <%
                      }
                  }catch(Exception e){
                   out.println(e);   
                  }
                  
                  
                  %>
              </table>     
                        
              <a href="UserHome.jsp">Back</a>
     
				</div>
			</div>
		</div>
	
        

	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.js"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>	
	<script src="js/jquery.isotope.min.js"></script> 
	<script src="js/functions.js"></script>
  </body>
</html>