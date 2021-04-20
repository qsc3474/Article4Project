package creation.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import creation.member.model.dto.MemberDTO;
import creation.member.model.service.MemberService;

@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/member/memberUpdate.jsp";
		HttpSession session = request.getSession();
		MemberDTO member = ((MemberDTO)session.getAttribute("loginMember"));
		String address = member.getAddress();
		int firstDot = address.indexOf("$");
		int lastDot = address.lastIndexOf("$");
		String address1 = address.substring(0, firstDot);
		String address2 = address.substring(firstDot + 1, lastDot);
		String address3 = address.substring(lastDot + 1);
		request.setAttribute("address1", address1);
		request.setAttribute("address2", address2);
		request.setAttribute("address3", address3);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = ((MemberDTO)request.getSession().getAttribute("loginMember")).getNo();
		String email = request.getParameter("email");
		int phone = Integer.valueOf(request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3"));
		String address = request.getParameter("address1") + "$" + request.getParameter("address2")
        					+ "$" + request.getParameter("address3");
		String pwd = request.getParameter("pwd");
		
		MemberDTO updateData = new MemberDTO();
		updateData.setNo(no);
		updateData.setAddress(address);
		updateData.setPhone(phone);
		updateData.setEmail(email);
		updateData.setPwd(pwd);
		
		int result = new MemberService().updateMember(updateData);
		
		String path = "";
		
		if(result > 0) {
			
			HttpSession loginMember = request.getSession();
			MemberDTO updateMember = (MemberDTO)loginMember.getAttribute("loginMember");
			
			updateMember.setAddress(address);
			updateMember.setPhone(phone);
			updateMember.setEmail(email);
			updateMember.setPwd(pwd);
			
			loginMember.setAttribute("loginMember", updateMember);
			
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "updateMember");
			
		} else {
			
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "회원 정보 수정에 실패하셨습니다.");
			
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
