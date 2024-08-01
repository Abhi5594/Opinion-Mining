
package com.post;

import com.database.DbConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig(maxFileSize=16*1024*1024)
public class PostAction extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try{
           HttpSession session=request.getSession();
         String email=(String)session.getAttribute("email");
String username=(String)session.getAttribute("username");

String pname=request.getParameter("pname");
String pcontent=request.getParameter("pcontent");
Part p=request.getPart("image");  
           InputStream in=p.getInputStream();


Connection con=DbConnection.getConnection();
PreparedStatement pst=con.prepareStatement("insert into post values(null,?,?,?,?,now(),'0','0')");

pst.setString(1,username);
pst.setString(2,pname);
pst.setString(3,pcontent);
pst.setBlob(4,in);

int i=pst.executeUpdate();
if(i>0){
    response.sendRedirect("Add_Post.jsp?msg=success");
}else{
      response.sendRedirect("Add_Post.jsp?msg=failed");
}
       }catch(Exception e){
       System.out.println(e);    
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
