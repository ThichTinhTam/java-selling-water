package Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.loaibean;
import bean.nuocbean;
import bo.loaibo;
import bo.nuocbo;

/**
 * Servlet implementation class quanlynuoc
 */
@WebServlet("/nuocadminController")
public class nuocadminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nuocadminController() {
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
			        else
			request.setCharacterEncoding("utf-8") ;
			response.setCharacterEncoding("utf-8");
			loaibo lbo=new loaibo();
			nuocbo sbo=new nuocbo();
			if(request.getParameter("xoa")!=null) sbo.xoanuoc(request.getParameter("manuoc"));
			ArrayList<loaibean> dsloai =lbo.getloai();
			ArrayList<nuocbean> dsnuoc = sbo.getnuoc();
			String ml=request.getParameter("ml");
		     String key=request.getParameter("txttk");
			 String page = request.getParameter("page");
			ArrayList<nuocbean> nuocpage = new ArrayList<nuocbean>();
  		if(ml!=null)
		    	 dsnuoc=sbo.TimLoai(ml);
		     else
		    	 if(key!=null)
			    	 dsnuoc=sbo.Tim(key); 
		     if(page == null) {
		    	 page="0";
		     }
		     if (page != null) {
		    	 if(dsnuoc.size()==0) {
		    		 dsnuoc = sbo.getnuoc();
		    	 }
		    	 int trang = Integer.parseInt(page);
		    	 trang = trang*9;
		    	 for (int i = trang; i < (trang+9) ; i++ ) {
		    		 if(dsnuoc.size()==i) {
		    			 break;
		    		 }
		    		 else {
		    			 nuocpage.add(dsnuoc.get(i));
		    		 }
		    		 
		    	 }
		     }     
		     ArrayList<Integer> sl = new ArrayList<Integer>();
		     for ( int i = 0 ; i<(dsnuoc.size()/9+1) ; i ++) {
		    	 sl.add(i);
		     }	
		    request.setAttribute("mloai", ml);
		    request.setAttribute("page", page);
		    request.setAttribute("sotrang", sl);	    
		    request.setAttribute("dsnuoc", nuocpage);
			request.setAttribute("dsloai", dsloai);
			
			RequestDispatcher rd=request.getRequestDispatcher("quanlynuoc.jsp");
			rd.forward(request, response);
		}catch(Exception e) {
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