package ezen.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import ezen.store.service.Bk_Service;

// html형태의 데이터가 아니라면 사용합니다. 아니라면 json으로 처리를 합니다.
@RestController
public class Bk_RestController {

	
	@Autowired
	Bk_Service BkSevice;
	
	//책 일련번호 중복 체크 관련 컨트롤러
	@GetMapping("/book/CheckBkNumExist/{bk_number}")
	public String restApiControll(@PathVariable int bk_number) {
		
		boolean chk = BkSevice.CheckBkNumExist(bk_number);
		
		return chk + "";
		
	}
	
	// 책정보 삭제(수정) 기능 컨트롤러
	@GetMapping("/book/BkDeletePro/{bk_number}")
	public String bkDeletePro(@PathVariable int bk_number) {		
		
		BkSevice.deleteBook(bk_number);
		
		return null;
		
	}
	
}
