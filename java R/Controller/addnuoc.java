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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import bo.nuocbo;

/**
 * Servlet implementation class addnuoc
 */
@WebServlet("/addnuoc")
public class addnuoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addnuoc() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		 DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		 ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		 String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "image_nuoc";
		 request.setCharacterEncoding("utf-8") ;
		response.setCharacterEncoding("utf-8"); 
		try {
			request.setCharacterEncoding("utf-8") ;
			 response.setCharacterEncoding("utf-8");
			String manuoc=null;
			String tennuoc=null;
			String ncc=null;
			Long soluong=null;
			Long gia=null;
			String maloai=null;
			String nameimg=null;
			
			List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
			//duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
			 if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
				// xử lý file
				nameimg = fileItem.getName();
				if (!nameimg.equals("")) {
			           //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
					String dirUrl = "C:\\Users\\Admin\\eclipse-workspace\\baithijava20T1020639\\src\\main\\webapp\\image_nuoc";
					File dir = new File(dirUrl);
					if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
						dir.mkdir();
					}
				           String fileImg = dirUrl + File.separator + nameimg;
				           File file = new File(fileImg);//tạo file
				            try {
				               fileItem.write(file);//lưu file
				 } catch (Exception e) {
				    e.printStackTrace();
				}
			}
		 }
			
			 else//Neu la control
			 {	String tentk=fileItem.getFieldName();
					if(tentk.equals("txtmanuoc")) manuoc=fileItem.getString();
					if(tentk.equals("txttennuoc")) tennuoc=fileItem.getString();
					if(tentk.equals("txtncc")) ncc=fileItem.getString();
					if(tentk.equals("txtsoluong")) if (!fileItem.getString().equals("")) soluong=Long.parseLong(fileItem.getString() );
					if(tentk.equals("txtgia"))if (!fileItem.getString().equals(""))  gia=Long.parseLong(fileItem.getString() );
					if(tentk.equals("cbbloai")) maloai=fileItem.getString();
				}
			}

		nameimg= "image_nuoc/"+nameimg;
		nuocbo sbo=new nuocbo();
		if(sbo.Timnuoc(manuoc)!=null) 
			request.setAttribute("tb",0);// tạo 1 tb có giá trị = 0 nếu khác rỗng 
		else sbo.themnuoc(manuoc, tennuoc, ncc, soluong, gia, maloai, nameimg, new Date());
		}catch(Exception e) {
			e.printStackTrace();
	}
		
		RequestDispatcher rd=request.getRequestDispatcher("nuocadminController");
		rd.forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}