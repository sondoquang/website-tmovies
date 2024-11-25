package filter;


import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter({"/account/*"})
public class FilterAccount extends HttpFilter implements Filter {
       

	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (request.getSession().getAttribute("user") == null) {
			request.getSession().setAttribute("sercureUri", request.getRequestURI());
			response.sendRedirect("/WebsiteTMovies/login");
			return;
		}
		chain.doFilter(request, response);
	}
}
