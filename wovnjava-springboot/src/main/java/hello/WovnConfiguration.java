package hello;

import com.github.wovnio.wovnjava.WovnServletFilter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.boot.web.servlet.FilterRegistrationBean;


@Configuration
class WovnConfiguration {
    @Bean
    public FilterRegistrationBean wovnFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new WovnServletFilter());
        registration.addUrlPatterns("/*");
        registration.addInitParameter("projectToken", "Token");
        registration.addInitParameter("defaultLang", "ja");
        registration.addInitParameter("supportedLangs", "ja,en,fr");
        registration.addInitParameter("urlPattern", "query");
        registration.addInitParameter("debugMode", "1");
        registration.setName("wovnFilter");
        registration.setOrder(1);
        return registration;
    }
}
