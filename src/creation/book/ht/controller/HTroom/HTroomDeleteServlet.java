package creation.book.ht.controller.HTroom;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.book.ht.model.dao.HTroomDTO;
import creation.book.ht.model.service.HTroomService;


@WebServlet("/ht/room/delete")
public class HTroomDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no =Integer.valueOf(request.getParameter("no"));
		System.out.println(no);
		int result = 0;
		HTroomService roomService = new HTroomService();
		
		HTroomDTO deleteRoom = new HTroomDTO();
		deleteRoom.setNo(no);
		
		result = roomService.deleteRoom(deleteRoom);
		
		System.out.println(deleteRoom);
		System.out.println(result);
		String path= "";
		if(result > 0) {
			
			path = "/WEB-INF/views/common/thSuccess.jsp";
			request.setAttribute("successCode", "thRoomDelete");
			
		}else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "게시글 작성에 실패하셨습니다.");
			
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	
}
