package com.hand.hap.sale.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.hand.hap.core.IRequest;
import com.hand.hap.sale.dto.Line;
import com.hand.hap.sale.mapper.LineMapper;
import com.hand.hap.sale.service.ILineService;
import com.hand.hap.system.service.impl.BaseServiceImpl;

@Service
@Transactional
public class LineServiceImpl extends BaseServiceImpl<Line> implements ILineService{

	
	//查看订单行信息
	@Autowired
	private LineMapper lineMapper;
	@Override
	public List<Line> queryOrderLines(IRequest requestContext, Line orderLines, int page, int pagesize) {
		PageHelper.startPage(page, pagesize);
		return lineMapper.selectOrderLines(orderLines);
	}

	//插入行信息
	@Override
	public void insertLine(Line line) {
		lineMapper.insertLine(line);
	}

	
	//选择最大lineId
	@Override
	public int selectMax() {
		return  lineMapper.selectMax();
	}

}
