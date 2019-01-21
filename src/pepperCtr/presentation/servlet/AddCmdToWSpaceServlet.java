package pepperCtr.presentation.servlet;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class AddCmdToWSpaceServlet
 */
@WebServlet("/pepperCtr/addWSpace")
public class AddCmdToWSpaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String cmdName = request.getParameter("cmdName");
		String userDefinedName = request.getParameter("userDefinedName");
		if (userDefinedName.isEmpty()) {
			userDefinedName = cmdName;
		}
		String cmdOnClick = request.getParameter("cmdOnClick");
		String cmdClass = request.getParameter("cmdClass");
		CommandBean commandBean = new CommandBean(cmdName, userDefinedName, cmdOnClick, cmdClass);
		@SuppressWarnings("unchecked")
		List<CommandBean> cmdList = (List<CommandBean>) session.getAttribute(SessionConstant.CMD_LIST);
		if (cmdList == null) {
			cmdList = new ArrayList<>();
		}
		cmdList.add(commandBean);
		session.setAttribute(SessionConstant.CMD_LIST, cmdList);
		request.setAttribute("createMode", "class = 'active'");
		request.getRequestDispatcher(JspUrlConstatnt.CREATE_MODE).forward(request, response);
	}

}
