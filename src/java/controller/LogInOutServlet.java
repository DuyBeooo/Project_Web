/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import model.Account;

/**
 *
 * @author DuyNQ
 */
public class LogInOutServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        AccountDAO dao = new AccountDAO();
        Account a = dao.getAccount(user, pass);
        if (a == null) {// chua dang nhap
            if (dao.checkAccountExist(user)) {// account existed, but wrong password
                request.setAttribute("error", "Hello " + user + " !Your password is wrong ! ");
                request.getRequestDispatcher("logIn.jsp").forward(request, response);
            }
            request.setAttribute("error", "Your accounr is not exist ! ");
            request.getRequestDispatcher("logIn.jsp").forward(request, response);
        } else { // da dang nhap
            // cookie
            Cookie cuser = new Cookie("user", user);
            Cookie cpass = new Cookie("pass", pass);
            cuser.setMaxAge(60 * 60 * 24 * 3);// 3 days
            cpass.setMaxAge(60 * 60 * 24 * 3);
            response.addCookie(cuser);
            response.addCookie(cpass);
            response.sendRedirect("welcome.jsp");
            //request.getRequestDispatcher("welcome.jsp").forward(request, response);
        }

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
        // xoa cookie khi bam log out
        Cookie[] c = request.getCookies();
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equalsIgnoreCase("user")) {
                c[i].setMaxAge(0);
                response.addCookie(c[i]);
            }
            if (c[i].getName().equalsIgnoreCase("pass")) {
                c[i].setMaxAge(0);
                response.addCookie(c[i]);
            }
        }
        response.sendRedirect("logIn.jsp");
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
