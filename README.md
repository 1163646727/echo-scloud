# echo-scloud
## 简介
echo-scloud是一套微服务的解决方案，集成了服务发现、服务治理、配置管理、授权服务等。  
修改部分服务地址后，可用于开发使用。  
应用服务参看：[https://github.com/1163646727/echo-business](https://github.com/1163646727/echo-business "echo-business")。  
echo的含义：Echo是希腊神话中是山林女神，著名作家三毛的英文名也是Echo。

# 1.创建基础数据表
建表文件：

```
1.db/nacos_config.sql
1.db/user_db.sql
```


# 2.安装nacos注册中心
参考[http://wanhejia.com/kuangjia/283.html](http://wanhejia.com/kuangjia/283.html "nacos安装教程")
# 3. authService授权服务
## 修改配置文件
    application.properties
## 自定义获取用户信息
`com.echo.service.UserDetailsServicePri`，需要实现UserDetailsService，重写UserDetails方法。
主要做：

 - 根据登录名称从数据库获取用户信息
 - 设置用户的权限集

## 认证授权服务配置类
`com.echo.config.AuthorizationServer`，需要继承AuthorizationServerConfigurerAdapter。主要做三件事：

 - 配置客户端详情服务
 - 配置令牌管理服务、令牌访问断点
 - 配置令牌断点的安全约束

## 安全配置
`com.echo.config.WebSecurityConfig`，需要实现WebSecurityConfigurerAdapter；主要设置密码编译器、安全拦截机制。  
## 密码模式
postman工具 申请令牌  
post请求 

```
http://127.0.0.1:9443/auth/oauth/token?client_id=c1&client_secret=secret&grant_type=password&username=zhangsan&password=123
```

### token解析
postman工具 申请令牌 
post请求 

```
http://localhost:9443/auth/oauth/check_token?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsicHJpIiwib3JkZXIiXSwidXNlcl9uYW1lIjoie1wiZnVsbG5hbWVcIjpcIuW8oOS4iVwiLFwiaWRcIjpcIjFcIixcInBhc3N3b3JkXCI6XCIkMmEkMTAkSEw3THRjQWMua2c4NjNtRm1VWmR5LlcwVWpPYXhUaHRUeXN5RVRYbG9jMkJMeDNKeGl6UDZcIixcInVzZXJuYW1lXCI6XCJ6aGFuZ3NhblwifSIsInNjb3BlIjpbIlJPTEVfQURNSU4iLCJST0xFX1VTRVIiLCJST0xFX0FQSSIsImFsbCIsIk9SREVSIl0sImV4cCI6MTU5NDk2MzI0NSwiYXV0aG9yaXRpZXMiOlsicDEiLCJwMiIsInAzIl0sImp0aSI6ImEzODNhNjQ2LTI2NzItNDE2Yi05NDY1LTBjNzQ4Y2Q3N2E1MCIsImNsaWVudF9pZCI6ImMxIn0.kWYCsQaHlKl1hFA07xlFzHZSJFyGMqi9u3qKWSyxPOw
```


# 4.gateway网关服务
网关服务需要配置资源服务、已经令牌的解析。

