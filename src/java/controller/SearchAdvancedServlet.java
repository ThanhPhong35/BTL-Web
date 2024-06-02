/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author YOU
 */
@WebServlet(name="SearchAdvancedServlet", urlPatterns={"/search"})
public class SearchAdvancedServlet extends HttpServlet {
   
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
            out.println("<title>Servlet searchAdvancedServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchAdvancedServlet at " + request.getContextPath () + "</h1>");
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
        String[] pp={"Dưới 100 nghìn", 
            "Từ 100-200 nghìn",
            "Từ 200-300 nghìn",
            "Từ 300-400 nghìn",
            "Từ 400-500 nghìn",
            "Trên 500 nghìn"};
        boolean[] pb = new boolean[pp.length+1];
        
        CategoryDAO dao = new CategoryDAO();
        List <Category> categories = dao.getAllCatagory();
        boolean[] chid = new boolean[categories.size()+1];
        
        ProductDAO d = new ProductDAO();
        List<Product> products = new ArrayList<>();
        String[] cidd_raw = request.getParameterValues("cidd");
        String[] price = request.getParameterValues("price");
        int[] cidd = null;
        
        if(cidd_raw != null){
            cidd = new int[cidd_raw.length];
            for(int i=0; i<cidd.length; i++){
                cidd[i] = Integer.parseInt(cidd_raw[i]);
            }
            if(cidd[0]==0){
                chid[0]=true;
                products=d.getAllProduct();
            }
            else{
                products = d.searchByCheckCate(cidd);
            }
        }
        if(price != null){
            double from = 0, to = 0;
            for (int i=0; i<price.length; i++){
                List<Product> temp = new ArrayList<>();
                if(price[i].equals("0")){
                    from=0;
                    to=100000;
                    products=d.getProductByPrice(from, to);
                    pb[0]=true;
                    break;
                }
                else{
                    if(price[i].equals("1")){
                        from =0;
                        to = 100-0.000005;
                        temp =d.getProductByPrice(from, to);
                        products.addAll(temp);
                        pb[1]=true;
                    }
                    if(price[i].equals("2")){
                        from =100;
                        to = 200-0.00005;
                        temp =d.getProductByPrice(from, to);
                        pb[2]=true;
                        products.addAll(temp);
                    }
                    if(price[i].equals("3")){
                        from =200;
                        to = 300-0.000005;
                        temp =d.getProductByPrice(from, to);
                        products.addAll(temp);
                        pb[3]=true;
                    }
                    if(price[i].equals("4")){
                        from =300;
                        to = 400-0.000005;
                        temp =d.getProductByPrice(from, to);
                        products.addAll(temp);
                        pb[4]=true;
                    }
                    if(price[i].equals("5")){
                        from =400;
                        to = 500-0.00005;
                        temp =d.getProductByPrice(from, to);
                        products.addAll(temp);
                        pb[5]=true;
                    }
                    if(price[i].equals("6")){
                        from =500;
                        to = 100000;
                        temp =d.getProductByPrice(from, to);
                        products.addAll(temp);
                        pb[6]=true;
                    }
                }
            }
        }
        if((cidd_raw != null) && (cidd[0] != 0)){
            chid[0]=false;
            for(int i=1; i<chid.length; i++){
                if(ischeck(categories.get(i-1).getCid(), cidd)){
                    chid[i]=true;
                }
                else{
                    chid[i]= false;
                }
                
            }
        }
        request.setAttribute("listC", categories);
        request.setAttribute("listP", products);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.setAttribute("chid", chid);
        request.getRequestDispatcher("searchProduct.jsp").forward(request, response);
    } 
    //kiểm tra xem có chọn checkbox không
    private boolean ischeck(int d, int [] id){
        if(id == null){
            return false;
        }
        else{
            for(int i=0; i<id.length; i++){
                if(id[i] == d){
                    return true;
                }
            }
            return false;
        }
             
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
