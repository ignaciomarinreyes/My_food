/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import commands.FrontCommand;
import commands.UnknownCommand;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luicko
 */
@WebServlet(name = "FrontServlet", urlPatterns = {"/FrontServlet"})
public class FrontServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FrontServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FrontServlet at " + request.getContextPath() + "</h1>");
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
     */
    /*@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }*/

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        FrontCommand command = getCommand(request);
        command.init(getServletContext(), request, response);
        try {
            command.process();
        } catch (Exception e) {
            try {
                request.setAttribute("error", e);
                FrontCommand error = UnknownCommand.class.newInstance();
                error.init(getServletContext(), request, response);
                error.process();
            } catch (InstantiationException | IllegalAccessException ex) {
                Logger.getLogger(FrontServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        FrontCommand command = getCommand(request);
        command.init(getServletContext(), request, response);
        try {
            command.process();
        } catch (Exception e) {
            try {
                request.setAttribute("error", e);
                FrontCommand error = UnknownCommand.class.newInstance();
                error.init(getServletContext(), request, response);
                error.process();
            } catch (InstantiationException | IllegalAccessException ex) {
                Logger.getLogger(FrontServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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

    private FrontCommand getCommand(HttpServletRequest request) {
        FrontCommand f = null;
        try {
            f = (FrontCommand) getCommandClass(request).newInstance();
        } catch (InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(FrontServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }

    private Class getCommandClass(HttpServletRequest request) {
        Class result;
        String command = "";
        if(request.getParameter("command") == null){
            System.out.println(request.getParameter("command"));
            System.out.println((String)request.getAttribute("command"));
            command ="commands."+(String)request.getAttribute("command");
        } else {    
            command ="commands."+(String)request.getParameter("command");
        }
        try {
            result = Class.forName(command);
        } catch (ClassNotFoundException ex) {
            result = UnknownCommand.class;
        }
        return result;
    }

}
