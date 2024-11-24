package daos;


import entities.Video;
import java.util.List;

public interface VideoDAO extends DAOs<Video, Integer>{
    List<Object[]> FindVideosByTitle(String title);
    List<Video> getTopVideoActive(int top);
}
