package com.hj.member.model.dao;

import static com.hj.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hj.common.model.vo.PageInfo;
import com.hj.member.model.vo.Member;
import com.hj.member.model.vo.Shipment;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String file = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member user = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new Member();
				
				user.setUserNo(rset.getInt("USER_NO"));
				user.setUserId(rset.getString("USER_ID"));
				user.setUserPwd(rset.getString("USER_PWD"));
				user.setUserName(rset.getString("USER_NAME"));
				user.setEmail(rset.getString("EMAIL"));
				user.setEmailSite(rset.getString("EMAIL_SITE"));
				user.setPhone(rset.getString("PHONE"));
				user.setEnrollDate(rset.getDate("ENROLL_DATE"));
				user.setUserStatus(rset.getString("USER_STATUS"));
				user.setSubStatus(rset.getString("SUB_STATUS"));
				user.setPoint(rset.getInt("POINT"));
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				close(rset);
				close(pstmt);
			}
		return user;
	}

	public int insertMember(Connection conn, Member user) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getEmailSite());
			
			System.out.println("DAO: " + user.getEmailSite());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int idCheck(Connection conn, String checkId) {
		// SELECT해서 중복되는 아이디 있는지 조회
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public int insertPoint(Connection conn) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public String findId(Connection conn, String userName, String phone) {
		
		String findId = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findId");
		// System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, phone);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				findId = rset.getString("USER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return findId;
	}

	public int findPwd(Connection conn, String userId, String phone) {
		
		int userNo = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userNo = rset.getInt("USER_NO");
				// System.out.println("Dao: " + userNo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return userNo;
	}

	public int updatePwd(Connection conn, int userNo, String userPwd) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPwd);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateMember(Connection conn, Member user) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPhone());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getEmailSite());
			pstmt.setInt(5, user.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member selectMember(Connection conn, int userNo) {
		
		Member user = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new Member();
				
				user.setUserNo(rset.getInt("USER_NO"));
				user.setUserId(rset.getString("USER_ID"));
				System.out.println(user.getUserId());
				user.setUserPwd(rset.getString("USER_PWD"));
				user.setUserName(rset.getString("USER_NAME"));
				user.setEmail(rset.getString("EMAIL"));
				user.setEmailSite(rset.getString("EMAIL_SITE"));
				user.setPhone(rset.getString("PHONE"));
				user.setEnrollDate(rset.getDate("ENROLL_DATE"));
				user.setUserStatus(rset.getString("USER_STATUS"));
				user.setSubStatus(rset.getString("SUB_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return user;
	}
	
	public int checkPwd(Connection conn, int userNo, String userPwd) {
		
		int flag = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				flag = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return flag;
	}
	

	public int insertShipment(Connection conn, Shipment s) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertShipment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, s.getUserNo());
			
			pstmt.setString(2, s.getShipName());
//			if(s.getShipName() == null) {
//				pstmt.setString(2, s.getRecipient());
//			} else {
//				pstmt.setString(2, s.getShipName());
//			}
			pstmt.setString(3, s.getRecipient());
			pstmt.setInt(4, s.getPostcode());
			pstmt.setString(5, s.getAddress());
			pstmt.setString(6, s.getDetailAddress());
			pstmt.setString(7,s.getPhone());
			pstmt.setString(8, s.getBasicShip());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Shipment> selectShipmentList(Connection conn, int userNo) {
		
		ArrayList<Shipment> sList = new ArrayList();
		Shipment s = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset =  null;
		String sql = prop.getProperty("selectShipmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				s = new Shipment();
				s.setShipNo(rset.getInt("SHIP_NO"));
				s.setUserNo(rset.getInt("USER_NO"));
				s.setShipName(rset.getString("SHIP_NAME"));
				s.setRecipient(rset.getString("RECIPIENT"));
				s.setPostcode(rset.getInt("POSTCODE"));
				s.setAddress(rset.getString("ADDRESS"));
				s.setDetailAddress(rset.getString("DETAIL_ADDRESS"));
				s.setPhone(rset.getString("PHONE"));
				s.setBasicShip(rset.getString("BASIC_SHIP"));
				
				sList.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sList;
	}

	public Shipment selectShipment(Connection conn, int shipNo) {
		
		Shipment s = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectShipment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, shipNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				s = new Shipment();
				s.setShipNo(rset.getInt("SHIP_NO"));
				s.setUserNo(rset.getInt("USER_NO"));
				s.setShipName(rset.getString("SHIP_NAME"));
				s.setRecipient(rset.getString("RECIPIENT"));
				s.setPostcode(rset.getInt("POSTCODE"));
				s.setAddress(rset.getString("ADDRESS"));
				s.setDetailAddress(rset.getString("DETAIL_ADDRESS"));
				s.setPhone(rset.getString("PHONE"));
				s.setBasicShip(rset.getString("BASIC_SHIP"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}

	public int updateShipment(Connection conn, Shipment s) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateShipment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, s.getShipName());
			pstmt.setString(2, s.getRecipient());
			pstmt.setInt(3, s.getPostcode());
			pstmt.setString(4, s.getAddress());
			pstmt.setString(5, s.getDetailAddress());
			pstmt.setString(6, s.getPhone());
			pstmt.setString(7, s.getBasicShip());
			pstmt.setInt(8, s.getShipNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateBasicShip(Connection conn, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBasicShip");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteShipment(Connection conn, int shipNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteShipment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, shipNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	// 관리자
	public ArrayList<Member> selectList(Connection conn, PageInfo pi) {
		 
		
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("memberManageList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				

				 Member m = new Member();
				 m.setUserNo(rset.getInt("USER_NO"));
				 m.setUserId(rset.getString("USER_ID"));
				 m.setUserName(rset.getString("USER_NAME"));
				 m.setPhone(rset.getString("PHONE"));
				 m.setBuyCount(rset.getInt("BUY_COUNT"));
				 m.setSaleSum(rset.getInt("SALE_SUM"));
				 m.setPoint(rset.getInt("POINT"));
				 
				 
				 
				 
				 
				list.add(m);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		
		
		return list;
	
	}
	
	public int selectListCount(Connection conn) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("memberManageListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
		
		
		
	}
	
	
	
	public ArrayList<Member> deletedMemberList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("deleteMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
	
				 Member m = new Member();
				 m.setUserNo(rset.getInt("USER_NO"));
				 m.setUserId(rset.getString("USER_ID"));
				 m.setUserName(rset.getString("USER_NAME"));
				 m.setPhone(rset.getString("PHONE"));
				 m.setBuyCount(rset.getInt("BUY_COUNT"));
				 m.setSaleSum(rset.getInt("SALE_SUM"));
				 m.setPoint(rset.getInt("POINT"));
				 
				 
				 
				 
				 
				list.add(m);
			}
			
		} catch (SQLException e) {
	
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
	
		
		
		return list;
		
		
	}
	
	
	
	public int deleteListCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("deleteMemberListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}







}
