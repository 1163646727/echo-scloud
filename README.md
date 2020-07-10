# echo-scloud
## 介绍
echo-scloud是一套微服务的解决方案，提供了服务发现、服务治理、配置管理、授权服务等。
应用服务参看[enter description here](https://github.com/1163646727/echo-business)。
echo的含义：Echo是希腊神话中是山林女神，著名作家三毛的英文名也是Echo，也感谢现实中的女神谈倩倩女士。


# 1. authService授权服务
## 自定义获取用户信息
com.echo.service.UserDetailsServicePri，需要实现UserDetailsService，重写UserDetails方法。
主要做：

 - 根据登录名称从数据库获取用户信息
 - 设置用户的权限集

## 认证授权服务配置类
com.echo.config.AuthorizationServer，需要继承AuthorizationServerConfigurerAdapter。主要做三件事：

 - 配置客户端详情服务
 - 配置令牌管理服务、令牌访问断点
 - 配置令牌断点的安全约束

## 安全配置
com.echo.config.WebSecurityConfig，需要实现WebSecurityConfigurerAdapter；主要设置密码编译器、安全拦截机制。

# 2.gateway网关服务
网关服务需要配置资源服务、已经令牌的解析。

