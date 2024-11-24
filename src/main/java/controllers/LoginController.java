
package controllers;

import java.io.IOException;
import java.util.Base64;

import daoimples.UserDAOImple;
import daos.UserDAO;
import entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
@WebServlet({"/login"})
public class LoginController extends HttpServlet {
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
        request.getRequestDispatcher("/layout/Login.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("rememberMe");
        UserDAO dao = new UserDAOImple();
        User user = dao.findByIdOrEmail(username.trim());
        HttpSession session = request.getSession();
        String sercureUri = (String)session.getAttribute("sercureUri");
        if(user != null) {
            if(password.equals(user.getPassword())) {
                if(remember != null) {
                    byte[] bytes = (username+","+password).getBytes();
                    String userInfo =Base64.getEncoder().encodeToString(bytes);
                    Cookie cookie = new Cookie("user", userInfo);
                    cookie.setMaxAge(30*24*60*60); // hiệu lực 30 ngày
                    cookie.setPath("/"); // hiệu lực toàn ứng dụng
                    // Gửi v�? trình duyệt
                    response.addCookie(cookie); // cookie
                }else {
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("user")) {
                                cookie.setValue("");
                                cookie.setMaxAge(0);
                                cookie.setPath("/");
                                response.addCookie(cookie);
                                break;
                            }
                        }
                    }
                }
                request.getSession().setAttribute("user",user);
                request.getSession().setAttribute("error",null);
                if(user.getAdmin()){
                    response.sendRedirect("/WebsiteTMovies/admin/home");
                }else
                    response.sendRedirect(sercureUri);
            } else {
                response.sendRedirect(sercureUri);
            }
        }else {
            response.sendRedirect(sercureUri);
        }
    }
}
