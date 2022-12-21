package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.xacnhanbean;
import bo.xacnhanbo;

/**
 * Servlet implementation class xacnhanchuyentienController
 */
@WebServlet("/xacnhanchuyentienController")
public class xacnhanchuyentienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanchuyentienController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 xacnhanbo xnbo = new xacnhanbo();
		 HttpSession session = request.getSession();
		 ArrayList<xacnhanbean> dsxn = xnbo.getdanhsach();
		 String mct = request.getParameter("mct");
		 long mact=Long.parseLong(mct);
		 if(mct != null) {
			 xnbo.UpdateDaMua(mact);
			dsxn.remove(mct);
		 }
		 session.removeAttribute("mct");
			response.sendRedirect("xacnhanController");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
