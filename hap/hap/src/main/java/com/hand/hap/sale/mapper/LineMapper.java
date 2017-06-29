package com.hand.hap.sale.mapper;

import java.util.List;

import com.hand.hap.mybatis.common.Mapper;
import com.hand.hap.sale.dto.Line;

public interface LineMapper extends Mapper<Line>{

	//查看订单行信息
	List<Line> selectOrderLines(Line line);
	
	//插入行信息
	void insertLine(Line line);
	
	//选择最大lineId
	int selectMax();

	
}
