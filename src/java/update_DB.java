import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/update_DB"})
public class update_DB extends HttpServlet {

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
            try {              
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/hotelreservationsystem";
                String user = "root";
                String password = "root";
                Connection Con = null;
                Statement Stmt = null;
                ResultSet RS = null;
                ResultSet RS1 = null;
                ResultSet RS2 = null;
                int updateQuery =0;
                PreparedStatement pstatement1 ,pstatement2 , pstatement3 , pstatement4;
                 Con = DriverManager.getConnection(url, user, password);
                 Stmt = Con.createStatement();
                String displayname = request.getParameter("displayname");
                String email = request.getParameter("email");
                String number = request.getParameter("number");
                String pass = request.getParameter("pass");
                String UserID = request.getSession().getAttribute("UserID").toString(); 
                     
          String update1="UPDATE user "
                   + "SET "
                   + "displayname ='"+displayname+"'"
                   + "where UserID ='"+UserID+"' ";        
          pstatement1 = Con.prepareStatement(update1);       
          updateQuery = pstatement1.executeUpdate();
    
           String update2="UPDATE user "
                   + "SET "
                   + "password ='"+pass+"'"                  
                   + "where UserID ='"+UserID+"' ";        
          pstatement2 = Con.prepareStatement(update2); 
          updateQuery = pstatement2.executeUpdate(); 
                
            String update3="UPDATE user "
                   + "SET "
                    + "email ='"+email+"'"
                   + "where UserID ='"+UserID+"' ";        
          pstatement3 = Con.prepareStatement(update3);       
          updateQuery = pstatement3.executeUpdate();
          
           String update4="UPDATE user "
                   + "SET "
                     + "phone ='"+number+"'"
                   + "where UserID ='"+UserID+"' ";        
          pstatement4 = Con.prepareStatement(update4);       
          updateQuery = pstatement4.executeUpdate();
          
           Stmt.close();
           Con.close();
            response.sendRedirect("customerhome.html"); 

        }catch (ClassNotFoundException | NumberFormatException | SQLException ex) {
                ex.printStackTrace();
        
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
