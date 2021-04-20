package creation.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import creation.member.model.dto.MemberDTO;

@WebFilter(urlPatterns={"/admin/*","/member/*","/hp/*","/ht/*", "/check/*", "/insert/*", "/select/*", "/termsList1", "/termsList2", "/termsList3"})
public class AuthenticationFilter implements Filter {

	private Map<String, List<String>> permitURIList;
	
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest hrequest = (HttpServletRequest) request;
		String uri = hrequest.getRequestURI();
		String intent = uri.replace(hrequest.getContextPath(), "");
		
		System.out.println("intent : " + intent);
		
		/* 세션에 권한이 있는지 확인하여 허용된 url에만 접근 가능하도록 설정한다. */
		HttpSession requestSession = hrequest.getSession();
		MemberDTO loginMember = (MemberDTO) requestSession.getAttribute("loginMember");
		System.out.println(loginMember);
		/* 허용 여부 변수 지정 */
		boolean isAuthorized = false;
		if(loginMember != null) {	// 로그인을 했다면
			
			boolean isPermitAdmin = permitURIList.get("adminPermitList").contains(intent);
			boolean isPermitMember = permitURIList.get("memberPermitList").contains(intent);
			boolean isPermitAll = permitURIList.get("allPermitList").contains(intent);
			
			/* 로그인 한 사람이 관리자인지 */
			if("M".equals(loginMember.getKind())) {				
				if(isPermitAdmin || isPermitMember || isPermitAll) {
					isAuthorized = true;
				}
			/* 로그인 한 사람이 일반 회원인지 */
			} else if("C".equals(loginMember.getKind())) {
				if((isPermitMember || isPermitAll) && !isPermitAdmin) {
					isAuthorized = true;
				}
			}
			
			/* 허용 여부값에 따른 처리 */
			if(isAuthorized) {
				chain.doFilter(request, response);				
			} else {
				((HttpServletResponse) response).sendError(403);
			}
		
		} else {					// 로그인을 안 했다면
			if(permitURIList.get("allPermitList").contains(intent)) {
				chain.doFilter(request, response);
			} else {
				
				System.out.println("들어왔습니다!");
				request.setAttribute("message", "로그인이 필요한 서비스 입니다.");
				request.getRequestDispatcher("/WEB-INF/views/common/failed.jsp").forward(request, response);
				 
			}
		} 
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
		permitURIList = new HashMap<>();
		List<String> adminPermitList = new ArrayList<>();
		List<String> memberPermitList = new ArrayList<>();
		List<String> allPermitList = new ArrayList<>();
		
		/* 관리자만 허용될 경로 */
		adminPermitList.add("/admin/book/delete");
		adminPermitList.add("/admin/board");
		adminPermitList.add("/admin/book/List");
		adminPermitList.add("/admin/book/update");
		adminPermitList.add("/admin/member/list");
		adminPermitList.add("/admin/nonAnswer/qna");
		adminPermitList.add("/hp/notice/file/insert");
		adminPermitList.add("/hp/report/count/list");
		adminPermitList.add("/hp/report/list");
		adminPermitList.add("/ht/FAQ/delete");
		adminPermitList.add("/ht/FAQ/insert");
		adminPermitList.add("/ht/FAQ/update");
		adminPermitList.add("/ht/NTC/notice/delete");
		adminPermitList.add("/ht/NTC/notice/insert");
		adminPermitList.add("/ht/NTC/notice/update");
		
		/* 회원과 관리자만 허용될 경로 */
		memberPermitList.add("/member/logout");
		memberPermitList.add("/member/delete");
		memberPermitList.add("/member/update");
		memberPermitList.add("/hp/book/delete");
		memberPermitList.add("/hp/book/detail");
		memberPermitList.add("/hp/book/insert");
		memberPermitList.add("/hp/book/list");
		memberPermitList.add("/hp/board/delete");
		memberPermitList.add("/hp/board/insert");
		memberPermitList.add("/hp/board/update");
		memberPermitList.add("/hp/review/file/insert");
		memberPermitList.add("/hp/board/report");
		memberPermitList.add("/insert/comment");
		memberPermitList.add("/insert/reply");
		memberPermitList.add("/ht/QNA/delete");
		memberPermitList.add("/ht/QNA/insert");
		memberPermitList.add("/ht/QNA/update");
		memberPermitList.add("/ht/event/delete");
		memberPermitList.add("/ht/event/detail");
		memberPermitList.add("/ht/event/list");
		memberPermitList.add("/ht/event/Insert");
		memberPermitList.add("/ht/room/list");
		memberPermitList.add("/ht/room/delete");
		memberPermitList.add("/ht/room/detail");
		memberPermitList.add("/ht/room/insert");
		
		/* 모두에게 허용될 경로 */
		allPermitList.add("/member/login");
		allPermitList.add("/member/regist");
		allPermitList.add("/member/idFind");
		allPermitList.add("/member/pwdFind");
		allPermitList.add("/check/id/overlap");
		allPermitList.add("/member/pwd");
		allPermitList.add("/hp/petInfo");
		allPermitList.add("/hp/petInfoDetail");
		allPermitList.add("/hp/about");
		allPermitList.add("/hp/dental");
		allPermitList.add("/hp/ey");
		allPermitList.add("/hp/gs");
		allPermitList.add("/hp/mg");
		allPermitList.add("/hp/healingList");
		allPermitList.add("/hp/healing/detail");
		allPermitList.add("/hp/info/dental");
		allPermitList.add("/hp/info/price");
		allPermitList.add("/hp/faq/select/add/list");
		allPermitList.add("/hp/faq/select/list");
		allPermitList.add("/hp/notice/select/list");
		allPermitList.add("/hp/notice/detail");
		allPermitList.add("/hp/notice/search");
		allPermitList.add("/hp/qna/select/list");
		allPermitList.add("/hp/qna/detail");
		allPermitList.add("/hp/qna/search/list");
		allPermitList.add("/hp/review/select/list");
		allPermitList.add("/hp/review/detail");
		allPermitList.add("/hp/review/search/list");
		allPermitList.add("/select/comment");
		allPermitList.add("/ht/main");
		allPermitList.add("/ht/about");
		allPermitList.add("/ht/package");
		allPermitList.add("/ht/gallery/list");
		allPermitList.add("/ht/info");
		allPermitList.add("/ht/room");
		allPermitList.add("/ht/service");
		allPermitList.add("/ht/FAQ/search");
		allPermitList.add("/ht/FAQ/detail");
		allPermitList.add("/ht/FAQ/list");
		allPermitList.add("/ht/NTC/notice/search");
		allPermitList.add("/ht/NTC/notice/detail");
		allPermitList.add("/ht/NTC/notice/list");
		allPermitList.add("/ht/QNA/search");
		allPermitList.add("/ht/QNA/detail");
		allPermitList.add("/ht/QNA/list");
		allPermitList.add("/termsList1");
		allPermitList.add("/termsList2");
		allPermitList.add("/termsList3");
		
		permitURIList.put("adminPermitList", adminPermitList);
		permitURIList.put("memberPermitList", memberPermitList);
		permitURIList.put("allPermitList", allPermitList);
		
	}
}










