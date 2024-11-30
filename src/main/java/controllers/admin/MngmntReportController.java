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

@WebServlet({"/admin/mngmt/reports/index/*",
            "/admin/mngmt/reports/favouritesUser",
            "/admin/mngmt/reports/favouritesShare",
            })
public class MngmntReportController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReportDAO dao = new ReportDAOImple();
        String path = request.getServletPath();
        int pageNo = request.getParameter("pageNo")!=null?Integer.parseInt(request.getParameter("pageNo")):1;
        List<Object[]> list = dao.SelectVideoFavoritesByMaxMinDate((pageNo-1)*15,15);
        int sumPage = Integer.parseInt(dao.selectCountVideoFavoritesByMaxMinDate()+"");
        int tabActive = 0;

        /* Xử lý link favouritesUser */
        if(path.contains("favouritesUser")){
            pageNo = request.getParameter("pageNo")!=null?Integer.parseInt(request.getParameter("pageNo")):1;
            tabActive = 1;
            String title = request.getParameter("title");
            title = title==null?"":title;
            list = dao.selectUserLikeVideoByTitle(15*(pageNo-1),15,title);
            sumPage = Integer.parseInt(dao.selectCountUserLikeVideoByTitle(title)+"");
        }else if(path.contains("favouritesShare")){
            pageNo = request.getParameter("pageNo")!=null?Integer.parseInt(request.getParameter("pageNo")):1;
            tabActive = 2;
            String title = request.getParameter("search");
            title = title==null?"":title;
            list = dao.selectUserShareVideoByTitle((pageNo-1)*15,15,title);
        }

        /*Đếm sum count và phân trang*/
        if (sumPage%15 == 0){
            sumPage = sumPage/15;
        }else{
            sumPage = sumPage/15+1;
        }
        System.out.println(pageNo);
        request.setAttribute("pageNo",pageNo);
        request.setAttribute("sumPage",sumPage);
        request.setAttribute("tabActive", tabActive);
        request.setAttribute("list", list);
        request.getRequestDispatcher( "/views/assets/views/AdminReportPage.jsp").forward(request, response);
    }
}
