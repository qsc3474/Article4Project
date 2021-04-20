package creation.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.member.model.dto.MemberDTO;
import creation.member.model.service.MemberService;


@WebServlet("/member/idFind")
public class MemberIdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/member/memberIdFInd.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	System.out.println(name);
	System.out.println(email);
	
	MemberDTO mem = new MemberDTO();
	mem.setName(name);
	mem.setEmail(email);
	MemberService memberService = new MemberService();
	MemberDTO memberId = memberService.memberId(mem);
	
	String path = "";
	if(memberId !=null) {
		path = "/WEB-INF/views/member/idFindResult.jsp";
		request.setAttribute("memberId",memberId);
	}else {
	}
	request.getRequestDispatcher(path).forward(request, response);
	}

}

