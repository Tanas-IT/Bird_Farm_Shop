package birdfarm.controller.manager;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author HP
 */
@WebServlet(name = "ManagerSendMailTrackingBirdServlet", urlPatterns = {"/ManagerSendMailTrackingBirdServlet"})
@MultipartConfig
public class ManagerSendMailTrackingBirdServlet extends HttpServlet {

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
            out.println("<title>Servlet SendMail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMail at " + request.getContextPath() + "</h1>");
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
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.getRequestDispatcher("DispatchServlet?btAction=ViewUpdateProduct&txtIdBird=" +idRequiredOrder).forward(request, response);
//    }

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
        request.setCharacterEncoding("UTF-8");
        final String from = "birdfarmshop581@gmail.com";
        final String pass = "tvjqdblqqvccbwcs";

        String idRequiredOrder = request.getParameter("txtidRequiredOrder");
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String mes = request.getParameter("message");
        //////
        Part filePart = request.getPart("file");
        String fileName = getFileName(filePart);

        String filePath = getServletContext().getRealPath("") + File.separator + fileName;
        File file = new File(filePath);
        filePart.write(filePath);

        //////
        Properties properties = new Properties();

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        };
        Session session = Session.getInstance(properties, auth);

        try {
            MimeMessage msg = new MimeMessage(session);
            //set message headers
            msg.setHeader("Content-Transfer-Encoding", "quoted-printable");
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress(from, "birdfarmshop581@gmail.com", "UTF-8"));

            msg.setReplyTo(InternetAddress.parse(from, false));

            msg.setSubject(subject, "UTF-8");

            msg.setText(mes, "UTF-8");

            // Tạo MimeBodyPart cho nội dung message
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText(mes, "UTF-8");

            // Tạo MimeBodyPart cho tệp tin đính kèm
            MimeBodyPart fileBodyPart = new MimeBodyPart();
            fileBodyPart.setDataHandler(new DataHandler(new FileDataSource(file)));
            fileBodyPart.setFileName(file.getName());

            // Tạo Multipart và thêm các phần tử vào
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);
            multipart.addBodyPart(fileBodyPart);

            msg.setContent(multipart);
            msg.setSentDate(new Date());
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            Transport.send(msg);
        } catch (Exception e) {
        }
        request.getRequestDispatcher("DispatchServlet?btAction=DetailTrackingBird&txtidRequiredOrder=" +idRequiredOrder).forward(request, response);
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
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
