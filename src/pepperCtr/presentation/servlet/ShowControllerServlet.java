package pepperCtr.presentation.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pepperCtr.commons.presentation.util.SessionConstant;

/**
 * Servlet implementation class ShowController
 */
@WebServlet("/pepperCtr/controller")
public class ShowControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String pepperIp = request.getParameter("pepperIp");
		if (pepperIp != null) {
			session.setAttribute(SessionConstant.PEPPER_IP, pepperIp);
		}
		request.setAttribute("controllerMode", "class = active");
		request.getRequestDispatcher("/WEB-INF/jsp/controller.jsp").forward(request, response);
	}
}
