package com.hand.hap.sale.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.sale.dto.Companys;
import com.hand.hap.sale.service.ICompanysService;
import com.hand.hap.system.service.impl.BaseServiceImpl;


@Service
@Transactional
public class CompanysServiceImpl extends BaseServiceImpl<Companys> implements ICompanysService{
	
}