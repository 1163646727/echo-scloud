package com.echo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * className: AuthServerApp <BR>
 * description: 认证授权服务启动类<BR>
 * remark: <BR>
 * auther: ChenQi <BR>
 * date: 2020/7/5 9:45 <BR>
 * version 1.0 jdk1.8 <BR>
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableHystrix
@EnableFeignClients(basePackages = {"com.echo"})
public class AuthServerApp {
    public static void main(String[] args) {
        SpringApplication.run (AuthServerApp.class,args);
    }
}
