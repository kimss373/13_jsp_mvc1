package step3_00_boardEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private Connection conn 		= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs 			= null;
	
	public void getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/STEP3_BOARD_EX?serverTimezone=UTC&useSSL=false", "root", "1234");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void getClose() {
		if (rs != null)    try {rs.close();} catch(Exception e) {e.printStackTrace();}
		if (pstmt != null) try {pstmt.close();} catch(Exception e) {e.printStackTrace();}
		if (conn != null)  try {conn.close();} catch(Exception e) {e.printStackTrace();}	
	}
	
	
	public void insertBoard(BoardDTO boardDTO) {
		
		try {
			
			getConnection();
			String sql = "INSERT INTO BOARD(WRITER , EMAIL , SUBJECT , PASSWORD , ENROLL_DT , READ_CNT , CONTENT) ";
			       sql += "VALUES(? , ? , ? , ? , NOW() , 0 , ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getWriter());
			pstmt.setString(2, boardDTO.getEmail());
			pstmt.setString(3, boardDTO.getSubject());
			pstmt.setString(4, boardDTO.getPassword());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
	}
	
	
	public ArrayList<BoardDTO> getBoardList() {
		
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				BoardDTO temp = new BoardDTO();
				temp.setNum(rs.getInt("NUM"));
				temp.setWriter(rs.getString("WRITER"));
				temp.setEmail(rs.getString("EMAIL"));
				temp.setSubject(rs.getString("SUBJECT"));
				temp.setPassword(rs.getString("PASSWORD"));
				temp.setEnrollDt(rs.getDate("ENROLL_DT"));
				temp.setReadCnt(rs.getInt("READ_CNT"));
				temp.setContent(rs.getString("CONTENT"));
				
				boardList.add(temp);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return boardList;
		
	}
	
	
	public BoardDTO getBoardDetail(int num, boolean isIncreaseReadCnt) {
		
		BoardDTO boardDTO = null;
		
		try {
			
			getConnection();
			
			if (isIncreaseReadCnt) {
				pstmt = conn.prepareStatement("UPDATE BOARD SET READ_CNT = READ_CNT + 1 WHERE NUM = ?");
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			}
			
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				boardDTO = new BoardDTO();
				boardDTO.setNum(rs.getInt("NUM"));
				boardDTO.setWriter(rs.getString("WRITER"));
				boardDTO.setEmail(rs.getString("EMAIL"));
				boardDTO.setSubject(rs.getString("SUBJECT"));
				boardDTO.setPassword(rs.getString("PASSWORD"));
				boardDTO.setEnrollDt(rs.getDate("ENROLL_DT"));
				boardDTO.setReadCnt(rs.getInt("READ_CNT"));
				boardDTO.setContent(rs.getString("CONTENT"));
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return boardDTO;
		
	}
	
	
	public boolean checkValidateMember(BoardDTO boardDTO) {
		
		boolean isValid = false;
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM = ? AND PASSWORD = ?");
			pstmt.setInt(1, boardDTO.getNum());
			pstmt.setString(2, boardDTO.getPassword());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				isValid = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isValid;
		
	}
	
	
	public boolean deleteBoard(BoardDTO boardDTO) {
		
		boolean isDelete = false;
		
		try {
			
			getConnection();
			
			if (checkValidateMember(boardDTO)) {
				
				pstmt = conn.prepareStatement("DELETE FROM BOARD WHERE NUM = ?");
				pstmt.setInt(1, boardDTO.getNum());
				pstmt.executeUpdate();
				isDelete = true;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isDelete;
		
	}
	
	
	public boolean updateBoard(BoardDTO boardDTO) {
		
		boolean isUpdate = false;
		
		try {
			
			if (checkValidateMember(boardDTO)) {
				getConnection();
				
				pstmt = conn.prepareStatement("UPDATE BOARD SET SUBJECT = ?, CONTENT = ?, ENROLL_DT = NOW() WHERE NUM = ?");
				pstmt.setString(1, boardDTO.getSubject());
				pstmt.setString(2, boardDTO.getContent());
				pstmt.setInt(3, boardDTO.getNum());
				pstmt.executeUpdate();
				isUpdate = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isUpdate;
		
	}
	
	
	
	
	
	
	
	
}
