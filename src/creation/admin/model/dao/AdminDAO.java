package creation.admin.model.dao;

import static creation.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import creation.board.model.dto.HPBoardDTO;
import creation.book.hp.model.dto.HPbookDTO;
import creation.common.config.ConfigLocation;
import creation.member.model.dto.MemberDTO;

public class AdminDAO {
	private final Properties prop;

	public AdminDAO() {
			
			prop = new Properties();
			
			try {
				
				prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-mapper.xml"));
				
			} catch (IOException e) {
				
				e.printStackTrace();
				
			}
			
		}
	public List<HPbookDTO> allBookList(Connection con) {
		Statement stmt= null;
		ResultSet rset= null;
		
		List<HPbookDTO> allBookList= null;
		
		String query= prop.getProperty("selectAllBook");
		
		try {
			stmt =con.createStatement();
			rset=stmt.executeQuery(query);
			
			allBookList = new ArrayList<>();
			
			while(rset.next()) {
				HPbookDTO book = new HPbookDTO();
				book.setNo(rset.getInt("HP_BK_NO"));
				book.setMemberNo(rset.getInt("HP_MEM_NO"));
				book.setTime(rset.getString("HP_BK_TIME"));
				book.setPetKind(rset.getString("HP_PET_KIND"));
				book.setPetName(rset.getString("HP_PET_NAME"));
				book.setPetAge(rset.getString("HP_PET_AGE"));
				book.setPetNeut(rset.getString("HP_PET_NEUT"));
				book.setMessage(rset.getString("HP_BK_MESSAGE"));
				book.setStatus(rset.getString("HP_BK_STATUS"));
				allBookList.add(book);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(stmt);
		}
		
		return allBookList;
	}
	public int updateBook(Connection con, HPbookDTO updateBook) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBook");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, updateBook.getNo());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return result;

	}
	public int deleteBook(Connection con, HPbookDTO deleteBook) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBook");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, deleteBook.getNo());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return result;
	}
	public List<MemberDTO> allMemberList(Connection con) {
		Statement stmt= null;
		ResultSet rset= null;
		
		List<MemberDTO> allMemberList= null;
		
		String query= prop.getProperty("selectAllMember");
		
		try {
			stmt =con.createStatement();
			rset=stmt.executeQuery(query);
			
			allMemberList = new ArrayList<>();
			
			while(rset.next()) {
				MemberDTO mem = new MemberDTO();
				mem.setNo(rset.getInt("MEM_NO"));
				mem.setName(rset.getString("MEM_NAME"));
				mem.setPhone(rset.getInt("MEM_PHONE"));
				mem.setAddress(rset.getString("MEM_ADDRESS"));
				mem.setEmail(rset.getString("MEM_EMAIL"));
				mem.setId(rset.getString("MEM_ID"));
				mem.setBirthday(rset.getDate("MEM_BIRTH"));
				mem.setEnrollDate(rset.getDate("MEM_ENROLL_DATE"));
				mem.setStatus(rset.getString("MEM_STATUS"));
				mem.setKind(rset.getString("MEM_KIND"));
				allMemberList.add(mem);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(stmt);
		}
		
		return allMemberList;
	}
	public List<HPBoardDTO> privateQnaList(Connection con) {
		Statement stmt= null;
		ResultSet rset= null;
		
		List<HPBoardDTO> privateQnaList= null;
		
		String query= prop.getProperty("selectPrivateQnA");
		
		try {
			stmt =con.createStatement();
			rset=stmt.executeQuery(query);
			
			privateQnaList = new ArrayList<>();
			
			while(rset.next()) {
				HPBoardDTO qna = new HPBoardDTO();
				qna.setWriter(new MemberDTO());

				qna.setNo(rset.getInt("HP_QNA_NO"));
				qna.setTitle(rset.getString("HP_QNA_TITLE"));
				qna.setContent(rset.getString("HP_QNA_CONTENT"));
				qna.setDrawupDate(rset.getDate("HP_QNA_DRAWUP_DATE"));
				qna.getWriter().setNo(rset.getInt("HP_QNA_MEM_NO"));
				
				privateQnaList.add(qna);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(stmt);
		}
		
		return privateQnaList;
	}
	public List<HPBoardDTO> nonAnswerQnaList(Connection con) {
		Statement stmt= null;
		ResultSet rset= null;
		
		List<HPBoardDTO> nonAnswerQnaList= null;
		
		String query= prop.getProperty("selectNonAnswerQna");
		
		try {
			stmt =con.createStatement();
			rset=stmt.executeQuery(query);
			
			nonAnswerQnaList = new ArrayList<>();
			
			while(rset.next()) {
				HPBoardDTO qna = new HPBoardDTO();
				qna.setWriter(new MemberDTO());
				qna.setNo(rset.getInt("HP_QNA_NO"));
				qna.setTitle(rset.getString("HP_QNA_TITLE"));
				qna.setContent(rset.getString("HP_QNA_CONTENT"));
				qna.setDrawupDate(rset.getDate("HP_QNA_DRAWUP_DATE"));
				qna.getWriter().setNo(rset.getInt("HP_QNA_MEM_NO"));
				
				nonAnswerQnaList.add(qna);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(stmt);
		}
		
		return nonAnswerQnaList;
	}
	public List<HPBoardDTO> adminBoardList(Connection con) {
		Statement stmt= null;
		ResultSet rset= null;
		
		List<HPBoardDTO> adminBoardList= null;
		String query= prop.getProperty("selectAdminBorad");

		try {
			stmt =con.createStatement();
			rset=stmt.executeQuery(query);
			
			adminBoardList = new ArrayList<>();
			
			while(rset.next()) {
				HPBoardDTO board = new HPBoardDTO();
				board.setWriter(new MemberDTO());
				board.setNo(rset.getInt("HP_BD_NO"));
				board.setTitle(rset.getString("HP_BD_CATEGORY_NO"));
				board.setTitle(rset.getString("HP_BD_TITLE"));
				board.setDrawupDate(rset.getDate("HP_BD_DRAWUP_DATE"));
				board.setWatched(rset.getInt("HP_BD_WATCHED"));
				board.getWriter().setNo(rset.getInt("HP_MEM_NO"));

				
				adminBoardList.add(board);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(rset);
			close(stmt);
		}
		return adminBoardList;
	}

}
