package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.chitietbo;
import bo.giohangbo;

/**
 * Servlet implementation class adminController
 */
@WebServlet("/adminController")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session= request.getSession();
			if(session.getAttribute("admin") == null)
		      	  response.sendRedirect("dangnhapadminController");
		        else {
			chitietbo tk;
			if(session.getAttribute("thongke")==null){
				tk=new chitietbo();
				session.setAttribute("thongke", tk);
			}
			
			tk = (chitietbo)session.getAttribute("thongke");
			request.setAttribute("tongsldh", tk.getthongke());
			request.setAttribute("tongdoanhthu", tk.gettongtienthuvao());
			RequestDispatcher rd=request.getRequestDispatcher("amin.jsp");
	      rd.forward(request, response);
		        }
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
