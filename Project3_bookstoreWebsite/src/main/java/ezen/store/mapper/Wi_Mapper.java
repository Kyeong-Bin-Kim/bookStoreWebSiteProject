package ezen.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import ezen.store.beans.Wi_Bean;

public interface Wi_Mapper {
	
	@Select("select bk_number,bk_title,bk_writer,bk_publisher,bk_image,bk_quantity,bk_price\r\n"
			+ "    from Book_info\r\n"
			+ "    where bk_number in (select bk_number\r\n"
			+ "                        from  Wish_info\r\n"
			+ "                        where mb_id = #{wi_mbid})")
	List<Wi_Bean> getWishInfo(String wi_mbid);
	
	//페이지네이션
	@Select("select count(*) from wish_info where mb_id = #{wi_mbid}")
		int getContentCnt(String wi_mbid);
		
	@Insert("insert into Wish_info(mb_id,bk_number) values(#{wi_mbid},#{wi_bknumbers})")
		void addWishStuff(@Param("wi_mbid") String wi_mbid,@Param("wi_bknumbers")int wi_bknumbers);
		
	@Delete("delete from Wish_info where bk_number = #{wi_bknumbers}")
		void delwish(@Param("wi_mbid") String wi_mbid,@Param("wi_bknumbers")int wi_bknumbers);
	
	@Delete("delete from Wish_info where mb_id = #{wi_mbid}")
		void delwishAll(String wi_mbid);
	
	//check
	@Select("select mb_id,bk_number from Wish_info where mb_id = #{wi_mbid}"
			+ " and bk_number = #{wi_bknumbers}")
	String checkWishHeart(@Param("wi_mbid") String wi_mbid,@Param("wi_bknumbers")int wi_bknumbers);
}
