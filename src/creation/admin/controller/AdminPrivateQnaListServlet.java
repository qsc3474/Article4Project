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
 * Servlet implementation class AdminPrivateQnaListServlet
 */
@WebServlet("/admin/Qna/private")
public class AdminPrivateQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService admin = new AdminService();
		List<HPBoardDTO> privateQnaList= admin.selectPrivateQnaList();
		String path = "";

		System.out.println(privateQnaList);
		
		if(!privateQnaList.isEmpty()) {
			path="/WEB-INF/views/admin/adminPrivateQnA.jsp";
			request.setAttribute("privateQnaList", privateQnaList);
		}
		

	
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	

}
