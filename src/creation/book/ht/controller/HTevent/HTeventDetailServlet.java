package creation.book.ht.controller.HTevent;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.book.ht.model.dao.HTeventDTO;
import creation.book.ht.model.service.HTevnetService;


@WebServlet("/ht/event/detail")
public class HTeventDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.valueOf(request.getParameter("no"));
		
		HTevnetService eventService = new HTevnetService();
		HTeventDTO HTeventDetail = eventService.selectEventDetail(no);
		
		String path = "";
		
		if(HTeventDetail != null) {
			path="/WEB-INF/views/htEventReservation/HTEventDetail.jsp";
			request.setAttribute("HTeventDetail", HTeventDetail);
		}else {
			path="/WEB-INF/views/htEventReservation/HTEventDetail.jsp";
			request.setAttribute("HTeventDetail", HTeventDetail);
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	}

	
	


