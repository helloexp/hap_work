package com.hand.hap.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.hand.hap.core.IRequest;
import com.hand.hap.hr.dto.Employee;
import com.hand.hap.system.service.impl.BaseServiceImpl;
import com.hand.hap.test.dto.TestUser;
import com.hand.hap.test.mapper.TestUserMapper;
import com.hand.hap.test.service.ITestUserService;


@Service
@Transactional
public class TestUserServiceImpl extends BaseServiceImpl<TestUser> implements ITestUserService {

	@Autowired
	private TestUserMapper testUserMapper;
	
	@Override
	public List<TestUser> selectAllUsers(TestUser testUser) {
		List<TestUser> list=testUserMapper.selectAll();
		return list;
	}

	@Override
	public List<TestUser> queryAllTestUsers(IRequest requestContext, TestUser testUser, int page, int pagesize) {
		PageHelper.startPage(page, pagesize);
        return testUserMapper.getAllTestUsers(testUser);
	}

}
