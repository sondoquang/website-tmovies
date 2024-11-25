package controllers.admin;

import daoimples.ReportDAOImple;
import daoimples.VideoDAOImple;
import daos.ReportDAO;
import daos.VideoDAO;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/mngmt/reports/index",
            "/admin/mngmt/reports/favouritesSingle",
            "/admin/mngmt/reports/favouritesUser",
            "/admin/mngmt/reports/favouritesShare",
            })
public class MngmntReportController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReportDAO dao = new ReportDAOImple();
        String path = request.getServletPath();
        List<Object[]> list = null;
        int tabActive = 0;
        if(path.contains("favouritesSingle")){
            list = dao.SelectVideoFavoritesByMaxMinDate();
        }else if(path.contains("favouritesUser")){
            tabActive = 1;
            String title = request.getParameter("title");
            title = title==null?"":title;
            list = dao.selectUserLikeVideoByTitle(title);
        }else if(path.contains("favouritesShare")){
            tabActive = 2;
            String title = request.getParameter("search");
            title = title==null?"":title;
            VideoDAO vdao = new VideoDAOImple();
            list = vdao.FindVideosByTitle(title);
        }

        request.setAttribute("tabActive", tabActive);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/views/assets/views/AdminReportPage.jsp").forward(request, response);
    }
}
