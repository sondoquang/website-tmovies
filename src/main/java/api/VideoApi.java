
package api;

import com.fasterxml.jackson.databind.ObjectMapper;
import daoimples.FavouriteDAOImple;
import daoimples.VideoDAOImple;
import daos.FavouriteDAO;
import daos.VideoDAO;
import entities.Favourite;
import entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.XJsonIO;

import java.io.IOException;

/**
 *
 * @author acer
 */
@WebServlet({"/api/videos/like/*"})
public class VideoApi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = XJsonIO.readObject(request, Integer.class);
        System.out.println(id);
        VideoDAO vdao = new VideoDAOImple();
        FavouriteDAO fdao = new FavouriteDAOImple();
        User user = (User) request.getSession().getAttribute("user");
        Favourite favourite = new Favourite();
        favourite.setUser(user);
        favourite.setVideo(vdao.findById(id));
        if(fdao.updateLikeVideoFavourite(favourite) != -1){
            XJsonIO.writeObject(response, new Favourite());
        };
    }
}
