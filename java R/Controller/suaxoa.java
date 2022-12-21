package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class suaxoa
 */
@WebServlet("/suaxoa")
public class suaxoa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaxoa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		giohangbo gh=(giohangbo)session.getAttribute("gio");
		
		if(request.getParameter("butcheck")!=null){
			String[] c=request.getParameterValues("check");
			if(c!=null)
			for(String st:c)
				gh.Xoa(st);
		}
	
		if(request.getParameter("butsua")!=null){
			String ms=request.getParameter("butsua");
			String tendksl="txt"+ms;
			long sl=Long.parseLong(request.getParameter(tendksl));
			gh.Them(ms, "", 0, sl, "");
		}else
			if(request.getParameter("butxoa")!=null){
				String ms=request.getParameter("butxoa");
				gh.Xoa(ms);
			}
		session.setAttribute("gio", gh);//Luu lai session
		if(gh.ds.size()==0)//Neu trong gio het hang
			   response.sendRedirect("htnuoc");
		else
			   response.sendRedirect("htgio");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
