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
 * Servlet implementation class ShowWorkMode
 */
@WebServlet("/pepperCtr/createMode")
public class ShowCreateModeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String pepperIp = (String) session.getAttribute(SessionConstant.PEPPER_IP);
		if (pepperIp != null) {
			session.setAttribute(SessionConstant.PEPPER_IP, pepperIp);
		}
		request.setAttribute("createMode", "class = active");
		request.getRequestDispatcher("/WEB-INF/jsp/createMode.jsp").forward(request, response);
	}
}
