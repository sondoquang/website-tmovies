package daoimples;

import daos.ReportDAO;
import utils.XJpa;
import java.util.HashMap;
import java.util.List;

public class ReportDAOImple implements ReportDAO {

    /*Select tất cả các video được yêu thích: titleVideo, countFavourite,Ngày thích gần nhất
    * Ngày thích xa nhất*/
    @Override
    public List<Object[]> SelectVideoFavoritesByMaxMinDate(){
        String jpql = "SELECT f.video.title, COUNT(f.id),MAX(f.likeDate), MIN(f.likeDate) FROM Favourite f GROUP BY f.video.title ORDER BY COUNT(f.id) DESC";
        return XJpa.getResultList(Object[].class,jpql,new HashMap<>());
    }

    /*Select tất cả video được yêu thích*/
    @Override
    public List<Object[]> SelectVideoFavorites(String fullname){
        String jpql = "SELECT DISTINCT f.video.title,f.user.fullname,f.likeDate FROM Favourite f WHERE f.user.fullname like ?1 ";
        Object[] value = {"%"+fullname+"%"};
        return XJpa.getResultList(Object[].class,jpql,new HashMap<>(),value);
    }

    /*Select tất cả video được yêu thích nhóm theo số lượng*/
    @Override
    public List<Object[]> SelectVideoFavoritesGroupBy(){
        String jpql = "SELECT DISTINCT f.video.title, f.user.fullname FROM Favourite f group by f.video.title,f.user.fullname ";
        return XJpa.getResultList(Object[].class,jpql,new HashMap<>());
    }

    /*Select tất cả các user thích video tham số*/
    @Override
    public List<Object[]> selectUserLikeVideoByTitle(String title){
        String jpql = "SELECT f.user.id, f.user.fullname, f.user.email, f.likeDate FROM Favourite f WHERE f.video.title LIKE ?1";
        Object [] value = {"%"+title+"%"};
        return XJpa.getResultList(Object[].class,jpql,new HashMap<>(),value);
    }

    /*Select tất cả các lượt share bao gồm thông tin: Fullname người share, Email người share
    * Share đến email nào và ngày share lọc theo tên video */
    @Override
    public List<Object[]> selectUserShareVideoByTitle(String title){
        String jpql = "SELECT s.user.id, s.user.fullname, s.user.email, s.shareDate FROM Share s WHERE s.video.title LIKE ?1";
        Object [] value = {"%"+title+"%"};
        return XJpa.getResultList(Object[].class,jpql,new HashMap<>(),value);
    }

    public static void main(String[] args) {
        ReportDAOImple dao = new ReportDAOImple();
        List <Object[]> list = dao.SelectVideoFavoritesByMaxMinDate();
        list.forEach(v -> System.out.println(v[0]));
    }
}
