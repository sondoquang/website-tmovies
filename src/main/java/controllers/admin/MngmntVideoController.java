package controllers.admin;

import daoimples.UserDAOImple;
import daoimples.VideoDAOImple;
import daos.UserDAO;
import daos.VideoDAO;
import entities.User;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.apache.commons.beanutils.BeanUtils;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

@WebServlet({"/admin/mngmt/videos/index",
            "/admin/mngmt/videos/create",
            "/admin/mngmt/videos/update/*",
            "/admin/mngmt/videos/delete",
            "/admin/mngmt/videos/edit/*",
            "/admin/mngmt/videos/upload",
            })
public class MngmntVideoController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Dùng để đưa biến lên phạm vi session và lấy thuộc tính của nó //
        HttpSession session = request.getSession();
        String path = request.getServletPath();
        VideoDAO dao = new VideoDAOImple();
        List<Video> list = dao.findAll();
        Video video = new Video();
        boolean tabActive = false;
        try {
            BeanUtils.populate(video, request.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        if (path.contains("index")){
            list = dao.findAll();
        }else if(path.contains("edit")){
            Integer id = Integer.parseInt(request.getPathInfo().substring(1));
            request.setAttribute("video",dao.findById(id));
        }
        request.setAttribute("list", list);
        request.getRequestDispatcher("/views/assets/views/AdminVideoPage.jsp").forward(request, response);
    }

    private void upload(HttpServletRequest request, Part part, String folder) {
        String path = request.getServletContext().getRealPath("images");
        File dir = new File(path);
        if (!dir.exists()) dir.mkdir();
        try {
            part.write(path + "/" + part.getSubmittedFileName());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
