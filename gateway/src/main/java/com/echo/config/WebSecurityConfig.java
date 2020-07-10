package com.echo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

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


    //安全拦截机制（最重要）
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/**").permitAll()
                .and().csrf().disable();
    }
}
