
package controllers;

import daoimples.FavouriteDAOImple;
import daoimples.ShareDAOImple;
import daoimples.VideoDAOImple;
import daos.FavouriteDAO;
import daos.ShareDAO;
import daos.VideoDAO;
import entities.Favourite;
import entities.Share;
import entities.User;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 *
 * @author acer
 */
@WebServlet({"/videos/like/*",
            "/videos/share/*",
            "/videos/detail/*"
            })
public class VideoController extends HttpServlet {
    FavouriteDAO fdao = new FavouriteDAOImple();
    ShareDAO  sdao = new ShareDAOImple();
    VideoDAO dao = new VideoDAOImple();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        VideoDAO dao = new VideoDAOImple();
        /*== Xử lý cho video detail ==*/
        if (path.contains("detail")){
            System.out.println("detail chay");
            Integer id = Integer.parseInt(request.getPathInfo().substring(1));
            request.setAttribute("video",dao.findById(id));
            request.setAttribute("videofavourite",fdao.getTop10VideosFavourite(10));
            request.getRequestDispatcher("/views/assets/views/DetailProduct.jsp").forward(request, response);
            System.out.println("detail end");
        }


        /*== Xử lý sự kiện like video ==*/
        else if (path.contains("like")){
            if (fdao.create(getEntityFavourite(request)) == null){
                request.setAttribute("message","Thao tác không thành công !!");
            }else{
                request.setAttribute("message","Thao tác thành công !!");
            }
            String sercureUri =(String)request.getSession().getAttribute("sercureUri");
            response.sendRedirect(sercureUri);
        }

        /*== Xử lý sự kiện share video ==*/
        else if (path.contains("share")){
            if (sdao.create(getEntityShare(request)) == null){
                request.setAttribute("message","Thao tác không thành công !!");
            }else{
                request.setAttribute("message","Thao tác thành công !!");
            }
            request.getRequestDispatcher((String)request.getSession().getAttribute("sercureUri")).forward(request, response);
        }
    }


    /* Hàm lấy ra thông tin video được yêu thích và tạo một Entity Favourite */
    private Favourite getEntityFavourite(HttpServletRequest request){
        Integer id = Integer.parseInt(request.getPathInfo().substring(1));
        User user = (User) request.getSession().getAttribute("user");
        Video video = dao.findById(id);
        return new Favourite(user,video,new Date());
    }


    /* Hàm lấy ra thông tin video được share và tạo một Entity Share */
    private Share getEntityShare(HttpServletRequest request){
        Integer id = Integer.parseInt(request.getPathInfo().substring(1));
        User user = (User) request.getSession().getAttribute("user");
        Video video = dao.findById(id);
        return new Share(user,video,user.getEmail(),new Date());
    }
}
