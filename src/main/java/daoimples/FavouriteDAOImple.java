package daoimples;

import daos.FavouriteDAO;
import entities.Favourite;
import entities.Video;
import jakarta.persistence.EntityManager;
import java.util.HashMap;
import java.util.List;
import utils.XJpa;

public class FavouriteDAOImple implements FavouriteDAO {
    EntityManager em = XJpa.getEntityManager();
    @Override
    public List<Favourite> findAll() {
        String jpql = "SELECT f FROM Favourite f";
        return XJpa.getResultList(Favourite.class, jpql,new HashMap<>());
    }

    @Override
    public Favourite findById(Integer id) {
        return em.find(Favourite.class, id);
    }

    @Override
    public Favourite create(Favourite item) {
        return XJpa.excuteUpdate(item, 1);
    }

    @Override
    public Favourite update(Favourite item) {
        return XJpa.excuteUpdate(item, 0);
    }

    @Override
    public Favourite deleteById(Integer id) {
        return XJpa.excuteDUpdate(id,Favourite.class);
    }

    @Override
    public List<Object[]> getVideoFavourites() {
        String jpql = "SELECT f.video.title,f.video.poster FROM Favourite f ";
        return XJpa.getResultList(Object[].class, jpql,new HashMap<>());
    }
    /*Đã test thành công tất cả ngày 09/11/2024 không cần phải test lại lần nào nữa*/
    
    @Override
    public List<Video> getTop10VideosFavourite(int limit) {
        String jpql = "SELECT f.video FROM Favourite f GROUP BY f.video ORDER BY COUNT(f.id) DESC LIMIT ?1";
        Object[] value = {limit};
        return XJpa.getResultList(Video.class, jpql, new HashMap<>(),value);
    }
    
    /*Tìm tất cả các video không được ai yêu thích*/
    @Override
    public List<Video> getVideosNotFavourite(){
        String jpql = "SELECT v FROM Video v WHERE v.favourites is empty";
        return XJpa.getResultList(Video.class, jpql, new HashMap<>());
    }

    @Override
    public List<Video> getVideoFavouritesByUser(int idUser) {
        String jpql = "SELECT f.video FROM Favourite f WHERE f.user.id = ?1";
        Object[] value = {idUser};
        return XJpa.getResultList(Video.class, jpql, new HashMap<>(),value);
    }


}
