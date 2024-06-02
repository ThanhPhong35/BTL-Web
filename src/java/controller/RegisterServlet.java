/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AccountDAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.sound.midi.Sequence;
import util.Email;

/**
 *
 * @author YOU
 */
@WebServlet(name="RegisterServlet", urlPatterns={"/register"})
public class RegisterServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
         request.getRequestDispatcher("register.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String confirmPass = request.getParameter("confirmPassword");
        String error="";
        AccountDAO dao = new AccountDAO();
        if(user!="" && email!="" && password!="" && confirmPass!=""){
            boolean isCheckuser = dao.checkUsernameExist(user);
            boolean isCheckemail = dao.checkEmailExist(email);
            boolean isSucess = false;
            if( isCheckuser || isCheckemail){
                isSucess = false;
                String str="";
                if(isCheckemail && isCheckuser){
                    str ="Tên đăng nhập và Email";
                }
                else if(isCheckuser){
                    str="Tên đăng nhập";
                }
                else if(isCheckemail) str="Email";
                
                error = str+" đã tồn tại";
                request.setAttribute("notice", error);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            else{
                Email sm = new Email();
                //get the 6-digit code
                String code = sm.getRandom();
                Account a = new Account(user, email, password, 0, code, 2);
                
                boolean test = sm.sendEmail(a);
                if (test) {
                    // tạo session
                    HttpSession session = request.getSession();
                    session.setAttribute("account", a);
                    response.sendRedirect("verifycode");
                    // Forward to a page where the user can enter the verification code
//                    request.getRequestDispatcher("verify.jsp").forward(request, response);
                } else{
                    // Handle the case where the email sending fails
                    request.setAttribute("notice", "Gửi mã xác nhận thất bại");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
        }
        }
    }
        

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
