/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.cart;

import dao1.DAO;
import entity.Account;
import entity.Bill;
import entity.BillDetail;
import entity.Customer;
import entity.Product;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "OrderControl", urlPatterns = {"/order"})
public class OrderControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String service = request.getParameter("service");
        HttpSession session = request.getSession();

        Customer a = (Customer) session.getAttribute("acc1");
        if (a == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {

       
          
            String total2 = request.getParameter("total");
            
            String cname = request.getParameter("cname");
            String cphone = request.getParameter("cphone");
            String caddress = request.getParameter("caddress");
            session.setAttribute("address", caddress);
            java.util.Enumeration em = session.getAttributeNames();
            if (em.hasMoreElements()) {
                String username = "";
                while (em.hasMoreElements()) {
                    String key = em.nextElement().toString();
                    if (key.equals("username")) {
                        try {
                            username = session.getAttribute("username").toString();
                            addBillToDataBase(username, total2, cname, cphone, caddress, request, response);
                            Cookie arr[] = request.getCookies();
                            List<Product> list = new ArrayList<>();
                            DAO dao = new DAO();
//                            for (Cookie o : arr) {
//                                if (o.getName().equals("id")) {
//                                    String txt[] = o.getValue().split(",");
//                                    for (String s : txt) {
//                                        list.add(dao.getProductByID(s));
//                                    }
//                                }
//                            }
//                            
//                            for (int i = 0; i < list.size(); i++) {
//                                int count = 1;
//                                for (int j = i + 1; j < list.size(); j++) {
//                                    if (list.get(i).getId() == list.get(j).getId()) {
//                                        count++;
//                                        list.remove(j);
//                                        j--;
//                                        list.get(i).setAmount(count);
//                                    }
//                                }
//                            }                                                               
//                            for (Cookie o : arr) {
//                                o.setMaxAge(0);
//                                response.addCookie(o);
//                            }
                           response.sendRedirect("Checkout.jsp");
                        } catch (SQLException ex) {
                            Logger.getLogger(OrderControl.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }

            }
        }
        

    }

    private void addBillToDataBase(String username, String total, String cname, String cphone,
            String caddress, HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        ArrayList<Customer> cuslist = dao.getAllCustomer();
        Customer customer = null;
        for (Customer cus : cuslist) {
            if (cus.getUsername().equalsIgnoreCase(username)) {
                customer = cus;
            }
        }
        int max = 0;
        ArrayList<Bill> billlist = (ArrayList<Bill>) dao.getAllBill();
        for (Bill bill : billlist) {
            if (Integer.parseInt(bill.getoID()) > max) {
                max = Integer.parseInt(bill.getoID());
            }
        }
        max = max + 1;
        double totalbill = Double.parseDouble(total);
        dao.addBill(Integer.toString(max), cname,
                cphone, caddress, totalbill, customer.getCid());  
        Cookie arr[] = request.getCookies();
         List<Product> list = new ArrayList<>();                          
                            for (Cookie o : arr) {
                                if (o.getName().equals("id")) {
                                    String txt[] = o.getValue().split(",");
                                    for (String s : txt) {
                                        list.add(dao.getProductByID(s));
                                    }
                                }
                            }
                            double total3=0;
                            for (int i = 0; i < list.size(); i++) {
                                int count = 1;
                                for (int j = i + 1; j < list.size(); j++) {
                                    if (list.get(i).getId() == list.get(j).getId()) {
                                        count++;
                                        list.get(i).setAmount(count);
                                        total3 = count*list.get(i).getPrice();
                                        dao.addBillDetail(list.get(i).getId(), String.valueOf(max), count,list.get(i).getPrice() , total3);
                                    }
                                }
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
