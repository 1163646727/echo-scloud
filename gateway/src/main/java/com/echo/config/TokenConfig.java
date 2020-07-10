package com.echo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

/**
 * className: TokenConfig <BR>
 * description: 令牌管理的类<BR>
 * remark: <BR>
 * author: ChenQi <BR>
 * createDate: 2020-07-05 10:19 <BR>
 */
@Configuration
public class TokenConfig {

    /** JWT密钥 ChenQi*/
    private String SIGNING_KEY = "auth123";

    /**
     * methodName: tokenStore <BR>
     * description:  设置令牌存储策略<BR>
     * remark: <BR>
     * param:  <BR>
     * return: org.springframework.security.oauth2.provider.token.TokenStore <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 10:19 <BR>
     */
    @Bean
    public TokenStore tokenStore() {
        // 生成普通令牌，存储在内存中 ChenQi
        // return new InMemoryTokenStore();
        // JWT令牌存储方案 ChenQi
        return new JwtTokenStore(accessTokenConverter());
    }

    /**
     * methodName: accessTokenConverter <BR>
     * description: 配置JWT服务 <BR>
     * remark: <BR>
     * param:  <BR>
     * return: org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-05 15:28 <BR>
     */
    @Bean
    public JwtAccessTokenConverter accessTokenConverter() {
        JwtAccessTokenConverter converter = new JwtAccessTokenConverter();
        converter.setSigningKey(SIGNING_KEY); //对称秘钥，资源服务器使用该秘钥来验证
        return converter;
    }

}
