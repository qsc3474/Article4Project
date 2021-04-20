package creation.comment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import creation.comment.model.dto.CommentDTO;
import creation.comment.model.service.CommentService;
import creation.member.model.dto.MemberDTO;

@WebServlet("/insert/reply")
public class AjaxCommentInsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDTO writer = new MemberDTO();
		
		writer.setName(((MemberDTO)request.getSession().getAttribute("loginMember")).getName());
		
		String refBoardNo = request.getParameter("currentBoardNo");
		String refBoardCategory = request.getParameter("currentBoardCategoryNo");
		int writerNo = Integer.valueOf(request.getParameter("writerNo"));
		String commentContent = request.getParameter("content");
		int parentCommentNo = Integer.valueOf(request.getParameter("parentCommentNo"));
		
		String refBoard = refBoardCategory + "-" + refBoardNo;
		
		CommentDTO insertReply = new CommentDTO();
		
		insertReply.setMemNo(writerNo);
		insertReply.setRefBoardNo(refBoard);
		insertReply.setContent(commentContent);
		insertReply.setWriter(writer);
		insertReply.setParentCmtNo(parentCommentNo);
		
		System.out.println(insertReply);
		
		int result = new CommentService().insertComment(insertReply, refBoardCategory);
		
		String jsonString = new Gson().toJson(result);
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(jsonString);
		
		out.flush();
		out.close();
		
	}

}
