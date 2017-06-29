package com.hand.hap.test.mapper;


import java.util.List;

import com.hand.hap.mybatis.common.Mapper;
import com.hand.hap.test.dto.TestUser;

public interface TestUserMapper extends Mapper<TestUser> {
  public List<TestUser> getAllTestUsers(TestUser testUser);
}
