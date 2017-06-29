package com.hand.hap.homework.mapper;

import java.util.List;

import com.hand.hap.homework.dto.TrxType;
import com.hand.hap.mybatis.common.Mapper;

public interface TrxTypeMapper extends Mapper<TrxType>{

List<TrxType> queryTrxType(TrxType trxType);


//增加版本时，查询当前标识出现的次数

public int selectCount(TrxType trxType);


//  根据前端传回的trxTypeId查询数据库中的数据
public TrxType selectById(Integer id);

// 插入创建版本的新数据
public void insertValue(TrxType trxType);


// 查询数据表中最大的id号，用于创建版本

public Long selectMaxTrxTypeId();
}
