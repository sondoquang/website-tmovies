package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import daos.LogDAO;
import daoimples.LogDAOImpl;
import entities.Log;
import entities.User;

@WebFilter({"/admin/*"})
public class FilterAdmin extends HttpFilter implements Filter {
       
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		LogDAO ldao = new LogDAOImpl();
		User u = (User)request.getSession().getAttribute("user");
		String uri = request.getRequestURI();
		Log log = new Log(uri,new Date(),u.getFullname());
		ldao.create(log);
		chain.doFilter(request, response);
	}
}
