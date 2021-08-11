/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Post;
import model.Comment;

/**
 *
 * @author DuyNQ
 */
public class ContactServlet extends HttpServlet {

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
            out.println("<title>Servlet ContactServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactServlet at " + request.getContextPath() + "</h1>");
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
        PostDAO p = new PostDAO();
        List<Post> listPost = p.getListPost();
        List<Comment> listComment = p.getListComment();
        request.setAttribute("listP", listPost);
        request.setAttribute("listC", listComment);
        request.getRequestDispatcher("contact.jsp").forward(request, response);
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
        // check xem da dang nhap hay chua
        Cookie[] c = request.getCookies();
        String user = "";
        for (int idx = 0; idx < c.length; idx++) {
            if (c[idx].getName().equals("user")) {
                user = c[idx].getValue();
                break;
            }
        }
        if (user.trim().length() != 0) {// da dang nhap roi
            String post = request.getParameter("post");
            String reply = request.getParameter("reply");
            String pid = request.getParameter("pid");
            PostDAO p = new PostDAO();
            if (post != null && post.trim().length() != 0) {
                p.addPost(post, p.getAccountIdByName(user) );
                response.sendRedirect("contact");
            }else if(reply != null && reply.trim().length() != 0){
                p.addComment(Integer.parseInt(pid), reply,p.getAccountIdByName(user));
                response.sendRedirect("contact");
            }else{
                response.sendRedirect("contact");
            }
        }else{// chua dang nhap
            response.sendRedirect("logIn.jsp");
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
