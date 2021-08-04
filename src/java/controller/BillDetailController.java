/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao1.DAO;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "BillDetailController", urlPatterns = {"/BillDetailController"})
public class BillDetailController extends HttpServlet {

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
        DAO dao = new DAO();
        String oid = request.getParameter("oid");
        String sql = "select b.oID, b.dateCreate,b.status, c.cid, c.cname, c.cphone, c.cAddress, c.username,\n" +
"                         b.cname, b.cphone, b.cAddress, p.id, p.name, p.price, bd.quantity, bd.total, ct.cid\n" +
"                         from Bill b inner join Customer c on b.cid = c.cid \n" +
"                         join BillDetail bd on bd.oID = b.oID\n" +
"                         join Product p on p.id = bd.id\n" +
"                         join Category ct on ct.cid = p.cateID\n" +
"                         where b.oid = '" +oid+"'";
        ResultSet rs1 = dao.getData(sql);
        ResultSet rs2 = dao.getData(sql);
        request.setAttribute("ketQua1", rs1);
        request.setAttribute("ketQua2", rs2);
                //request.getRequestDispatcher("BillDetail2.jsp").forward(request, response);
       request.getRequestDispatcher("BillDetail2.jsp").forward(request, response);
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
