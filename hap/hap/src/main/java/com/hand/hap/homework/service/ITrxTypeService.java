package com.hand.hap.homework.service;

import com.hand.hap.core.ProxySelf;
import com.hand.hap.homework.dto.TrxType;
import com.hand.hap.system.service.IBaseService;

public interface ITrxTypeService extends IBaseService<TrxType>,ProxySelf<TrxType>{
//List<TrxType> queryTrxType(IRequest requestContext ,TrxType trxType , int page ,int pagesize);
	
	/**
	 * 增加版本时，查询当前标识出现的次数
	 */
	public int selectCount(TrxType trxType);

	/**
	 * 根据前端传回的trxTypeId查询数据库中的数据
	 * 
	 * @param id
	 * @return
	 */
	public TrxType selectById(Integer id);

	/**
	 * 插入创建版本的新数据
	 */
	public void insertValue(TrxType trxType);
	
	/**
	 * 查询数据表中最大的id号，用于创建版本
	 */
	public Long selectMaxTrxTypeId();
}
