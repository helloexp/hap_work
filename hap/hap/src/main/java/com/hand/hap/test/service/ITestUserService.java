package com.hand.hap.test.service;

import java.util.List;

import com.hand.hap.core.IRequest;
import com.hand.hap.core.ProxySelf;
import com.hand.hap.system.service.IBaseService;
import com.hand.hap.test.dto.TestUser;

public interface ITestUserService extends IBaseService<TestUser>,ProxySelf<ITestUserService> {
      public List<TestUser> selectAllUsers(TestUser testUser);
      public List<TestUser> queryAllTestUsers(IRequest requestContext, TestUser testUser, int page, int pagesize);
}
