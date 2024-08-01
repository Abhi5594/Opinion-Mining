<%-- 
    Document   : like
    Created on : Jan 22, 2020, 2:14:15 PM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

String id=request.getParameter("id");
try{
    int c=0;
    
    ResultSet r=Queries.getExecuteQuery("select * from post where id='"+id+"'");
    while(r.next()){
    c=r.getInt("likes");
    }
    int cc=c+1;
    int i=Queries.getExecuteUpdate("update post set likes='"+cc+"' where id='"+id+"'");
    if(i>0){
     response.sendRedirect("View_Posts_Analysis.jsp?m=s");   
    }else{
     response.sendRedirect("View_Posts_Analysis.jsp?m=f");    
    }
 
}catch(Exception e){
    out.println(e);
}


%>