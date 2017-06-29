package com.hand.hap.homework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.homework.dto.TrxType;
import com.hand.hap.homework.mapper.TrxTypeMapper;
import com.hand.hap.homework.service.ITrxTypeService;
import com.hand.hap.system.service.impl.BaseServiceImpl;

@Service
@Transactional
public class TrxTypeServiceImpl extends BaseServiceImpl<TrxType> implements ITrxTypeService{

	@Autowired
	private TrxTypeMapper trxTypeMapper;

	/**
	 * 查询当前的标识总数
	 */
	@Override
	public int selectCount(TrxType trxType) {

		int count=trxTypeMapper.selectCount(trxType);
		return count;
	}

	/**
	 * 根据id号查询当前的一条数据
	 */
	@Override
	public TrxType selectById(Integer id) {

		TrxType trxType=trxTypeMapper.selectById(id);
		
		return trxType;
	}

	/**
	 * 插入数据，创建版本的数据
	 */
	@Override
	public void insertValue(TrxType trxType) {
		trxTypeMapper.insertValue(trxType);
	}

	@Override
	public Long selectMaxTrxTypeId() {
		Long maxTrxTYpeId=trxTypeMapper.selectMaxTrxTypeId();
		return maxTrxTYpeId;
	}
}


