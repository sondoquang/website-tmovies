package controllers;


import daoimples.FavouriteDAOImple;
import daoimples.VideoDAOImple;
import daos.FavouriteDAO;
import daos.VideoDAO;
import entities.User;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet({"/homepage/index",
            "/homepage/detail/*",
            "/homepage/useraccount"})
public class HomeController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        VideoDAO vdao = new VideoDAOImple();
        FavouriteDAO fdao = new FavouriteDAOImple();
        HttpSession session = request.getSession();
        String message="";
        List<Video> list = null;
        List<Video> listTopFavourite = fdao.getTop10VideosFavourite(10);
        if (path.contains("/homepage/index")){
            list = vdao.findAll();
        }

        /*Chuyển trang detail*/
        else if(path.contains("detail")){
            int id = Integer.parseInt(request.getPathInfo().substring(1));
            Video video = vdao.findById(id);
            request.setAttribute("video", video);
            request.setAttribute("listTop10Videos", listTopFavourite);
            request.getRequestDispatcher("/views/assets/views/DetailProduct.jsp").forward(request, response);
            return;
        }
        
        //Chuyển đến trang userAccount //
        else if(path.contains("useraccount")){
            User user = (User) session.getAttribute("user");
            request.setAttribute("videoFavourites",fdao.getVideoFavouritesByUser(user.getId()));
            request.setAttribute("listTop10Videos", listTopFavourite);
            request.getRequestDispatcher("/views/assets/views/UserAccountPage.jsp").forward(request, response);
            return;
        }
        
        if(list == null){
            list = vdao.findAll();
        }

        request.setAttribute("list",list);
        request.setAttribute("listTop10Videos", listTopFavourite);
        request.setAttribute("message", message);
        request.getRequestDispatcher("/views/HomePage.jsp").forward(request, response);
    }
}
