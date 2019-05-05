package com.myschoolfriend.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	CustomSuccessHandler customSuccessHandler;

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("18").password("abc123").roles("STUDENT");
		auth.inMemoryAuthentication().withUser("21").password("abc123").roles("TEACHER");
		auth.inMemoryAuthentication().withUser("admin").password("root123").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("dba").password("root123").roles("ADMIN", "DBA");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/studentportal").access("hasRole('STUDENT')").antMatchers("/teacherportal")
				.access("hasRole('TEACHER')")
				.antMatchers("/", "/admin/**", "/list", "/student", "/administrator", "/addsection", "/addclass",
						"/searchstudent", "/preparequestionpaper", "/staffonboard","/upload-studoc-{id}")
				.access("hasRole('ADMIN')").antMatchers("/db/**").access("hasRole('ADMIN') and hasRole('DBA')").and()
				.formLogin().loginPage("/login").successHandler(customSuccessHandler).usernameParameter("ssoId")
				.passwordParameter("password").and().csrf().and().exceptionHandling()
				.accessDeniedPage("/Access_Denied");
	}

}
