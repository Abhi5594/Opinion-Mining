<%-- 
    Document   : Comment_Action
    Created on : Jan 22, 2020, 2:29:40 PM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String username=(String)session.getAttribute("username");

String id=request.getParameter("pid");
String comment=request.getParameter("comment");

String pname=request.getParameter("pname");

try{
    String sql="insert into comment values(null,'"+username+"','"+pname+"','"+id+"','"+comment+"',now())";
    int i=Queries.getExecuteUpdate(sql);
    if(i>0){
       ResultSet rr=Queries.getExecuteQuery("select * from category");
       while(rr.next()){
          
         String word=rr.getString("word");
         if(word.contains(comment)||comment.contains(word)){
             
           ResultSet rr1=Queries.getExecuteQuery("select * from category where word='"+word+"'");
       while(rr1.next()){   
             String cat=rr1.getString("category");
            Queries.getExecuteUpdate("insert into comment_count values('"+pname+"','"+cat+"')");
       }
         }
       }
        %>
        <script type="text/javascript">
            window.alert("Commented successfully");
            window.location="View_Posts_Analysis.jsp";
        </script>
       <%
    }else{
        response.sendRedirect("comment.jsp?id="+id+"& msg=failed to comment");
  }
    
}catch(Exception e){
  out.println(e);  
}

%>