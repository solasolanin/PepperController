package pepperCtr.presentation.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pepperCtr.commons.presentation.util.JspUrlConstatnt;
import pepperCtr.commons.presentation.util.SessionConstant;
import pepperCtr.logic.bean.CommandBean;

/**
 * Servlet implementation class RemoveCmdServlet
 */
@WebServlet("/pepperCtr/remove")
public class RemoveCmdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<CommandBean> cmdList = (List<CommandBean>) session.getAttribute(SessionConstant.CMD_LIST);
		if (cmdList == null) {
			request.getRequestDispatcher(JspUrlConstatnt.WORK_SPACE).forward(request, response);
			return;
		}
		int index = Integer.parseInt(request.getParameter("listIndex"));
		cmdList.remove(index);
		request.getRequestDispatcher(JspUrlConstatnt.WORK_SPACE).forward(request, response);
	}
}
