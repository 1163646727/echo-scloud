package com.echo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * className: WebSecurityConfig <BR>
 * description: 安全配置<BR>
 * remark: <BR>
 * author: 1024 <BR>
 * createDate: 2020-06-28 10:13 <BR>
 */
@Configuration /* 就相当于springmvc.xml文件 ChenQi*/
@EnableGlobalMethodSecurity(securedEnabled = true,prePostEnabled = true)//开启基于方法授权
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    /**
     * methodName: authenticationManagerBean <BR>
     * description: 认证管理器 <BR>
     * remark: <BR>
     * param:  <BR>
     * return: org.springframework.security.authentication.AuthenticationManager <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 11:34 <BR>
     */
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    /**
     * methodName: passwordEncoder <BR>
     * description: 密码编码器 <BR>
     * remark: <BR>
     * param:  <BR>
     * return: org.springframework.security.crypto.password.PasswordEncoder <BR>
     * author: ChenQi <BR>
     * createDate: 2020-06-29 23:44 <BR>
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        /* 使用BCrypt编码格式 ChenQi*/
        return new BCryptPasswordEncoder();
    }

    //安全拦截机制（最重要）
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // 屏蔽CSRF控制，即spring security不再限制CSRF 1024
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/login*").permitAll()
                .anyRequest().authenticated()
                .anyRequest().permitAll()
                .and()
                .formLogin()
        ;
    }
}
