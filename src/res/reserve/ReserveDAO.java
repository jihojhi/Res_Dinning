package res.reserve;

import java.sql.*;
import java.util.ArrayList;

public class ReserveDAO {
	
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/resproject";
	String user = "root";
	String pass = "mysql";
	String driver = "com.mysql.jdbc.Driver";
	
	PreparedStatement pstmt = null;
	
	/* 데이터 베이스 연결 */
	public void connect() {

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/* 데이터 베이스 연결 해제 */
	public void disconnect() {

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
		if (con != null) {
			try {
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				con = null;
			}
		}
	}
	
	/* 데이터 베이스 입력  : 회원 */
	public boolean insertDB(ReserveInfo r_info) {
		
		String query = "insert into reserveInsert values(?,?,?,?,?)";
		connect();
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, r_info.getId());
			pstmt.setString(2, r_info.getDate());
			pstmt.setString(3, r_info.getNumber());
			pstmt.setString(4, r_info.getTime());
			pstmt.setString(5, r_info.getAskfor());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
			
		} finally {
			
			disconnect();
			
		}
		
		return true;
		
	}
	
	/* 데이터 베이스 수정  : 회원 */
	public boolean updateDB(ReserveInfo r_info) {
		
		String query = "update reserveInsert set r_date=?, r_number=?, r_time=?, r_askfor=? where r_id=?";
		connect();
		
		try {

			pstmt=con.prepareStatement(query);

			pstmt.setString(1, r_info.getDate());
			pstmt.setString(2, r_info.getNumber());
			pstmt.setString(3, r_info.getTime());
			pstmt.setString(4, r_info.getAskfor());
			
			pstmt.setString(5, r_info.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
		
			e.printStackTrace();
			return false;
		
		} finally {
			
			disconnect();

		}
		
		return true;
		
	}
	
	/* 데이터 베이스 삭제  : 회원 */
	
	public boolean deleteDB(String id) {
		
		String query = "delete from reserveInsert where r_id=?";
		connect();
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		
		} finally {
			
			disconnect();
			
		}
		
		return true;
	}
	
	/* 특정 예약내역 읽어오기 : 회원 */
	public ReserveInfo getDB(String id) {
		
		ReserveInfo info = new ReserveInfo();
		
		String query = "select * from reserveInsert where r_id=?";
		connect();
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			info.setId(rs.getString("r_id"));
			info.setDate(rs.getString("r_date"));
			info.setNumber(rs.getString("r_number"));
			info.setTime(rs.getString("r_time"));
			info.setAskfor(rs.getString("r_askfor"));
			
			rs.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		
		} finally {
			
			disconnect();
		}

		return info;
		
	}
	
	/* 전체 예약내역 읽어오기 : 관리자 */
	public ArrayList<ReserveInfo> getDBList(){
		
		String query = "select * from reserveInsert";
		ArrayList<ReserveInfo> allInfo = new ArrayList<>();
		connect();
		
		try {
			
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReserveInfo info = new ReserveInfo();
				info.setId(rs.getString("r_id"));
				info.setDate(rs.getString("r_date"));
				info.setNumber(rs.getString("r_number"));
				info.setTime(rs.getString("r_time"));
				info.setAskfor(rs.getString("r_askfor"));
				
				allInfo.add(info);
				
			}
			
			rs.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		
		} finally {
			
			disconnect();
			
		}
		
		return allInfo;
		
	}
	
}
