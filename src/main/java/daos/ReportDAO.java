package daos;

import java.util.List;

public interface ReportDAO {
    List<Object[]> SelectVideoFavoritesByMaxMinDate(int firstResult, int maxResults);
    Long selectCountVideoFavoritesByMaxMinDate();
    List<Object[]> SelectVideoFavorites(int firstResult, int maxResults,String fullName);
    Long selectCountVideoFavorites(String fullName);
    List<Object[]> SelectVideoFavoritesGroupBy(int firstResult, int maxResults);
    Long selectCountVideoFavoritesGroupBy();
    List<Object[]> selectUserLikeVideoByTitle(int firstResult, int maxResults,String title);
    Long selectCountUserLikeVideoByTitle(String title);
    List<Object[]> selectUserShareVideoByTitle(int firstResult, int maxResults,String title);
    Long selectCountUserShareVideoByTitle(String title);
}
