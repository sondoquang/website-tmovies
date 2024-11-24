package daos;

import entities.Share;
import entities.Video;
import java.util.List;

public interface ShareDAO extends DAOs<Share, Integer> {
    List<Video> getVideosShareByYear(int year);
}
