package daoimples;

import daos.VideoDAO;
import entities.Video;
import jakarta.persistence.EntityManager;
import java.util.HashMap;
import utils.XJpa;

import java.util.List;

public class VideoDAOImple implements VideoDAO {
    EntityManager em = XJpa.getEntityManager();
    @Override
    public List<Video> findAll() {
        String jpql = "SELECT v FROM Video v";
        return XJpa.getResultList(Video.class, jpql,new HashMap<>());
    }

    @Override
    public Video findById(Integer id) {
        return em.find(Video.class, id);
    }

    @Override
    public Video create(Video item) {
        return XJpa.excuteUpdate(item,1);
    }

    
    /*Cập nhật video là tham số*/
    @Override
    public Video update(Video item) {
        return XJpa.excuteUpdate(item,0);
    }
    
    /* Xóa video có id là tham số truyền vào*/
    @Override
    public Video deleteById(Integer id) {
        return XJpa.excuteDUpdate(id,Video.class);
    }

    /*=== Tìm tất cả các video có title là tham số ======*/
    @Override
    public List<Object[]> FindVideosByTitle(String title) {
        String jqpl = "SELECT v.title,COUNT(f.id),v.active FROM Video v LEFT JOIN Favourite f ON f.video = v WHERE v.title like ?1 GROUP BY v.id, v.title, v.active ORDER BY COUNT(f.id) DESC";
        Object[] value ={"%"+title+"%"};
        return XJpa.getResultList(Object[].class, jqpl, new HashMap<>(), value);
    }
    
    /*Đã test hết tất cả các dao phía trên ngày 6/11/2024 (--> Không cần test lại các hàm này nữa <--)*/

	
	
	public static void main(String[] args) {
        VideoDAO dao = new VideoDAOImple();
        List<Video> videos = dao.getTopVideoActive(1);
        videos.forEach(v ->{
            System.out.println(v.getTitle());
        });
    }

    @Override
    public List<Video> getTopVideoActive(int top) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
