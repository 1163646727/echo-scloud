package com.echo.dto;

import lombok.Data;

/**
 * className: UserDto <BR>
 * description: <BR>
 * remark: <BR>
 * author: ChenQi <BR>
 * createDate: 2020-07-10 14:24 <BR>
 */
@Data
public class UserDto {
    private String id;
    private String username;
    private String password;
    private String fullname;
    private String mobile;
}
