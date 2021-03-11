
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.stream.Collectors;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/register_DB"})
public class register_DB extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param len
     * @param randNumOrigin
     * @param randNumBound
     * @return
     */
    public static String generateRandomPassword(int len, int randNumOrigin, int randNumBound) {
        SecureRandom random = new SecureRandom();
        return random.ints(len, randNumOrigin, randNumBound + 1)
                .mapToObj(i -> String.valueOf((char) i))
                .collect(Collectors.joining());
    }
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
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                String username = request.getParameter("username");
                String displayname = request.getParameter("displayname");
                String email = request.getParameter("email");
                String number = request.getParameter("number");
                String role = request.getParameter("role");
                int len = 10;
                int randNumOrigin = 97, randNumBound = 122;
                String pass = generateRandomPassword(len, randNumOrigin, randNumBound);
                String line = "INSERT INTO user(username ,displayname ,password , email , phone , role)"
                        + "VALUES("
                        + "'" + username + "',"
                        + "'" + displayname + "',"
                        + "'" + pass + "',"
                        + "'" + email + "',"
                        + "'" + number + "',"
                        + "'" + role + "')";
                Stmt.executeUpdate(line);
                String mypage = "";
                RS = Stmt.executeQuery("SELECT * FROM user" + " WHERE username ='" + username + "';");
                while (RS.next()) {
                    String id = RS.getString("UserID");
                    String myrole = RS.getString("role");
                    //Session
                    HttpSession s = request.getSession(true);
                    s.setAttribute("UserID", id);
                    
                    if(myrole.equals("admin"))
                    {
                         mypage = "adminhome.html";
                    }
                    else if(myrole.equals("client"))
                    {
                         mypage = "customerhome.jsp";
                    }                   
                }
                RS.close();
                Stmt.close();
                Con.close();
                response.sendRedirect(mypage);
            } catch (IOException | ClassNotFoundException | SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    public void Send_Mail(String email , String password , String username )
    {
             String USER_NAME = "webp9505@gmail.com";  
             String PASSWORD = "webproject12345"; 
             String RECIPIENT = email;
             
        String from = USER_NAME;
        String pass = PASSWORD;
        String[] to = { RECIPIENT }; 
        String subject = "Here are your confirm password";
        String body = "welcome "+ username +" your password is : " + password;

        sendFromGMail(from, pass, to, subject, body);
    }
    private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for (InternetAddress toAddres : toAddress) {
                message.addRecipient(Message.RecipientType.TO, toAddres);
            }

            message.setSubject(subject);
            message.setText(body);
            try (Transport transport = session.getTransport("smtp")) {
                transport.connect(host, from, pass);
                transport.sendMessage(message, message.getAllRecipients());
            }
        }
        catch (AddressException e1) {
            e1.getStackTrace();
        }
        catch (MessagingException e2) {
            e2.getStackTrace();
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
