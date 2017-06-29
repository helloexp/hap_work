package com.hand.hap.sale.mapper;

import java.util.List;

import com.hand.hap.mybatis.common.Mapper;
import com.hand.hap.sale.dto.Header;


public interface HeaderMapper extends Mapper<Header>{

	//查看订单头信息
	List<Header> selectOrderHeaders(Header header);

}
