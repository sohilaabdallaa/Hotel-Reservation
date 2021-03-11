
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/validate"})
public class validate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/hotelreservationsystem?useSSL=false";
            String user = "root";
            String password = "root";
            String Line;
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            String Role=" ";
             String userid=" ";
            String username = request.getParameter("Uid");
            String pw = request.getParameter("Pass");

            if (username.isEmpty() || pw.isEmpty()) {

                RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
                dispatcher.forward(request, response);
            } else {

                rs = statement.executeQuery("SELECT * from user");
                boolean flage = false;
                while (rs.next()) {
                    Role = rs.getString("role");
                    userid=rs.getString("UserID");
                    if (rs.getString("username").equals(username) && rs.getString("password").equals(pw)) {
                        flage = true;
                    }
                    
                }

                if (flage) {

                    session.setAttribute("username", username);
                    session.setAttribute("password", pw);
                    
                    session.setAttribute("userid", userid);

                    if (Role.equalsIgnoreCase("admin") )
                    {
                        RequestDispatcher dispatcher = request.getRequestDispatcher("adminhome.html");
                    dispatcher.forward(request, response);
                    
                    }else{
                        RequestDispatcher dispatcher = request.getRequestDispatcher("customerhome.jsp");
                    dispatcher.forward(request, response);
                    }

                } else { 
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
                    dispatcher.forward(request, response);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
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
