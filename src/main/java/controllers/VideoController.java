
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
import utils.XMailer;
import utils.XValidate;

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
            Integer id = Integer.parseInt(request.getPathInfo().substring(1));
            Video video = dao.findById(id);
            video.setViews(video.getViews() + 1);
            dao.update(video);
            request.setAttribute("video",video);
            request.setAttribute("videofavourite",fdao.getTop10VideosFavourite(10));
            request.getRequestDispatcher("/views/assets/views/DetailProduct.jsp").forward(request, response);
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
            String emailTo = request.getParameter("emailTo");
            if (!XValidate.email(emailTo)){
                request.setAttribute("message","Sự cố share video !");
                response.sendRedirect((String)request.getSession().getAttribute("sercureUri"));
                return;
            }
            try {
                XMailer.send(
                        emailTo,
                        "Share video favourite from website TMovies by SonDoItNow development",
                        "<p>Hello my friend, I have an interesting video from website TMovies and I want to share for my best friend.Please click on the link below to visit. </p><br>" +
                                "<p>https://ddfe-2001-ee0-4f4b-7430-5b5-c455-3196-65f4.ngrok-free.app"+(String)request.getSession().getAttribute("sercureUri")+"</p> <br>" +
                                "Thank you ::)))");
                sdao.create(getEntityShare(request,emailTo));
            }catch (Exception e){
                e.printStackTrace();
            }
            response.sendRedirect((String)request.getSession().getAttribute("sercureUri"));
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
    private Share getEntityShare(HttpServletRequest request, String emailTo){
        Integer id = Integer.parseInt(request.getPathInfo().substring(1));
        User user = (User) request.getSession().getAttribute("user");
        Video video = dao.findById(id);
        return new Share(user,video,emailTo,new Date());
    }

}
