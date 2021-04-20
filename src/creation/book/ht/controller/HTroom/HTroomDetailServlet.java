package creation.book.ht.controller.HTroom;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.book.ht.model.dao.HTroomDTO;
import creation.book.ht.model.service.HTroomService;


@WebServlet("/ht/room/detail")
public class HTroomDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.valueOf(request.getParameter("no"));
		
		HTroomService roomService = new HTroomService();
		HTroomDTO HTroomDetail = roomService.selectRoomDetail(no);
		
		String path = "";
		
		if(HTroomDetail != null) {
			path="/WEB-INF/views/thRoomReservation/HTRoomDetail.jsp";
			request.setAttribute("HTroomDetail", HTroomDetail);
		}else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "예약에 실패하셨습니다.");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	}

	
	


