package com.hj.member.model.service;

import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.commit;
import static com.hj.common.JDBCTemplate.getConnection;
import static com.hj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.common.model.vo.PageInfo;
import com.hj.member.model.dao.MemberDao;
import com.hj.member.model.vo.Member;
import com.hj.member.model.vo.Shipment;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member user = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return user;
	}

	public int inserMember(Member user) {
		
		Connection conn = getConnection();
		
		int result1 = new MemberDao().insertMember(conn, user);
		int result2 = new MemberDao().insertPoint(conn);
		
		if(result1 * result2 > 0 ) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result1*result2;
	}

	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
	}

	public String findId(String userName, String phone) {
		
		Connection conn = getConnection();
		
		String findId = new MemberDao().findId(conn, userName, phone);
		
		close(conn);
		
		return findId;
	}

	public int findPwd(String userId, String phone) {
		Connection conn = getConnection();
		
		int userNo = new MemberDao().findPwd(conn, userId, phone);
		
		close(conn);
		
		return userNo;
	}

	public int updatePwd(int userNo, String userPwd) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn, userNo, userPwd);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	public int updatePwd(int userNo, String userPwd, Member user) {
		
		Connection conn = getConnection();
		
		int result1 = new MemberDao().updatePwd(conn, userNo, userPwd);
		
		int result2 = new MemberDao().updateMember(conn, user);
		
		if(result1 * result2 > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return (result1 * result2);
		
	}
	
	public Member updateMember(Member user) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, user);
		
		Member updateMem = null;
		
		if(result > 0) {
			
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, user.getUserNo());
			
		} else {
			rollback(conn);
		}
		return updateMem;
	}
	
	public int checkPwd(int userNo, String userPwd) {
		
		Connection conn = getConnection();

		int flag = new MemberDao().checkPwd(conn, userNo, userPwd);
		
		close(conn);
		
		return flag;
	}
	
	public int deleteMember(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}


	public int insertShipment(Shipment s) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertShipment(conn, s);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Shipment> selectShipmentList(int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Shipment> sList = new MemberDao().selectShipmentList(conn, userNo);
		
		close(conn);
		
		return sList;
	}

	public Shipment selectShipment(int shipNo) {
		
		Connection conn = getConnection();
		
		Shipment s = new MemberDao().selectShipment(conn, shipNo);
		
		close(conn); 
		
		return s;
	}

		
	public int updateShipment(Shipment s) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateShipment(conn, s);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public void updateBasicShip(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateBasicShip(conn, userNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
	}

	public int deleteShipment(int shipNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteShipment(conn, shipNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
				
		return result;
	}

	// 관리자
	
	public ArrayList<Member> selectList(PageInfo pi) {

		

		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	
		
		
	}

	public int selectListCount() {

		Connection conn = getConnection();
		int listCount = new MemberDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
		
		
	}

	public int deleteListCount() {

		Connection conn = getConnection();
		int listCount = new MemberDao().deleteListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}

	public ArrayList<Member> deletedMemberList(PageInfo pi) {

		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().deletedMemberList(conn, pi);
		
		close(conn);
		
		return list;
	
	}

	

	


}
