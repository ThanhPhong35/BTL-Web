

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
import java.util.List;
import javax.sound.midi.Sequence;

@WebServlet(name="SearchProductServlet", urlPatterns={"/searchproduct"})
public class SearchProductServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        CategoryDAO c= new CategoryDAO();
        List<Category> listC = c.getAllCatagory();
        boolean[] chid = new boolean[listC.size()+1];

        
        String[] pp={"Dưới 100 nghìn", 
            "Từ 100-200 nghìn",
            "Từ 200-300 nghìn",
            "Từ 300-400 nghìn",
            "Từ 400-500 nghìn",
            "Trên 500 nghìn"};
        boolean[] pb = new boolean[pp.length+1];

        
        String nameSearch = request.getParameter("product");
        ProductDAO dao = new ProductDAO();
        List<Product> listP= dao.getProuctByName(nameSearch);
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.setAttribute("cid", 0);
        request.setAttribute("chid", chid);
        
        request.getRequestDispatcher("searchProduct.jsp").forward(request, response);
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
