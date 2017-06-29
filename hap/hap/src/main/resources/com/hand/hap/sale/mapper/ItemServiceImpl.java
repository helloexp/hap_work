package com.hand.hap.sale.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.sale.dto.Item;
import com.hand.hap.sale.service.IItemService;
import com.hand.hap.system.service.impl.BaseServiceImpl;

@Service
@Transactional
public class ItemServiceImpl extends BaseServiceImpl<Item> implements IItemService{

	

	
}
