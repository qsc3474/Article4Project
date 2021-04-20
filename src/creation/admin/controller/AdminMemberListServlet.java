package creation.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.admin.model.service.AdminService;
import creation.member.model.dto.MemberDTO;

/**
 * Servlet implementation class AdminMemberListServlet
 */
@WebServlet("/admin/member/list")
public class AdminMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService admin = new AdminService();
		List<MemberDTO> allMemberList= admin.selectAllMemberList();
		String path = "";

		System.out.println(allMemberList);
		
		if(!allMemberList.isEmpty()) {
			path="/WEB-INF/views/admin/adminMemberList.jsp";
			request.setAttribute("allMemberList", allMemberList);
		}else {
			path="/WEB-INF/views/admin/adminMemberList.jsp";
			request.setAttribute("allMemberList", allMemberList);
		}
		

	
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
