package ezen.store.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import ezen.store.beans.Dv_Bean;

public class Dv_Validator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {	
		
		return Dv_Bean.class.isAssignableFrom(clazz); 
	
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Dv_Bean dv_Bean = (Dv_Bean) target;
		
		String beanName = errors.getObjectName();
		
		// 아이디 중복 확인 체크
		if(beanName.equals("InsertBkBean")) {
			if(dv_Bean.isDv_numExist() == false) {
				errors.rejectValue("mb_id", "DontCheckDv_nickExist");
			}
		}
		
	}

}