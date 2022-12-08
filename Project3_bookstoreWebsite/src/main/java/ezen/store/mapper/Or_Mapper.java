package ezen.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ezen.store.beans.Bk_Bean;
import ezen.store.beans.Or_Bean;
import ezen.store.beans.Or_items;

public interface Or_Mapper {
	
		//모든 주문 list 출력
		@Select("select * from order_info where not or_status = '0'")
		List<Or_Bean> OrAllList();
		
		//주문 list 개수 출력
		@Select("select count(*) from order_info where not or_status = '0' order by or_date desc")
		int getOrAllCount();
		
		//주문 list 출력
		@Select("select *\r\n"
			+ "    from order_info\r\n"
			+ "    where mb_id in (select mb_id\r\n"
			+ "                        from Member_info\r\n"
			+ "                        where mb_id = #{mb_id})"
			+ "		and not or_status = '0'"
			+ "		order by or_date desc")
		List<Or_Bean> OrList(String mb_id);
		
		//주문 list 개수 출력
		@Select("select count(*)\r\n"
				+ "    from order_info\r\n"
				+ "    where mb_id in (select mb_id\r\n"
				+ "                        from Member_info\r\n"
				+ "                        where mb_id = #{mb_id})"
				+ "		and not or_status = '0'")
		int getOrCount(String mb_id);
		
		//주문 상세 정보 select
		@Select("select *\r\n"
				+ "    from order_info\r\n"
				+ "    where mb_id in (select mb_id\r\n"
				+ "			             from  Member_info\r\n"
				+ "	                       where mb_id = #{mb_id})\r\n"
				+ "		and or_number = #{or_number}")
		List<Or_Bean> getOrInfo (@Param("mb_id") String mb_id, @Param("or_number") String or_number);
		
		//주문 items select
		@Select("select or_number, bk_title, bk_image, bk_number, bk_price, ori_bkdiscount, ori_bkcount\r\n"
				+ "    from order_items natural join book_info\r\n"
				+ "    where or_number in (select or_number from Order_info where or_number = #{or_number})")
		List<Or_Bean> OrSelect(String or_number);
		
		//주문 상세 items 개수 출력
		@Select("select count(*)\r\n"
				+ "		from order_items\r\n"
				+ "    where or_number = #{or_number}")
		int getOrItemCount(String or_number);
		
		//mb_id 일치하는 회원(주문자)정보 select
		@Select("select mb_id, dv_nick, dv_name, dv_tel, dv_address"
				+ "		from delivery_info"
				+ "		where mb_id = #{mb_id}"
				+ "		and dv_pk = #{dv_pk}")
		Or_Bean DvSelect(String mb_id, String dv_pk);
		
		//주문 확정
		@Update("update order_info set mb_name = #{mb_name}, mb_tel = #{mb_tel}, or_status = '구매 확정', or_delivery = #{or_delivery}, or_deliveryCost = #{or_deliveryCost}, dv_name = #{dv_name}, dv_tel = #{dv_tel}, dv_address = #{dv_address}, or_date = sysdate\r\n"
				+ "		where mb_id = #{mb_id}\r\n"
				+ "		and or_number = #{or_number}")
		void UpdateOrPurchase(Or_Bean updateOrPurchase);
		
		//주문 status 수정(환불 등)
		@Update("update order_info set or_status = #{or_status}\r\n"
				+ "		where mb_id = #{mb_id}\r\n"
				+ "		and or_number = #{or_number}")
		void OrUpdateAfter(Or_Bean updateOrBean);
		
		//mb_id 일치하는 주문 결제 완료로 표시하기 위한 select
		@Select("select or_number, mb_id, mb_name, mb_tel, or_status, or_date, or_delivery, or_deliveryCost, dv_name, dv_tel, dv_address\r\n"
				+ "    from order_info\r\n"
				+ "    where mb_id in (select mb_id\r\n"
				+ "			             from  Member_info\r\n"
				+ "	                       where mb_id = #{mb_id})\r\n"
				+ "		and or_number = #{or_number}")
		Or_Bean UpdateOrBean (@Param("mb_id") String mb_id, @Param("or_number") String or_number);
		
		
		//주문 상황 수정(책 재고)
		//or number 일치하는 items select
		@Select("select ori.or_number, bk.bk_title, bk.bk_image, ori.bk_number, ori.bk_price, ori.ori_bkdiscount, ori.ori_bkcount\r\n"
				+ "    from order_items ori, book_info bk\r\n"
				+ "    where or_number in (select or_number from Order_info where or_number = #{or_number})"
				+ "		and ori.bk_number = bk.bk_number")
		List<Or_Bean> UpdateOriBean(String or_number);
		
		//책 재고 수 수정 select
		@Select("select bk.bk_number, bk.bk_quantity from book_info bk, order_items ori where bk.bk_number = ori.bk_number and or_number = #{or_number} order by bk.bk_number")
		List<Or_items> SelectBkQuantity (String or_number);
		
		//주문 확정 후 책의 재고수 감소
		@Select("select bk.bk_number, (bk.bk_quantity - ori.ori_bkcount) as bk_quantity, bk.bk_image from book_info bk, order_items ori where ori.or_number = #{or_number} and bk.bk_number = #{bk_number} and bk.bk_number = ori.bk_number")
		Or_Bean SelectBkPurchase(@Param("or_number") String or_number, @Param("bk_number") int bk_number);
		
		//주문 환불 후 책의 재고수 증가
		@Select("select bk.bk_number, (bk.bk_quantity + ori.ori_bkcount) as bk_quantity from book_info bk, order_items ori where ori.or_number = #{or_number} and bk.bk_number = #{bk_number} and bk.bk_number = ori.bk_number")
		Or_Bean SelectBkAfter(@Param("or_number") String or_number, @Param("bk_number") int bk_number);
		
		//주문 확정/환불 후 책 재고수 update
		@Update("update book_info set bk_quantity = #{bk_quantity}\r\n"
				+ "		where bk_number in #{bk_number}")
		void UpdateBkQuantity(Or_Bean updateBkBean);
		
		//베스트셀러
		@Select("select bk_number,count(bk_number) as count from order_items group by bk_number order by count")
		List<Or_Bean> Orbest();
		
		//해당 책에 있는 리뷰 평점을 추출하여 가져와 평균을 냅니다.
		@Select("select nvl(avg(rv_score), 0) as avg_score from Review_info where bk_number = #{bk_number}")
		double getBkScore(int bk_number);
		
		//책 정보를 추출하여 가져옵니다.
				@Select("select bk_number, bk_title, bk_writer, bk_publisher, to_char(bk_pubdate, 'YYYY-MM-DD') as bk_pubdate, bk_image, bk_local, bk_genre, bk_infodate,"
						+ " bk_detail, bk_quantity, bk_price, bk_title_upper, bk_deleted from Book_info where bk_number = #{bk_number}")
				Bk_Bean getBkInfo(int bk_number);
		
}
