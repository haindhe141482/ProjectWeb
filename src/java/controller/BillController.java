/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao1.DAO;
import entity.Bill;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class BillController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
             
          String service = request.getParameter("service");
           String status = request.getParameter("status");    
           List<Bill> list1;
         if (service.equals("update")) {
             String oid = request.getParameter("oid");
        dao.UpdateBill(oid);
        response.sendRedirect("BillController");
              
          }
         if(service.equals("update1")){
              String oid = request.getParameter("oid");
        dao.UpdateBill2(oid);
        response.sendRedirect("BillController");
         }
         if(service.equals("update2")){
              String oid = request.getParameter("oid");
        dao.UpdateBill3(oid);
        response.sendRedirect("BillController");
         }
         if(service.equals("searchByStatus")){
             if(status.equals("4")){
                 list1 =dao.getAllBill();               
             }else{
                 list1 = dao.getBillbystatus(status);
             }
              
             request.setAttribute("checkStatus",status);
             request.setAttribute("listB",list1);
             request.getRequestDispatcher("Bill.jsp").forward(request, response);
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
       DAO dao = new DAO();
        List<Bill> list = dao.getAllBill();     
        request.setAttribute("listB", list);
        request.getRequestDispatcher("Bill.jsp").forward(request, response);
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
