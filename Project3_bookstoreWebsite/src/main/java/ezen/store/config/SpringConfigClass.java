package ezen.store.config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer{
	
	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {ServletAppContext.class};
	}
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppContext.class};
	}
	
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		return new Filter[] {encodingFilter};
	}
	
	@Override
	protected void customizeRegistration(Dynamic registration) {
		super.customizeRegistration(registration);
		
		//																	10MB 사이즈의 크기를 지닌 이미지 저장
		MultipartConfigElement configElement = new MultipartConfigElement(null, 1024*1024*5, 1024*1024*10, 0);
		registration.setMultipartConfig(configElement); 
	}
	
}


















