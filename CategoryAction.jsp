<%-- 
    Document   : CategoryAction
    Created on : Jan 21, 2020, 2:34:33 PM
    Author     : Acer
--%>

<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

String uname=request.getParameter("category");
String word=request.getParameter("word");

try{
    int count=0;
    
  String query="select count(*) from words where category='"+uname+"'and word='"+word+"'";
       ResultSet r=Queries.getExecuteQuery(query);
       while(r.next()){
     count=r.getInt(1);   
       }
       if(count==0){
         int i=Queries.getExecuteUpdate("insert into words values(null,'"+uname+"','"+word+"')");
         if(i>0){
            %>
       <script type="text/javascript">
           window.alert("word added successFully..!!");
           window.location="Add_Category.jsp";
           </script>
          <%
    }else{
 %>
       <script type="text/javascript">
           window.alert("Word added Failed..!!");
           window.location="Add_Category.jsp";
           </script>
          <%
}
       }else{
%>
       <script type="text/javascript">
           window.alert("Word Already Exist for the category..!!");
           window.location="Add_Category.jsp";
           </script>
          <%
}
    
}catch(Exception e){
    out.println(e);
}



%>
%>