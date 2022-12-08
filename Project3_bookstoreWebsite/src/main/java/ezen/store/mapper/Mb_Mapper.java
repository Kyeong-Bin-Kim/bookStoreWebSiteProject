package ezen.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ezen.store.beans.Mb_Bean;

public interface Mb_Mapper {

	// 로그인 유저 체크 SQL
	@Select("select * from Member_info where mb_id = #{mb_id} and mb_pw = #{mb_pw} and mb_deleted = '0'")
	Mb_Bean getloginUserInfo(Mb_Bean tempMbBean);
		
	// 아이디 중복체크 SQL
	@Select("select mb_name from Member_info where mb_id = #{mb_id}")
	String checkUserIdExist(String mb_id);
	
	// 회원가입 입력 SQL
	@Insert("insert into Member_info (mb_id, mb_pw, mb_name, mb_email, mb_tel, mb_deleted) values (#{mb_id}, #{mb_pw}, #{mb_name}, #{mb_email}, #{mb_tel}, '0')")
	void addUserInfo(Mb_Bean insertMbBean);
	
	// 전체 리스트 받아오기 SQL
	@Select("select * from Member_info")
	List<Mb_Bean> getMbList();
		
	// 전체 회원 수
	@Select("select count(*) from Member_info")
	int getCntMember();

	// 상세정보 받아오기 SQL
	@Select("select * from Member_info where mb_id = #{mb_id}")
	Mb_Bean getMbInfo(String mb_id);

	// 수정 실행 SQL문
	@Update("update Member_info set mb_name = #{mb_name}, mb_pw = #{mb_pw3}, mb_email = #{mb_email}, mb_tel = #{mb_tel} where mb_id = #{mb_id}")
	void modifyUserInfo(Mb_Bean updateMbBean);

	
	// 삭제할 정보 받아오기 SQL
	@Select("select * from Member_info where mb_id = #{mb_id} and mb_pw={mb_pw}")
	Mb_Bean deleteMbBean(@Param("mb_id") String mb_id);
	
	// 삭제 실행 SQL
	@Update("update Member_info set mb_deleted = 'deleted', mb_deleted_date = sysdate where mb_id = #{mb_id} and mb_pw = #{mb_pw}")
	void deleteUserInfo(Mb_Bean deleteMbBean);

}