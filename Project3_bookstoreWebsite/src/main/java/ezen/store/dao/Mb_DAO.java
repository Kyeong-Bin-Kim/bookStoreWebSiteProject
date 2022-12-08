package ezen.store.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.store.beans.Mb_Bean;
import ezen.store.mapper.Mb_Mapper;

@Repository
public class Mb_DAO {

	@Autowired
	private Mb_Mapper mbMapper;

	// 로그인 정보
	public Mb_Bean getloginUserInfo(Mb_Bean tempMbBean) {

		return mbMapper.getloginUserInfo(tempMbBean);
		
	}

	// 아아디 중복체크
	public String checkUserIdExist(String mb_id) {

		return mbMapper.checkUserIdExist(mb_id);
		
	}

	// 회원가입
	public void addUserInfo(Mb_Bean insertMbBean) {

		mbMapper.addUserInfo(insertMbBean);
		
	}
		
	// 전체회원 리스트
	public List<Mb_Bean> getMbList() {

		return mbMapper.getMbList();
		
	}
		
	// 리스트 갯수
	public int getCntMember() {
				
		return mbMapper.getCntMember();
			
	}

	// 회원정보 상세보기
	public Mb_Bean getMbInfo(String mb_id) {

		return mbMapper.getMbInfo(mb_id);
		
	}

	// 회원정보 수정 실행
	public void modifyUserInfo(Mb_Bean updateMbBean) {
			
		mbMapper.modifyUserInfo(updateMbBean);

	}
		
	// 삭제할 정보 가져오기
	public Mb_Bean deleteMbBean(String mb_id) {
			
		return mbMapper.deleteMbBean(mb_id);
	
	}

	// 회원정보 삭제 실시
	public void deleteUserInfo(Mb_Bean deleteMbBean) {
			
		mbMapper.deleteUserInfo(deleteMbBean);
		
	}
		
	//수정할 회원정보 가져오기
	public Mb_Bean getModifyUserInfo(String mb_id) {
			
		return mbMapper.getMbInfo(mb_id);
		
	}
	
}