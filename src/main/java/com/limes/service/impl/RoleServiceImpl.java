package com.limes.service.impl;

import com.limes.dao.mapper.RoleMapper;
import com.limes.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dluo on 17/9/12.
 */

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    public String getRoleName(Integer id){
        return roleMapper.getRoleName(id);
    }
}
