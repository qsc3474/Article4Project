package creation.member.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.member.model.dto.MemberDTO;
import creation.member.model.service.MemberService;

/**
 * Servlet implementation class PwdUpdateServlet
 */
@WebServlet("/member/pwd")
public class PwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int no = Integer.valueOf(request.getParameter("no"));
	String pwd = request.getParameter("pwd");		
	
	MemberDTO mem = new MemberDTO();
	mem.setNo(no);
	mem.setPwd(pwd);
	
	MemberService memberService = new MemberService();
	
	int result = memberService.pwdUpdate(mem);
	
	String path="";
	if(result>0) {
		path="/WEB-INF/views/main/main.jsp";
		
	}else {
		
	}
	request.getRequestDispatcher(path).forward(request, response);
	}

}
