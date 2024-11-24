package daos;

import java.util.List;

public interface ReportDAO {
    List<Object[]> SelectVideoFavoritesByMaxMinDate();
    List<Object[]> SelectVideoFavorites(String fullName);
    List<Object[]> SelectVideoFavoritesGroupBy();
    List<Object[]> selectUserLikeVideoByTitle(String title);
    List<Object[]> selectUserShareVideoByTitle(String title);
}
