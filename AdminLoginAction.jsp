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
    
    String query="select * from admin where username='"+uname+"'and password='"+pwd+"'";
    ResultSet r=Queries.getExecuteQuery(query);
    if(r.next()){
        %>
       <script type="text/javascript">
           window.alert("Admin Login SuccessFully..!!");
           window.location="AdminHome.jsp";
           </script>
          <%
    
}else{
 %>
       <script type="text/javascript">
           window.alert("Admin Login Failed..!!");
           window.location="Admin.jsp";
           </script>
          <%
}
 }catch(Exception e){
  out.println(e);  
}




%>