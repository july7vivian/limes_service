package com.limes.dao.mapper;

import org.springframework.stereotype.Repository;

/**
 * Created by dluo on 17/9/12.
 */

@Repository
public interface RoleMapper {
    String getRoleName(Integer id);
}
