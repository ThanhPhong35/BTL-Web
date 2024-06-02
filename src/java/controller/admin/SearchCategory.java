/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dao.CategoryDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author YOU
 */
@WebServlet(name="SearchCategory", urlPatterns={"/search-category"})
public class SearchCategory extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        CategoryDAO dao = new CategoryDAO();
        List <Category> listC = dao.getCategoryByName(txtSearch);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("categoryManagerment.jsp").forward(request, response);
//        PrintWriter out = response.getWriter();
//        for(Category o: listC){
//            out.println("        <tr>\n" +
//"                                            <td>\n" +
//                                               o.getCid() +
//"                                            </td>\n" +
//"                                            <td>\n" +
//                                               o.getCname()+
//"                                           </td>\n" +
//"                                            <td class=\"picture\">\n" +
//"                                                <img src=\""+o.getCimage()+"\" alt=\"\">\n" +
//"                                            </td>          \n" +
//"                                            <td>\n" +
//"                                                <a href=\"\" onclick=\"openUpdate()\">\n" +
//"                                                    <i class=\"fa-solid fa-pen-to-square\"></i>\n" +
//"                                                </a>\n" +
//"                                                <a href=\"\">\n" +
//"                                                    <i class=\"fa-solid fa-trash\"></i>\n" +
//"                                                </a>\n" +
//"                                            </td>\n" +
//"                                        </tr>"
//            );
//        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
