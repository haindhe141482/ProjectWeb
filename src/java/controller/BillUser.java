/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao1.DAO;
import entity.Account;
import entity.Bill;
import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "BillUser", urlPatterns = {"/BillUser"})
public class BillUser extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        DAO dao = new DAO();
         Customer a = (Customer) session.getAttribute("acc1");
         String cid=String.valueOf(a.getCid());
        List<Bill> list = dao.getBillbyName(cid);
        request.setAttribute("listD", list);
        String service = request.getParameter("service");
         if(service==null){
        request.getRequestDispatcher("UserBill.jsp").forward(request, response);
          }
         if (service.equals("update")) {
             String oid = request.getParameter("oid");
        dao.UpdateBill(oid);
        response.sendRedirect("BillUser");
              
          }
         if(service.equals("update1")){
              String oid = request.getParameter("oid");
        dao.UpdateBill2(oid);
        response.sendRedirect("BillUser");
         }
        if(service.equals("update2")){
              String oid = request.getParameter("oid");
        dao.UpdateBill3(oid);
        response.sendRedirect("BillUser");
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
