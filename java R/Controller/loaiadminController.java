package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaibean;
import bo.loaibo;

/**
 * Servlet implementation class LoaiAdminController
 */
@WebServlet("/loaiadminController")
public class loaiadminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loaiadminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    loaibo loai=new loaibo();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		loaibean l=(loaibean)request.getAttribute("chonloai");
		try {
			HttpSession session= request.getSession();
			if(session.getAttribute("admin") == null)
		      	  response.sendRedirect("dangnhapadminController");
		        else {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String ml= request.getParameter("txtmaloai");
			String tl= request.getParameter("txttenloai");
			if(request.getParameter("butthem")!=null) {
				int n=loai.Them(ml, tl);
				if(n==0)
					request.setAttribute("ktnhap",0);
				
			}
			if(request.getParameter("butsua")!=null) {
				int n=loai.Sua(ml, tl);
				if(n==0)
					request.setAttribute("ktsua",0);		
			}
			if(request.getParameter("mlchon")!=null) {
				request.setAttribute("chonloai", loai.chon(request.getParameter("mlchon")));
				
			}if(request.getParameter("mlxoa")!=null) {
				int n=loai.Xoa(request.getParameter("mlxoa"));
				if(n==0)
					request.setAttribute("ktxoa",0);
			}
 
			//tao ra 1 bien request de chuyen nuoc ve tran htnuoc.jsp
			request.setAttribute("dsnuoc1", loai.getloai());
			RequestDispatcher rd= request.getRequestDispatcher("loaiadmin.jsp");
			rd.forward(request, response);
		        }
		}catch (Exception e) {
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