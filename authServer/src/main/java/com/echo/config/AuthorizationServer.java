package com.echo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;
import org.springframework.security.oauth2.provider.code.AuthorizationCodeServices;
import org.springframework.security.oauth2.provider.code.JdbcAuthorizationCodeServices;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

import javax.sql.DataSource;
import java.util.Arrays;

/**
 * className: AuthorizationServer <BR>
 * description: 认证授权服务 配置类<BR>
 * remark: 主要做三件事<BR>
 *     配置客户端详情服务<BR>
 *     配置令牌管理服务和令牌访问端点<BR>
 *     配置令牌端点的安全约束<BR>
 * auther: ChenQi <BR>
 * date: 2020/7/5 10:01 <BR>
 * version 1.0 jdk1.8 <BR>
 */
@Configuration
/** 标记该类是认证授权服务 ChenQi*/
@EnableAuthorizationServer
public class AuthorizationServer extends AuthorizationServerConfigurerAdapter {

    /** 注入令牌存储策略 ChenQi*/
    @Autowired
    private TokenStore tokenStore;

    /** 注入客户端详情服务 ChenQi*/
    @Autowired
    private ClientDetailsService clientDetailsService;

    @Autowired
    private JwtAccessTokenConverter accessTokenConverter;

    /** 注入授权码授权类型服务 ChenQi*/
    @Autowired
    private AuthorizationCodeServices authorizationCodeServices;

    /** 注入认证管理器（密码授权类型服务） ChenQi*/
    @Autowired
    private AuthenticationManager authenticationManager;

    /** 注入密码编码器 ChenQi*/
    @Autowired
    private PasswordEncoder passwordEncoder;

    /**
     * methodName: configure <BR>
     * description:  配置客户端详情服务<BR>
     * remark: <BR>
     * param: clients 客户端信息<BR>
     * return: void <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 10:09 <BR>
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients)
            throws Exception {

        // 设置客户端详情服务，客户端信息已经自定义从数据库中获取 ChenQi
        clients.withClientDetails(clientDetailsService);

        /* 暂时将客户端详情服务配置，放到内存 ChenQi*/
      /*  clients.inMemory()// 使用in-memory 内存方式存储
                .withClient("c1")// 客户端id
                .secret(new BCryptPasswordEncoder ().encode("secret"))//客户端密钥
                .resourceIds("res1")//客户端可以访问的资源列表
                // 该client允许的授权类型：authorization_code,password,refresh_token,implicit,client_credentials，这5中类型也是OAuth2.0支持的类型
                .authorizedGrantTypes("authorization_code", "password","client_credentials","implicit","refresh_token")
                .scopes("all")// 允许的授权范围
                .autoApprove(false)//false：如果授权类型是password，跳转到授权页面；如果是true的话，直接发令牌不用跳转到授权页面。
                //加上验证回调地址
                .redirectUris("http://www.baidu.com")*/
        ;
    }

    /**
     * methodName: clientDetailsService <BR>
     * description: 自定义客户端信服务<BR>
     * remark: 从数据库中获取客户端信息<BR>
     * param: dataSource <BR>
     * return: org.springframework.security.oauth2.provider.ClientDetailsService <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 19:53 <BR>
     */
    @Bean
    public ClientDetailsService clientDetailsService(DataSource dataSource) {
        ClientDetailsService clientDetailsService = new JdbcClientDetailsService (dataSource);
        ((JdbcClientDetailsService) clientDetailsService).setPasswordEncoder(passwordEncoder);
        return clientDetailsService;
    }

    /**
     * methodName: tokenService <BR>
     * description:  配置令牌管理服务<BR>
     * remark: <BR>
     * param:  <BR>
     * return: org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 10:26 <BR>
     */
    @Bean
    public AuthorizationServerTokenServices tokenService() {
        DefaultTokenServices service=new DefaultTokenServices();
        /* 设置客户端详情服务 ChenQi*/
        service.setClientDetailsService(clientDetailsService);
        // 设置是否支持刷新令牌 ChenQi
        service.setSupportRefreshToken(true);
        // 设置令牌存储策略 ChenQi
        service.setTokenStore(tokenStore);
        service.setAccessTokenValiditySeconds(7200); // 令牌默认有效期2小时
        service.setRefreshTokenValiditySeconds(259200); // 刷新令牌默认有效期3天

        /** 设置JWT令牌格式 ChenQi*/
        TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
        tokenEnhancerChain.setTokenEnhancers(Arrays.asList(accessTokenConverter));
        service.setTokenEnhancer(tokenEnhancerChain);
        return service;
    }

    //设置授权码模式的授权码如何存取，暂时采用内存方式
/*    @Bean
    public AuthorizationCodeServices authorizationCodeServices() {
        return new InMemoryAuthorizationCodeServices ();
    }*/

    /**
     * methodName: authorizationCodeServices <BR>
     * description: 自定义授权码服务<BR>
     * remark: 设置授权码模式的授权码，从数据库中存取<BR>
     * param: dataSource <BR>
     * return: org.springframework.security.oauth2.provider.code.AuthorizationCodeServices <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 19:56 <BR>
     */
    @Bean
    public AuthorizationCodeServices authorizationCodeServices(DataSource dataSource) {
        //设置授权码模式的授权码从数据库中存取
        return new JdbcAuthorizationCodeServices (dataSource);
    }

    /**
     * methodName: configure <BR>
     * description:  配置令牌访问端点<BR>
     * remark: <BR>
     * param: endpoints <BR>
     * return: void <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 10:36 <BR>
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        endpoints
                /* 设置 认证管理器（密码授权类型）
                当选择了资源所有者密码（password）授权类型的时候，请设置 这个属性注入一个 AuthenticationManager 对象ChenQi*/
                .authenticationManager(authenticationManager)
                // 设置 授权码授权类型 服务 ChenQi
                .authorizationCodeServices(authorizationCodeServices)
                // 设置 令牌管理服务 ChenQi
                .tokenServices(tokenService())
                // 设置 允许post提交访问令牌 ChenQi
                .allowedTokenEndpointRequestMethods(HttpMethod.POST);
    }

    /**
     * methodName: configure <BR>
     * description:  配置令牌端点(Token Endpoint)的安全约束<BR>
     * remark: <BR>
     * param: security <BR>
     * return: void <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 10:45 <BR>
     */
    @Override
    public void configure(AuthorizationServerSecurityConfigurer security){
        security
                /** 公开/oauth/token_key ChenQi*/
                .tokenKeyAccess("permitAll()")
                /** 公开/oauth/check_token ChenQi*/
                .checkTokenAccess("permitAll()")
                /* 设置允许表单认证（申请令牌） ChenQi*/
                .allowFormAuthenticationForClients()
        ;
    }
}
