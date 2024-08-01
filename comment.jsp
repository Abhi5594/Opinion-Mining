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
			
		</div>
	</div>
	
	 <style>
                                            table tr th{
                                                border:none;
                                                width:100px;
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
                                   String id=request.getParameter("id");
                                   
 String msg=request.getParameter("msg");
 if(msg!=null){
   %>
   <font color="red">Failed To Comment. try Again</font>
   <%
 }

                                        %>
                                        <center><%
                                            String pname=null;
                      try{
                      String query="select * from post where id='"+id+"'";
                      ResultSet r=Queries.getExecuteQuery(query);
                      while(r.next()){
                   String owner=r.getString("owner");
                   pname=r.getString("pname");
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
                                                <a href="comment.jsp?id=<%=r.getString("id")%>" style="color:red;"><b>Comment</b></a>    
                                </div>  
                                            <div id="a" style="width:65px;height:30px;border:none;float:right;">
                                         <a href="#"><image src="images/Dislike_Pose.png" width="25" height="20"/></a>       
                                </div>  
                                            <div id="a" style="width:65px;height:30px;margin-left:20px;border:none;float:right;">
                                       <a href="#"><image src="images/like_PNG63.png" width="25" height="25"/></a>       
                                </div>  
                                            
                                       
                                        <div id="a" style="width:120px;height:20px;margin-right:70px;border:none;float:right;">
                                               
                                </div>  
                                            <div id="a" style="width:65px;height:20px;border:none;float:right;">
                                              <%=r.getString("dislikes")%> 
                                </div>  
                                            <div id="a" style="width:65px;height:20px;margin-left:20px;border:none;float:right;">
                                              <%=r.getString("likes")%>  
                                </div>  
                                            
                                       
                                        </td></tr>
                       
                        </table>   
                       <%
                      }
                  }catch(Exception e){
                   out.println(e);   
                  }
                  
                  
                  %>
                 
					
                                        <form action="Comment_Action.jsp" method="post">
                                        <table>
                                            <tr><td><input type="hidden" name="pid"  value="<%=id%>" readonly=""></td></tr>
                                             <tr><td><input type="hidden" name="pname"  value="<%=pname%>" readonly=""></td></tr>
                                                        
                                             <tr><td><textarea cols="25" rows="5" name="comment" placeholder="write comment here"></textarea></td></tr>
                                    <tr><td><input type="submit" value="COMMENT"> <input type="reset" value="RESET"></td></tr>
                                   
                                        
                                        </table>
                                        </form>
                                                        <h3>Comments</h3>   
                                                        <table>
                                                        <%
                                                        String query="select * from comment where post_id='"+id+"'";
                                                        ResultSet r=Queries.getExecuteQuery(query);
                                                        while(r.next()){
                                                         %>
                                             <tr><td><div id="a" style="width:250px;height:auto;margin-left:75px;text-align:justify;color:#33ccff;"><b>Comment By: </b><%=r.getString("commentby")%></div></td></tr>
                                   
                                              <tr><td><div id="a" style="width:250px;height:auto;margin-left:75px;text-align:justify;color:grey;"><%=r.getString("comment")%></div></td></tr>
                                   
                                                         <%
                                                        }
                                                        
                                                        %>
                                                        
                                                        </table>   
                                                        
                                                        
					<hr>
                                     
                                      
           
         
                 
                        
                                        </center>
     <a href="View_Posts_Analysis.jsp">BACK</a>
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