package ezen.store.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import ezen.store.beans.Bk_Bean;

public class Bk_Validator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return Bk_Bean.class.isAssignableFrom(clazz); 
	
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Bk_Bean bk_Bean = (Bk_Bean) target;
		
		String beanName = errors.getObjectName();
		
		// 아이디 중복 확인 체크
		if(beanName.equals("InsertBkBean")) {
			if(bk_Bean.isBk_numExist() == false) {
				errors.rejectValue("bk_number", "DontCheckBk_numExist");
			}
		}
		
	}

}
