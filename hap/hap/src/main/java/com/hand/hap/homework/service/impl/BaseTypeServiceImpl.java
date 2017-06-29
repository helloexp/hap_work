package com.hand.hap.homework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.homework.dto.TrxType;
import com.hand.hap.homework.mapper.TrxTypeMapper;
import com.hand.hap.homework.service.IBaseTypeService;
import com.hand.hap.system.service.impl.BaseServiceImpl;

@Service
@Transactional
public class BaseTypeServiceImpl extends BaseServiceImpl<TrxType> implements IBaseTypeService{
	
	@Autowired
	private TrxTypeMapper trxtypemapper;
	
	@Override
	public TrxType loadTrxtype(int trxTypeId) {
		// TODO Auto-generated method stub
		return trxtypemapper.selectByPrimaryKey(trxTypeId) ;
	}
	
}
