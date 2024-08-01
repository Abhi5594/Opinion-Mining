/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.graph;

import com.database.Queries;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;


public class Opinion_Mining extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OutputStream out = response.getOutputStream();
    	 DefaultCategoryDataset bar_chart_servlet = new DefaultCategoryDataset();
        try{
           HttpSession session=request.getSession();
           String  p=(String)session.getAttribute("postname");
           
           
           
           HashMap<String, String> sh=new HashMap<String, String>();
        
          ResultSet r=Queries.getExecuteQuery("select distinct postname from comment_count where postname='"+p+"'");
          while(r.next()){
          String postname=r.getString("postname"); 
          
    
          
          
          ResultSet r1=Queries.getExecuteQuery("select count(comment_type),postname from comment_count WHERE postname='"+postname+"' and comment_type='positive'");
         if(r1.next()){
         String pname=r1.getString("postname");
        int c=r1.getInt(1);
           String count=""+c; 
             
             sh.put("positive",count);
            
         }
         ResultSet r11=Queries.getExecuteQuery("select count(comment_type),postname from comment_count WHERE postname='"+postname+"' and comment_type='negative'");
         if(r11.next()){
         String pname=r11.getString("postname");
         int c=r11.getInt(1);
           String count=""+c;  
             sh.put("negative",count);
           }
  
          
      for(Map.Entry entry:sh.entrySet()){
   String  key=(String)entry.getKey();
           
   String value=(String)entry.getValue();
   
    int ccc=Integer.parseInt(value);
    bar_chart_servlet.addValue(ccc, p, key);
}    
         
          }
             
             JFreeChart BarChartObject=ChartFactory.createBarChart("","","Count",bar_chart_servlet,PlotOrientation.VERTICAL,true,true,false); 
                response.setContentType("image/png");
                ChartUtilities.writeChartAsPNG(out, BarChartObject, 580, 400);
            
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



