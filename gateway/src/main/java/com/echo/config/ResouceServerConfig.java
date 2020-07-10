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

    /*@Autowired
    private TokenStore tokenStore;*/

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











/*    @Autowired
    TokenStore tokenStore;*/

/*    @Override
    public void configure(ResourceServerSecurityConfigurer resources) {
        resources.resourceId(RESOURCE_ID)//资源 id
                *//** 设置token校验，因为采用了JWT令牌格式，所以这里无需远程校验，本地校验即可 ChenQi*//*
                .tokenStore(tokenStore)
                // .tokenServices(tokenService())//验证令牌的服务
                .stateless(true);
    }*/

    /**
     * methodName: configure <BR>
     * description: 安全配置 <BR>
     * remark: <BR>
     * param: http <BR>
     * return: void <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 14:42 <BR>
     */
/*    @Override
    public void configure(HttpSecurity http) throws Exception {

        http
                .authorizeRequests()
                *//** #oauth2.hasScope()   允许的授权范围 ChenQi*//*
                .antMatchers("/**").access("#oauth2.hasScope('all')")
                .and().csrf().disable()
                *//** 设置session无效 ChenQi*//*
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    }*/

    /**
     * methodName: tokenService <BR>
     * description: 验证令牌的服务 <BR>
     * remark: 资源服务令牌解析服务<BR>
     * param:  <BR>
     * return: org.springframework.security.oauth2.provider.token.ResourceServerTokenServices <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 14:46 <BR>
     */
/*    @Bean
    public ResourceServerTokenServices tokenService() {
        //使用远程服务请求授权服务器校验token,必须指定校验token 的url、client_id，client_secret
        RemoteTokenServices service=new RemoteTokenServices();
        // 设置验证令牌的地址 ChenQi
        service.setCheckTokenEndpointUrl("http://localhost:53020/auth/oauth/check_token");
        service.setClientId("c1");
        service.setClientSecret("secret");
        return service;
    }*/

}
