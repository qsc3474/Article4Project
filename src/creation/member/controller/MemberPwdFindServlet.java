package creation.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creation.member.model.dto.MemberDTO;
import creation.member.model.service.MemberService;


@WebServlet("/member/pwdFind")
public class MemberPwdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/member/memberPwdFInd.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		System.out.println(id);
		System.out.println(name);
		System.out.println(email);
		
		MemberDTO mem= new MemberDTO();
		
		mem.setId(id);
		mem.setName(name);
		mem.setEmail(email);
		
		MemberService memberService = new MemberService();
		MemberDTO memberPwd = memberService.memberpwd(mem);

		String path = "";
		if(memberPwd !=null) {
			path = "/WEB-INF/views/member/pwdFindResult.jsp";
			request.setAttribute("memberPwd",memberPwd);
		}else {
		}
		request.getRequestDispatcher(path).forward(request, response);
		}
	}


