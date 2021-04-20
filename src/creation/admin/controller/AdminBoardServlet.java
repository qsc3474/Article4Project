package creation.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.admin.model.service.AdminService;
import creation.board.model.dto.HPBoardDTO;

/**
 * Servlet implementation class AdminBoardServlet
 */
@WebServlet("/admin/board")
public class AdminBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		AdminService admin = new AdminService();
		List<HPBoardDTO> adminBoardList= admin.adminBoardList();
		String path = "";

		System.out.println(adminBoardList);
		
		if(!adminBoardList.isEmpty()) {
			path="/WEB-INF/views/admin/adminBoardList.jsp"; 
			request.setAttribute("adminBoardList", adminBoardList);
		}else {
			path="/WEB-INF/views/admin/adminBoardList.jsp";
			request.setAttribute("adminBoardList", adminBoardList);
		}
		

	
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
