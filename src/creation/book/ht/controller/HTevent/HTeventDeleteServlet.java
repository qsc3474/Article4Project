package creation.book.ht.controller.HTevent;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.book.ht.model.dao.HTeventDTO;
import creation.book.ht.model.service.HTevnetService;


@WebServlet("/ht/event/delete")
public class HTeventDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no =Integer.valueOf(request.getParameter("no"));
		System.out.println("이벤트 딜리트 넘버"+no);
		int result = 0;
		HTevnetService roomService = new HTevnetService();
		
		HTeventDTO deleteEvent = new HTeventDTO();
		deleteEvent.setEventNo(no);
		
		result = roomService.deleteEvent(deleteEvent);
		
		System.out.println(deleteEvent);
		System.out.println(result);
		String path= "";
		if(result > 0) {
			
			path = "/WEB-INF/views/common/thSuccess.jsp";
			request.setAttribute("successCode", "thEventDelete");
			
		}else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시글 작성에 실패하셨습니다.");
			
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	
}
