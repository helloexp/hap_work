package com.hand.hap.homework.service;

import com.hand.hap.homework.dto.TrxType;
import com.hand.hap.core.ProxySelf;
import com.hand.hap.homework.dto.TrxDetail;
import com.hand.hap.system.service.IBaseService;

public interface ITrxDetailService extends IBaseService<TrxDetail>,ProxySelf<TrxDetail>{

	TrxType loadTrxtype(int tryTxpeId);
	//删除指定id的信息
			public void deleteMessage(Long trxTypeId);
}