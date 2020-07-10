package com.echo.service;

import com.alibaba.fastjson.JSON;
import com.echo.dao.UserDao;
import com.echo.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * className: UserDetailsServicePri <BR>
 * description: 自定义UserDetailsService实现类，查询用户信息<BR>
 * remark: 实现UserDetailsService接口，重写loadUserByUsername方法<BR>
 * author: ChenQi <BR>
 * createDate: 2020-06-29 23:31 <BR>
 */
@Service
public class UserDetailsServicePri implements UserDetailsService {

    @Autowired
    UserDao userDao;

    /**
     * methodName: loadUserByUsername <BR>
     * description:  重写loadUserByUsername方法<BR>
     * remark: 根据用户名查询用户信息<BR>
     * param: username 用户名<BR>
     * return: org.springframework.security.core.userdetails.UserDetails <BR>
     * author: ChenQi <BR>
     * createDate: 2020-07-04 23:39 <BR>
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        //将来连接数据库根据账号查询用户信息
        UserDto userDto = userDao.getUserByUsername(username);
        if(userDto == null){
            //如果用户查不到，返回null，由provider来抛出异常
            return null;
        }
        //根据用户的id查询用户的权限
        List<String> permissions = userDao.findPermissionsByUserId(userDto.getId());
        //将permissions转成数组
        String[] permissionArray = new String[permissions.size()];
        permissions.toArray(permissionArray);
        //将userDto转成json
        String principal = JSON.toJSONString(userDto);
        UserDetails userDetails = User.withUsername(principal).password(userDto.getPassword()).authorities(permissionArray).build();
        return userDetails;
    }
}
