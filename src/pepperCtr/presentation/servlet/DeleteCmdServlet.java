package pepperCtr.presentation.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pepperCtr.commons.presentation.util.JspUrlConstatnt;
import pepperCtr.commons.presentation.util.SessionConstant;

/**
 * Servlet implementation class DeleteCmdServlet
 */
@WebServlet("/pepperCtr/deleteCmd")
public class DeleteCmdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute(SessionConstant.CMD_LIST);
		request.getRequestDispatcher(JspUrlConstatnt.WORK_SPACE).forward(request, response);
	}
}
