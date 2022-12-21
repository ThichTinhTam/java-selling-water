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

import bean.khachhangbean;
import bean.loaibean;
import bean.nuocbean;
import bo.khachhangbo;
import bo.lichsumuahangbo;
import bo.loaibo;
import bo.nuocbo;

/**
 * Servlet implementation class htnuoc
 */
@WebServlet("/htnuoc")
public class htnuoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htnuoc() {
        super();
        // TODO Auto-generated constructor stub
    }

   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
		
		loaibo lbo = new loaibo();
		nuocbo sbo = new nuocbo();
		lichsumuahangbo lsbo = new lichsumuahangbo();
		 String page = request.getParameter("page");
		ArrayList<loaibean> dsnuoc1 = new ArrayList<loaibean>();
		ArrayList<nuocbean> nuocpage = new ArrayList<nuocbean>();
		dsnuoc1 = lbo.getloai();
		request.setAttribute("dsnuoc1", dsnuoc1);	
		 request.setCharacterEncoding("utf-8");
	     response.setCharacterEncoding("utf-8");
	     String ml=request.getParameter("ml");
	     String key=request.getParameter("txttk");
	     ArrayList<nuocbean> dsnuoc=sbo.getnuoc();
	     nuocbean last = sbo.getNew();
	     request.setAttribute("last", last); 
	     String tennuocbanchay = lsbo.nuocbanchaynhat();
	     String anhbc = lsbo.Anhnuocbanchaynhat();
	     long SLbc = lsbo.SLnuocbanchaynhat();
	     request.setAttribute("tennuocbanchay", tennuocbanchay);
	     request.setAttribute("anhbc", anhbc);
	     request.setAttribute("SLbc", SLbc);
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
		 RequestDispatcher rd = request.getRequestDispatcher("htnuoc.jsp");
		 rd.forward(request, response);		    
		}catch (Exception e) {			 
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
