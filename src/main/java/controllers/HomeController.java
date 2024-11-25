package controllers;


import daoimples.FavouriteDAOImple;
import daoimples.VideoDAOImple;
import daos.FavouriteDAO;
import daos.VideoDAO;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({
        "/home/index",
        })
public class HomeController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        VideoDAO vdao = new VideoDAOImple();
        FavouriteDAO fdao = new FavouriteDAOImple();
//        HttpSession session = request.getSession();
        List<Video> list = null;
//        List<Video> listTopFavourite = fdao.getTop10VideosFavourite(10);
        list = vdao.findAll();
        request.setAttribute("list",list);
        request.getRequestDispatcher("/views/HomePage.jsp").forward(request, response);
    }
}
