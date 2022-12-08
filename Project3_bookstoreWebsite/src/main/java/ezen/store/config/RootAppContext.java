package ezen.store.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import ezen.store.beans.Mb_Bean;

@Configuration
public class RootAppContext {
	
	  //Mb_login.jsp에서 다루는 데이터를 loginMbBean 객체에 저장할 예정 입니다.
	  // 그리고, Mb_login.jsp에서 다룰 실제 빈은 tempMbBean이라고 설정하고 사용 예정입니다.
	  @Bean("loginMbBean")
	  @SessionScope public Mb_Bean loginMbBean() { 
		  return new Mb_Bean(); 
	}
	 
}
