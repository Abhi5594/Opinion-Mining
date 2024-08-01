<%-- 
    Document   : addwordaction
    Created on : Mar 12, 2020, 8:16:52 AM
    Author     : KishanVenky
--%>

<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String category=request.getParameter("category");
String word=request.getParameter("word");
try{
 String query="insert into category values(null,'"+category+"','"+word+"')"; 
  Queries.getExecuteUpdate("insert into words values(null,'"+category+"','"+word+"')");
  int i=Queries.getExecuteUpdate(query);
  if(i>0){
      response.sendRedirect("AddWOrds.jsp?msg=success");
  }else{
   response.sendRedirect("AddWOrds.jsp?msg=Failed");   
  }
    
    
}catch(Exception e){
 out.println(e);   
}


%>