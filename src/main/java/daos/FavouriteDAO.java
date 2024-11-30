package daos;

import entities.Favourite;
import entities.Video;

import java.util.List;

public interface FavouriteDAO extends DAOs<Favourite, Integer> {
    List<Object[]> getVideoFavourites();
    List<Video> getTop10VideosFavourite(int limit);   
    List<Video> getVideosNotFavourite();
    List<Video> getVideoFavouritesByUser(int idUser);
    Long updateLikeVideoFavourite(Favourite favourite);
}
