package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet({"/admin/home",
            "/admin/videos",
            "/admin/users",
            "/admin/reports"
            })
public class Admincontroller extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String path = request.getServletPath();
        if (path.contains("home")) {
            session.setAttribute("menuActive",1);
            response.sendRedirect("/WebsiteTMovies/mngmt/home/index");
        }
        else if(path.contains("videos")) {
            session.setAttribute("menuActive", 2);
            response.sendRedirect("/WebsiteTMovies/mngmt/videos/index");
        }
        else if(path.contains("users")){
            session.setAttribute("menuActive",3);
            response.sendRedirect("/WebsiteTMovies/user/index");
        }
        else if(path.contains("reports")){
            session.setAttribute("menuActive",4);
            response.sendRedirect("/WebsiteTMovies/mngmt/reports/index");
        }
    }
}
