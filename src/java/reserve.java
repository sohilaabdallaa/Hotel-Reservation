/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sohila
 */
@WebServlet(urlPatterns = {"/reserve"})
public class reserve extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;

            HttpSession ss = request.getSession();
            String UserID = ss.getAttribute("userid").toString();
            String hotelname = request.getParameter("hotelname");
            String datefrom = request.getParameter("datefrom");
            String dateto = request.getParameter("dateto");
            String numberofadults = request.getParameter("numberofadults");
            String numberofchildren = request.getParameter("numberofchildren");
            String paymethod = request.getParameter("paymethod");
            String roomid = request.getParameter("roomid");
            out.print("hello");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/hotelreservationsystem";
            String user = "root";
            String password = "root";

            Con = DriverManager.getConnection(url, user, password);
            Stmt = Con.createStatement();
            RS = Stmt.executeQuery("Select * from rooms where roomID=" + "'" + roomid + "'and roomsavailable='avaliable';");
            if (RS.next()) {
                String line = "insert into reservation (clientid,hotelname,dateFrom,dateTo,paymentmethod,roomID,numberofadults,numberofchildren)"
                        + "VALUES("
                        + "'" + UserID + "',"
                        + "'" + hotelname + "',"
                        + "'" + datefrom + "',"
                        + "'" + dateto + "',"
                        + "'" + paymethod + "',"
                        + "'" + roomid + "',"
                        + "'" + numberofadults + "',"
                        + "'" + numberofchildren + "')";
                Stmt.executeUpdate(line);
                out.print("hello2");

                line = "update rooms set roomsavailable='Not available' where roomID=" + "'" + roomid + "';";
                int done = Stmt.executeUpdate(line);
                out.print("hello3");

                if (done > 0) {
                    //For Display Message After Trasncation Done
                    String message = " Reservation is done successfully ";
                    request.getSession().setAttribute("message", message);
                    response.sendRedirect("customerhome.jsp");
                } else {
                    out.println("Reservation Is Failed");
                }

            } else {
                String message = "Sorry..., "
                        + "Selected Room Is Not Avaliable ";
                request.getSession().setAttribute("message", message);
                response.sendRedirect("customerhome.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(reserve.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(reserve.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(reserve.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(reserve.class.getName()).log(Level.SEVERE, null, ex);
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
