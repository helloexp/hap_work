package com.hand.hap.test.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.system.service.impl.BaseServiceImpl;
import com.hand.hap.test.dto.TestGoods;
import com.hand.hap.test.service.ITestGoodsService;

@Service
@Transactional
public class TestGoodsServiceImpl extends BaseServiceImpl<TestGoods> implements ITestGoodsService {

}
