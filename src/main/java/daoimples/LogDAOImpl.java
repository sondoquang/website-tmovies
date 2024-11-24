package daoimples;

import daos.LogDAO;
import entities.Log;
import jakarta.persistence.EntityManager;
import utils.XJpa;

public class LogDAOImpl implements LogDAO {
	EntityManager em = XJpa.getEntityManager();

	@Override
	public void create(Log item) {
		try {
			em.getTransaction().begin();
			em.persist(item);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
}
