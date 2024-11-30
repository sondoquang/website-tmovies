package controllers;


import daoimples.FavouriteDAOImple;
import daoimples.VideoDAOImple;
import daos.FavouriteDAO;
import daos.VideoDAO;
import entities.Favourite;
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

@WebServlet({
        "/home/index/*",
        })
public class HomeController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        VideoDAO vdao = new VideoDAOImple();
        FavouriteDAO fdao = new FavouriteDAOImple();
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user")==null?null:(User) session.getAttribute("user");
        List<Video> list01 = null;
        List<Video> list02 = null;
        List<Video> listTopFavourite = fdao.getTop10VideosFavourite(10);
        int page1Active = 1;
        int page2Active = 1;
        if (path.contains("index")){
            int pageNo1 = request.getParameter("page1")!=null?Integer.parseInt(request.getParameter("page1")):1;
            int pageNo2 = request.getParameter("page2")!=null?Integer.parseInt(request.getParameter("page2")):1;
            page1Active = pageNo1;
            page2Active = pageNo2;
            request.setAttribute("list01", vdao.findAll((pageNo1-1)*16,16));
            request.setAttribute("list02", vdao.findAll((pageNo2-1)*16,16));
        }

        /*Đếm sum count trong table video và phân trang*/
        long sumCountVideo = vdao.selectSumCountVideo();
        int sumPage;
        if (sumCountVideo%10 == 0){
            sumPage =(int) sumCountVideo/10;
        }else{
            sumPage =(int) sumCountVideo/10+1;
        }
        request.setAttribute("page1Active", page1Active);
        request.setAttribute("page2Active", page2Active);
        request.setAttribute("sumPage",sumPage);
        request.setAttribute("listTopFavourite",listTopFavourite);
        request.getRequestDispatcher("/views/HomePage.jsp").forward(request, response);
    }
}
