package com.hand.hap.homework.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.hand.hap.system.service.impl.BaseServiceImpl;
import com.hand.hap.homework.dto.TrxType;
import com.hand.hap.homework.mapper.TrxTypeMapper;
import com.hand.hap.homework.mapper.TrxDetailMapper;
import com.hand.hap.homework.dto.TrxDetail;
import com.hand.hap.homework.service.ITrxDetailService;

@Service
@Transactional
public class TrxDetailServiceImpl extends BaseServiceImpl<TrxDetail> implements ITrxDetailService{
	
	@Autowired
	private TrxTypeMapper trxtypemapper;
	
	@Override
	public TrxType loadTrxtype(int trxTypeId) {
		// TODO Auto-generated method stub
		return trxtypemapper.selectByPrimaryKey(trxTypeId) ;
	}

	@Autowired
	private TrxDetailMapper trxDetailMapper;
	
	//删除指定id的信息
		public void deleteMessage(Long trxTypeId){
			trxDetailMapper.deleteMessage(trxTypeId);
		}
}

