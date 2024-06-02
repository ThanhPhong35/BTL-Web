/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.GooglePojo;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.GoogleUtils;

/**
 *
 * @author YOU
 */
@WebServlet(name="LoginGoogle", urlPatterns={"/login-google"})
public class LoginGoogle extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public LoginGoogle() {
    super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String code = request.getParameter("code");
    if (code == null || code.isEmpty()) {
        RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
        dis.forward(request, response);
    } else {
        String accessToken = GoogleUtils.getToken(code);
        GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
        request.setAttribute("id", googlePojo.getId());
        request.setAttribute("name", googlePojo.getName());
        request.setAttribute("email", googlePojo.getEmail());
        RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
        dis.forward(request, response);
      }
    }
    @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}