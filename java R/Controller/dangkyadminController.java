package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.dangkyadminbo;
import bo.dangkybo;

/**
 * Servlet implementation class dangkyadminController
 */
@WebServlet("/dangkyadminController")
public class dangkyadminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkyadminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 request.setCharacterEncoding("utf-8");
		     response.setCharacterEncoding("utf-8");
			String TenDangNhap=request.getParameter("TenDangNhap");
			String MatKhau=request.getParameter("MatKhau");
			String MatKhauNhapLai=request.getParameter("MatKhauNhapLai");							

				if(MatKhau.equals(MatKhauNhapLai)) {
					dangkyadminbo tk=new dangkyadminbo();
					tk.Them(TenDangNhap, MatKhauNhapLai);
					
					RequestDispatcher rd = request.getRequestDispatcher("adminController");// Chuyen tiep ve trang htsach.jsp
					rd.forward(request, response);
				}else
					{
						RequestDispatcher rd = request.getRequestDispatcher("dangkyadmin?kt=1");// Chuyen tiep ve trang htsach.jsp
						rd.forward(request, response);
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
