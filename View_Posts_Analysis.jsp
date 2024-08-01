<%-- 
    Document   : Users
    Created on : Jan 21, 2020, 12:01:10 PM
    Author     : Acer
--%>

<%@page import="java.sql.Statement"%>
<%@page import="com.database.DbConnection"%>
<%@page import="java.sql.Connection"%>
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
                                    <%String email=(String)session.getAttribute("email");
                                    String username=(String)session.getAttribute("username");
                                    System.out.println(username);
                                        %>
                                        <center>
					<h2>View Post</h2>
					<hr>
                                     
                                      
           
         
                  <%
                      try{
                      String query="select * from post";
                      ResultSet r=Queries.getExecuteQuery(query);
                      while(r.next()){
                   String owner=r.getString("owner");
                       %>
                        <table>
                       <tr>
                           <td><b>POST BY:</b> <font color="red">
                               <%if(owner.equals(username)){
                                 %>
                                 You
                                 <%
                               }else{
%>
                                 <%=owner%>
                                 <%
}%>
                               </font></td></tr>
                         <tr><td><div id="a" style="width:250px;height:auto;margin-left:75px;text-align:justify;color:#33ccff;"><%=r.getString("pname")%></div></td></tr>
                        <tr>
                            <td><image src="view.jsp?id=<%=r.getString("id")%>" width="250" height="180"/></td></tr>
                        <tr><td><div id="a" style="width:250px;height:auto;margin-left:75px;text-align:justify;"><%=r.getString("content")%></div></td></tr>
                                    <tr><td><div id="a" style="width:120px;height:30px;margin-right:70px;border:none;float:right;">
                                                <a href="comment.jsp?id=<%=r.getString("id")%>" style="color:red;"><b>Comment
                                                    <%
                                                   ResultSet r1=Queries.getExecuteQuery("select count(*) from comment where post_id='"+r.getString("id")+"'");
                                                   while(r1.next()){
                                                      %>
                                                      <%=r1.getInt(1)%>
                                                      <%
                                                   }
                                                    
                                                    %>
                                                    </b></a>    
                                </div>  
                                            <div id="a" style="width:65px;height:30px;border:none;float:right;">
                                         <a href="dislike.jsp?id=<%=r.getString("id")%>"><image src="images/Dislike_Pose.png" width="25" height="20"/></a>       
                                </div>  
                                            <div id="a" style="width:65px;height:30px;margin-left:20px;border:none;float:right;">
                                       <a href="like.jsp?id=<%=r.getString("id")%>"><image src="images/like_PNG63.png" width="25" height="25"/></a>       
                               
                                            </div>  
                                            
                                       
                                        <div id="a" style="width:80px;height:40px;border:none;float:right;margin-right:35px;">
                                            
                                           
                                            
                                            
                                </div>  
                                <div id="a" style="width:80px;height:40px;border:none;float:right;">
                                    
                                       <%Connection con=DbConnection.getConnection();
                                           Statement s=con.createStatement();
                                           Statement s1=con.createStatement();
                                                   ResultSet r11=Queries.getExecuteQuery("select * from comment where post_id='"+r.getString("id")+"'");
                                                  int p=0;
                                                  int n=0;
                                                   while(r11.next()){
                                                    String comment=r11.getString("comment"); 
                                                    
                                                    ResultSet set=s.executeQuery("select * from category where category='positive'");
                                                    while(set.next()){
                                                    String w=set.getString("word");
                                                    
                                                    if(comment.contains(w)||w.contains(comment)){
                                                     p=p+1;   
                                                    }
                                                    }
                                                    ResultSet set1=s1.executeQuery("select * from  category where category='negative'");
                                                    while(set1.next()){
                                                    String w1=set1.getString("word");
                                                    
                                                    if(comment.contains(w1)||w1.contains(comment)){
                                                     n=n+1;   
                                                    }
                                                    }
                                                       
                                                    
                                                   }
                                                   
                                                   if(p>n){
                                                      %>
                                                      <image src="images/positive.png" width="40" height="35"/>  
                                                      <%
                                                   }else{
                                            %>
                                                <image src="images/negative.jpg" width="40" height="35"/>  
                                                        <%
                                                                        }
                                                    %> 
                                            
                                    
                                    
                                    
                                    
                                    
                                    
                                </div>  
                               
                                            <div id="a" style="width:65px;height:20px;border:none;float:right;">
                                              <%=r.getString("dislikes")%> 
                                </div>  
                                            <div id="a" style="width:65px;height:20px;margin-left:20px;border:none;float:right;">
                                              <%=r.getString("likes")%>  
                                </div>  
                                            <div id="a" style="width:120px;height:40px;border:none;float:right;">
                                       <a href="Mining1.jsp?id=<%=r.getString("id")%>" style="color:goldenrod;"><b>Mining On Comments</b></a>     
                                     
                                </div>   
                                       
                                        </td></tr>
                       
                        </table>   
                       <%
                      }
                  }catch(Exception e){
                   out.println(e);   
                  }
                  
                  
                  %>
                 
                        
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