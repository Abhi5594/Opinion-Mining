<%-- 
    Document   : Cust_Login_Action
    Created on : Jan 7, 2020, 10:30:39 AM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
try{
    
    String query="select * from register where username='"+uname+"'and password='"+pwd+"'";
    ResultSet r=Queries.getExecuteQuery(query);
    if(r.next()){
    String status=r.getString("status");
    if(status.equals("waiting")){
        %>
       <script type="text/javascript">
           window.alert("You Are Not Authorized By The Admin..!!");
           window.location="Users.jsp";
           </script>
          <%
    }else{
session.setAttribute("username",uname);
session.setAttribute("email",r.getString("email"));
       %>
       <script type="text/javascript">
           window.alert("User Login SuccessFully..!!");
           window.location="UserHome.jsp";
           </script>
          <%
    }
}else{
 %>
       <script type="text/javascript">
           window.alert("User Login Failed..!!");
           window.location="Users.jsp";
           </script>
          <%
}
    
    
}catch(Exception e){
  out.println(e);  
}




%>