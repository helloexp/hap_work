package com.hand.hap.homework.mapper;

import com.hand.hap.homework.dto.TrxDetail;
import com.hand.hap.mybatis.common.Mapper;

public interface TrxDetailMapper extends Mapper<TrxDetail>{
	//删除指定id的信息
		public void deleteMessage(Long trxTypeId);
	
}
