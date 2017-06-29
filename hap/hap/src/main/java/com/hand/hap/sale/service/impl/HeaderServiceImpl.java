package com.hand.hap.sale.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.hand.hap.core.IRequest;
import com.hand.hap.extensible.components.ServiceListenerChainFactory;
import com.hand.hap.sale.dto.Header;
import com.hand.hap.sale.mapper.HeaderMapper;
import com.hand.hap.sale.service.IHeaderService;
import com.hand.hap.system.service.impl.BaseServiceImpl;

@Service
@Transactional
public class HeaderServiceImpl extends BaseServiceImpl<Header> implements IHeaderService{

	@Autowired
	private HeaderMapper headerMapper;
	
	@Autowired
        private ServiceListenerChainFactory chainFactory;
	
	
	//查看订单头信息
	@Override
	public List<Header> queryOrderHeaders(IRequest requestContext, Header orderHeaders, int page, int pagesize) {
		PageHelper.startPage(page, pagesize);
		return headerMapper.selectOrderHeaders(orderHeaders);
	}
}
