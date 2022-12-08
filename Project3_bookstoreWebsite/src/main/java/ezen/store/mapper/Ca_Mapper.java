package ezen.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ezen.store.beans.Ca_Bean;

public interface Ca_Mapper {
	
	@Select("select b.bk_number,bk_title,bk_writer,bk_publisher,bk_image,bk_quantity,bk_price,b.ca_bkcount\n"
			+ "    from book_info a, (select bk_number,ca_bkcount,row_number() over (partition by bk_number order by ca_bkcount desc) as rank from cart_info where mb_id = #{ca_mbid}) b\n"
			+ "    where a.bk_number = b.bk_number\n"
			+ "    and rank = 1")
	List<Ca_Bean> getCartInfo(String ca_mbid);

	@Insert("insert into cart_info(mb_id,bk_number) values(#{ca_mbid},#{ca_bknumbers})")
	void addCartStuff(@Param("ca_mbid") String ca_mbid,@Param("ca_bknumbers")int ca_bknumbers);
		
	@Delete("delete from Cart_info where mb_id = #{ca_mbid} AND bk_number = #{ca_bknumbers}")
	void delcart(@Param("ca_mbid") String ca_mbid,@Param("ca_bknumbers")int ca_bknumbers);
	
	@Delete("delete from Cart_info where mb_id = #{ca_mbid}")
	void delcartAll(String ca_mbid);
	
	@Delete("delete from order_info where mb_id in #{ca_mbid} And or_status = '결제중'")
	void delPreOrder(String ca_mbid);
	
	@Delete("delete from order_items where or_number in (select or_number from order_info where mb_id = #{ca_mbid}"
			+ "and or_status = '결제중')")
	void delPreOrderItems(String ca_mbid);
	
	@Update("update cart_info set ca_bkcount = ca_bkcount + 1 where mb_id = #{ca_mbid} and bk_number = #{ca_bknumbers}")
	void plusBookCount(@Param("ca_mbid") String ca_mbid,@Param("ca_bknumbers")int ca_bknumbers);
	
	@Update("update cart_info set ca_bkcount = ca_bkcount - 1 where mb_id = #{ca_mbid} and bk_number = #{ca_bknumbers}")
	void minusBookCount(@Param("ca_mbid") String ca_mbid,@Param("ca_bknumbers")int ca_bknumbers);
	
	@Update("update cart_info set ca_bkcount = #{ca_bkcount} where mb_id = #{ca_mbid} and bk_number = #{ca_bknumbers}")
	void setBookCount(@Param("ca_mbid") String ca_mbid,@Param("ca_bknumbers")int ca_bknumbers,@Param("ca_bkcount") int newval);
	
	@Insert("insert into order_info(or_number,mb_id) values(#{or_number},#{ca_mbid})")
	void createOderInfo(@Param("or_number")String or_number,@Param("ca_mbid") String ca_mbid);
	
	@Insert("insert into order_items(or_number, bk_number, bk_price,ori_bkdiscount,ori_bkcount) values(#{or_number},"
			+ "#{ca_bknumbers},"
			+ "(select bk_price from book_info where bk_number = #{ca_bknumbers}),"
			+ "0,"
			+ "#{ca_bkcount})")
	void insertOderItems(@Param("or_number")String or_number,@Param("ca_bknumbers")int ca_bknumbers,@Param("ca_mbid") String ca_mbid,@Param("ca_bkcount") int ca_bkcount);
	
	@Insert("insert into order_items(or_number, bk_number, bk_price,ori_bkdiscount,ori_bkcount) values(#{or_number},\r\n"
			+ "#{ca_bknumbers},\r\n"
			+ "(select bk_price from book_info where bk_number = #{ca_bknumbers}),\r\n"
			+ "0,\r\n"
			+ "#{ca_bkcount})")
	void insertOderItem(@Param("or_number")String or_number,@Param("ca_bknumbers")int ca_bknumbers,@Param("ca_mbid") String ca_mbid,@Param("ca_bkcount") int ca_bkcount) ;
	
	
	@Select("select or_number from order_info where or_number = #{or_number}")
	String checkOrderNumExist(String or_number);
	
}
