package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.dangkybean;
import bo.dangkybo;
import dao.dangkydao;

/**
 * Servlet implementation class ktdk
 */
@WebServlet("/ktdk")
public class ktdk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			 request.setCharacterEncoding("utf-8");
		     response.setCharacterEncoding("utf-8");
			String hoten=request.getParameter("HotenKH");
			String tendn=request.getParameter("TenDN");
			String matkhau=request.getParameter("Matkhau");
			String matkhaunhaplai=request.getParameter("Matkhaunhaplai");
			String email=request.getParameter("Email");
			String diachi=request.getParameter("Diachi");
			String sodt=request.getParameter("Dienthoai");
			String ngaysinh=request.getParameter("Ngaysinh");							
				if(matkhau.equals(matkhaunhaplai)) {
					dangkybo tk=new dangkybo();
					tk.Them(hoten, diachi, sodt, email, tendn, matkhau);
					
					RequestDispatcher rd = request.getRequestDispatcher("htnuoc");// Chuyen tiep ve trang htsach.jsp
					rd.forward(request, response);
				}else
					{
						RequestDispatcher rd = request.getRequestDispatcher("dangky?kt=1");// Chuyen tiep ve trang htsach.jsp
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
