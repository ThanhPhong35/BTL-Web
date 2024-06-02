/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

/**
 *
 * @author YOU
 */
@MultipartConfig()
@WebServlet(name="UpdateProduct", urlPatterns={"/update-product"})
public class UpdateProduct extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProduct at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String id = request.getParameter("id");
        ProductDAO dao = new ProductDAO();
        Product pd = dao.getProductByID(id);
        request.setAttribute("pd", pd);
        
        CategoryDAO d = new CategoryDAO();
        List<Category> listC = d.getAllCatagory();
        request.setAttribute("listC", listC);
        
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
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
        //processRequest(request, response);
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String title = request.getParameter("title");
        String des = request.getParameter("des");
        String cid = request.getParameter("cid");
        String image = request.getParameter("img");
        
        try {
            Part part = request.getPart("image");
        
            String realPath = request.getServletContext().getRealPath("/image");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();

            if(!Files.exists(Path.of(realPath))){
                Files.createDirectory(Path.of(realPath));
            }
            String path = realPath+"/"+ filename;
            part.write(path);
            image = "image/" + filename;
        } catch (Exception e) {
        }
        
        ProductDAO dao = new ProductDAO();
        dao.updateProduct(id, name, image, price, title, des, cid);
        response.sendRedirect("product-managerment");
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
