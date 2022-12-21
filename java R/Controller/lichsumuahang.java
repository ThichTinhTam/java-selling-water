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
import javax.swing.JOptionPane;

import bean.khachhangbean;
import bean.lichsumuahangbean;
import bean.loaibean;
import bo.giohangbo;
import bo.lichsumuahangbo;
import bo.loaibo;


/**
 * Servlet implementation class lichsumuahangController
 */
@WebServlet("/lichsumuahang")
public class lichsumuahang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichsumuahang() {
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
			
			
			HttpSession session=request.getSession();
			khachhangbean kh=(khachhangbean)session.getAttribute("dn");
			if(kh==null) {
				response.sendRedirect("ktdn");
			}else {
				lichsumuahangbo lsbo= new lichsumuahangbo();
				ArrayList<lichsumuahangbean> ls = lsbo.HienThi(kh.getMakh());
				if (ls != null) {
					request.setAttribute("dslichsu", ls);
				}
				
				 request.getRequestDispatcher("lichsumuahang.jsp").forward(request, response);

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