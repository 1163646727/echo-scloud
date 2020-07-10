package com.echo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;

/**
 * className: ResouceServerConfig <BR>
 * description: 资源服务 <BR>
 * remark: <BR>
 * author: ChenQi <BR>
 * createDate: 2020-07-05 14:40 <BR>
 */
@Configuration
// 标记此类为资源服务 ChenQi
@EnableResourceServer
public class ResouceServerConfig{

    /** 定义一个默认的资源ChenQi*/
    public static final String RESOURCE_ID = "pri";


    /**
     * className: ResouceServerConfig <BR>
     * description: 认证服务的资源配置<BR>
     * remark: <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 21:21 <BR>
     */
    @Configuration
    @EnableResourceServer
    public class AuthServerConfig extends ResourceServerConfigurerAdapter {

        @Autowired
        private TokenStore tokenStore;

        @Override
        public void configure(ResourceServerSecurityConfigurer resources){
            resources.tokenStore(tokenStore).resourceId(RESOURCE_ID)
                    .stateless(true);
        }

        @Override
        public void configure(HttpSecurity http) throws Exception {
            http.authorizeRequests()
                    /** 设置/auth的请求，全部放行 ChenQi*/
                    .antMatchers("/auth/**").permitAll();
        }

    }

    /**
     * className: ResouceServerConfig <BR>
     * description: Order服务的资源配置<BR>
     * remark: <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 21:22 <BR>
     */
    @Configuration
    @EnableResourceServer
    public class OrderServerConfig extends ResourceServerConfigurerAdapter {
        @Autowired
        private TokenStore tokenStore;

        @Override
        public void configure(ResourceServerSecurityConfigurer resources){
            resources.tokenStore(tokenStore).resourceId(RESOURCE_ID)
                    .stateless(true);
        }

        @Override
        public void configure(HttpSecurity http) throws Exception {
            http
                    .authorizeRequests()
                    /** 以/order开头的请求，判断是否有'ORDER'的权限 ChenQi*/
                    .antMatchers("/order/**").access("#oauth2.hasScope('ORDER')");
        }
    }

}
