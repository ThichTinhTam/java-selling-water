package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.danhsachchuyentienbean;
import bean.khachhangbean;
import bean.lichsumuahangbean;
import bean.loaibean;
import bo.danhsachchuyentienbo;
import bo.lichsumuahangbo;
import bo.loaibo;

/**
 * Servlet implementation class danhsachchuyentienController
 */
@WebServlet("/danhsachchuyentienController")
public class danhsachchuyentienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public danhsachchuyentienController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			loaibo lbo=new loaibo();
			
			ArrayList<loaibean> dsnuoc1=lbo.getloai();
			request.setAttribute("dsnuoc1", dsnuoc1); 
			
			
			HttpSession session= request.getSession();
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			if(session.getAttribute("admin")==null)
		      	  response.sendRedirect("dangnhapadminController");
		        else {			
		        	danhsachchuyentienbo dsbo= new danhsachchuyentienbo();
				ArrayList<danhsachchuyentienbean> dsct = dsbo.HienThiDS();
				if (dsct != null) {
					request.setAttribute("dschuyentien", dsct);
				}
				
				 request.getRequestDispatcher("danhsachkhachhangchuyentien.jsp").forward(request, response);

			}
		} catch (Exception e) {
			e.printStackTrace();
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
