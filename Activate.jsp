<%-- 
    Document   : Activate
    Created on : Jan 21, 2020, 12:41:31 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.database.Queries"%>

<%
String id=request.getParameter("id");

try{
  
    String query="update register set status='Accepted' where id='"+id+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
    %>
       <script type="text/javascript">
           window.alert("User Activation SuccessFully..!!");
           window.location="View_Users.jsp";
           </script>
          <%
    
}else{
 %>
       <script type="text/javascript">
           window.alert("User Activation Failed..!!");
           window.location="View_Users.jsp";
           </script>
          <%
}
    
}catch(Exception e){
  out.println(e);  
}
%>