package ezen.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ezen.store.beans.Dv_Bean;

public interface Dv_Mapper {
	
	//중복확인
	@Select("select count(*) from Delivery_info where dv_pk = #{dv_pk}")
	int CheckDvNick(String dv_pk);
	
	//배송지 조회
	@Select("select * from Delivery_info where mb_id = #{mb_id}")
	List<Dv_Bean> getDvList(String mb_id);
		
	//배송지 입력
	@Insert("insert into Delivery_info(mb_id, dv_nick, dv_name, dv_tel, dv_address, dv_pk)"
	+ "values(#{mb_id}, #{dv_nick}, #{dv_name}, #{dv_tel}, #{dv_address}||' '||#{dv_addressDetail}, concat(concat(#{mb_id},'.'),#{dv_nick}))")
	void addDvInfo(Dv_Bean InsertDvBean);
	
	//배송지 수정 
	@Select("select * from Delivery_info where dv_pk = concat(concat(#{mb_id},'.'),#{dv_nick})")
	Dv_Bean UpdateDvBean(@Param("mb_id") String mb_id, @Param("dv_nick") String dv_nick);
	
	@Update("update Delivery_info set dv_nick = #{dv_nick}, dv_name = #{dv_name}, dv_tel = #{dv_tel}, dv_address = #{dv_address}, dv_pk = concat(concat(#{mb_id},'.'),#{dv_nick})" 
			+"where dv_pk = #{dv_pk}")
	void UpdateDvInfo(Dv_Bean UpdateDvBean);
	
	//배송지 삭제
	@Delete("delete Delivery_info where dv_pk = concat(concat(#{mb_id},'.'),#{dv_nick})")
	void DeleteDvInfo(@Param("mb_id") String mb_id, @Param("dv_nick") String dv_nick);
}
