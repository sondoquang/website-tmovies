package controllers;


import daoimples.FavouriteDAOImple;
import daoimples.UserDAOImple;
import daoimples.VideoDAOImple;
import daos.FavouriteDAO;
import daos.UserDAO;
import daos.VideoDAO;
import entities.User;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;
import utils.XValidate;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

@WebServlet({"/account",
            "/update-profile",
            "/change-pass"
        })
public class UserAccountController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        FavouriteDAO fdao = new FavouriteDAOImple();
        UserDAO dao = new UserDAOImple();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String error = "";
        List<Video> listFavouriteUser = fdao.getVideoFavouritesByUser(user.getId());
        List<Video> listTopFavourite = fdao.getTop10VideosFavourite(10);
        //Chuyển đến trang userAccount //

        if(path.contains("account")){
            request.setAttribute("videoFavourites",fdao.getVideoFavouritesByUser(user.getId()));
        }else if(path.contains("update-profile")){
            // Lấy thông tin chuẩn bị cập nhật //
            User usr = new User();
            try {
                BeanUtils.populate(usr, request.getParameterMap());
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
            switch (validateUser(usr)){
                case -1:error = "Email không đúng định dạng !";
                    break;
                case -2:error = "Email đã tồn tại !";
                    break;
            }
            if (!error.equals("")){
                request.setAttribute("error", error);
            }else{
                usr.setId(user.getId());
                dao.update(usr);
                request.getSession().setAttribute("user", usr);
            }
        }else if(path.contains("change-pass")){
            String newPass = request.getParameter("newpass");
            user.setPassword(newPass);
            dao.update(user);
            request.getSession().setAttribute("user", user);
        }

        request.setAttribute("list",listFavouriteUser);
        request.setAttribute("listTop10Videos", listTopFavourite);
        request.getRequestDispatcher("/views/assets/views/UserAccountPage.jsp").forward(request, response);
    }

    private int validateUser(User user){
        UserDAO dao = new UserDAOImple();
        if (!XValidate.email(user.getEmail()))
            return -1;
        if (dao.findValidEmail(user) != null)
            return -2;
        return 1;
    }
}
