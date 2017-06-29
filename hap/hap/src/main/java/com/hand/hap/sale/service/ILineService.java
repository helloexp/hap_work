package com.hand.hap.sale.service;

import java.util.List;

import com.hand.hap.core.IRequest;
import com.hand.hap.core.ProxySelf;
import com.hand.hap.sale.dto.Line;
import com.hand.hap.system.service.IBaseService;

public interface ILineService extends IBaseService<Line>,ProxySelf<ILineService>{

	//查看订单行信息
	public List<Line> queryOrderLines(IRequest requestContext, Line orderLines, int page, int pagesize);
	
	
	//插入行信息
	public void insertLine(Line line);
	
	
	//选择最大lineId
	public int selectMax();

	
}
