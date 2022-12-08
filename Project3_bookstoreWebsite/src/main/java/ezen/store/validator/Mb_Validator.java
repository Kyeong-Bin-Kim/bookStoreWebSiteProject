package ezen.store.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import ezen.store.beans.Mb_Bean;

public class Mb_Validator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {

		return Mb_Bean.class.isAssignableFrom(clazz);
		
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Mb_Bean mbBean = (Mb_Bean) target;

		String beanName = errors.getObjectName();
		
	

		// 로그인시에 체크하므로 loginMbBean이므로 아래 내용을 실행하지 않고 통과합니다.
		if (beanName.equals("insertMbBean")) {

			// 회원가입시 패스워드 체크에 사용하는 부분
			if (mbBean.isMbPw12()== false) {
				
				errors.rejectValue("mb_pw", "NotEquals");
				errors.rejectValue("mb_pw2", "NotEquals");
			}
			
		}
		
		// 정보 수정시에 패스워드 체크에 사용하는 부분
		if (beanName.equals("updateMbBean")){

			// 정보 수정시에 패스워드 체크에 사용하는 부분
			if (mbBean.isMbPw12()== false) {
				
				errors.rejectValue("mb_pw", "NotEquals");
			    errors.rejectValue("mb_pw2", "NotEquals");
			   
			}
			    
			// 회원정보 수정시 패스워드 체크에 사용한 부분
			if (mbBean.isMbPw34()==false) {
				
			    errors.rejectValue("mb_pw3", "NotEquals");
			    errors.rejectValue("mb_pw4", "NotEquals");
			    
			}
			
		}
				
		//삭제시
		if (beanName.equals("deleteMbBean")){
				
			if (mbBean.isMbPw12()== false) {
				
				errors.rejectValue("mb_pw", "NotEquals");
				errors.rejectValue("mb_pw2", "NotEquals");
				
			}
				
		}
			
		// 아이디 입력시 중복 체크
		if (beanName.equals("insertMbBean")) {
			if (mbBean.isMbIdExist() == false) {
				errors.rejectValue("mb_id", "DontCheckUserIdExist");
			}
		}
      
	}
   
}

/*
 * ValidatorCustermarizing ----------------------------------- - Validator 1)
 * JSR-303, JSR-380 스펙을 이용한 유효성 검사 방법을 학습하였고, 유효성 검사를 하기 위해 Hibernate 를 사용하였습니다.
 * 2) 이번에는 Validator를 직접 만들어 보도록 하겠습니다. JSR-303, JSR-380 스펙으로 유효성 검사를 한 후 추가적으로
 * 다른 유효성 검사를 하고자 할 때 사용.
 * 
 * 3) Validator 인터페이스 구현 - 먼저 Validator 인터페이스를 구현해야 합니다. - supports : 유효성 검사할
 * 데이터를 가지고 있는 객체가 유효성 검사가 가능한지 확인합니다. - validate : 유효성 검사를 하는 메서드
 * 
 * 4) Validator를 컨트롤러에서 등록 - Validator를 컨트롤러에서 등록해줍니다. - 사용할 Validator가 하나면
 * setValidator, 한 개 이상이면 addValidators 메서드를 사용합니다 - @InitBinder protected void
 * initBinder(WebDataBinder binder) { DataBeanValidator validator1 = new
 * DataBeanValidator(); binder.setValidator(validator1); }
 * 
 * 5) ValidateUtils - 지정된 값에 대해 유효성 검사를 하는 메서드 - rejectIfEmpty(error객체,
 * “프로퍼티이름“, “코드이름“) : 값이 비어 있는지 확인합니다. 공백은 글자로 취급합니다. -
 * rejectIfEmptyOrWhitespace(error객체, “프로퍼티이름“, “코드이름“) : 값이 비어 있거나 공백으로만 구성되어
 * 있는지 확인합니다. - 입력값에 문제가 있다면 error 객체에 오류정보를 저장합니다. - 사용할 오류 메시지는
 * “코드이름.bean객체이름.프로퍼티이름”으로 구성됩니다.
 * 
 * 6) rejectValue - 유효성 조건을 직접 만들어 검사할 때 사용합니다. - If문으로 유효성 검사를 해주고 위배시
 * rejectValue를 통해 오류 정보를 지정합니다.. - rejectValue( “프로퍼티이름“, “코드이름“) - 입력값에 문제가
 * 있다면 error 객체에 오류정보를 저장합니다. - 사용할 오류 메시지는 “코드이름.bean객체이름.프로퍼티이름”으로 구성됩니다.
 */
