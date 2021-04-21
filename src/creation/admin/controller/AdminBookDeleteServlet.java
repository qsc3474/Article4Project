package creation.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.admin.model.service.AdminService;
import creation.book.hp.model.dto.HPbookDTO;

/**
 * Servlet implementation class AdminBookDeleteServlet
 */
@WebServlet("/admin/book/delete")
public class AdminBookDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.valueOf(request.getParameter("no"));
		System.out.println(no);
		int result = 0;
		
		AdminService bookUpdate = new AdminService();
		
		HPbookDTO deleteBook = new HPbookDTO();
		deleteBook.setNo(no);
		result =bookUpdate.deleteBook(deleteBook);
		
		System.out.println(deleteBook);
		String path="";
		if(result>0) {
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "deleteBook");
		}else {
			path="/WEB-INF/views/common/adminFailed.jsp";
			request.setAttribute("message", "예약 취소에 실패하셨습니다.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}
	
}

	
	


