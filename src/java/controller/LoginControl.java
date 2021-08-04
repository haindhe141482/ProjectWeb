/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao1.DAO;
import entity.Account;
import entity.Customer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author trinh
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

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
//        String username = request.getParameter("user");
//        String password = request.getParameter("pass");
//        DAO dao = new DAO();
//        Account a = dao.login(username, password);
//        Customer b = dao.Login(username, password);
//        if (a == null && b==null) {
//            request.setAttribute("mess", "Wrong username or password!");
//            request.setAttribute("mess1","Please fill again!");
//            request.getRequestDispatcher("Login.jsp").forward(request, response);
//        } else {
//            HttpSession session = request.getSession();
//            session.setAttribute("acc", a);
//            session.setAttribute("acc1", b);
//            session.setMaxInactiveInterval(1000);
//            response.sendRedirect("home");
//        }
//        
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
//        processRequest(request, response);
        Cookie arr[] = request.getCookies();
        for (Cookie o : arr) {
            if (o.getName().equals("userC")) {
                request.setAttribute("username", o.getValue());

            }
            if (o.getName().equals("passC")) {
                request.setAttribute("password", o.getValue());
            }
        }
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
//        processRequest(request, response);
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        String remember = request.getParameter("remember");
        DAO dao = new DAO();
        Account a = dao.login(username, password);
        Customer b = dao.Login(username, password);
        if (a == null && b == null) {
            request.setAttribute("mess", "Wrong username or password!");
            request.setAttribute("mess1", "Please fill again!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            session.setAttribute("username", username);
            session.setAttribute("acc1", b);
            session.setMaxInactiveInterval(1000);
            Cookie u = new Cookie("userC", username);
            Cookie p = new Cookie("passC", password);
            u.setMaxAge(60);
            if (remember != null) {
                p.setMaxAge(60);
            } else {
                p.setMaxAge(0);
            }
            response.addCookie(u);
            response.addCookie(p);

            response.sendRedirect("home");
        }
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
