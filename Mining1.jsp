<%-- 
    Document   : Users
    Created on : Jan 21, 2020, 12:01:10 PM
    Author     : Acer
--%>

<%@page import="java.util.ArrayList"%>
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
			
		</div>
	</div>
	
	 <style>
                                            table tr th{
                                                border:none;
                                            }
                                            table tr td{
                                                border:none;
                                                color:black;
                                            }
                                            table{
                                             
                                                border-bottom:1px solid slategray;
                                            }
                                        </style>
	<section id="about">
		<div class="container">
			<div class="center">
				<div class="col-md-6 col-md-offset-3">
                                    <%
                                        %>
                                        <center>
					<h2>Mining On Comments</h2>
					<hr>
                                        <% 
                                            String id=request.getParameter("id");
                                            
                         String query="select distinct post_name from comment where post_id='"+id+"'";
                         ResultSet r=Queries.getExecuteQuery(query);
                         
                         while(r.next()){
                            String  pname=r.getString("post_name");
                             session.setAttribute("postname",pname);
                         }
                         
                          
                                             %>  
                                             <iframe src="Opinion_Mining" width="600" height="500"></iframe>
                                        <a href="View_Posts_Analysis.jsp">BACK</a>
                 </center>
     
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