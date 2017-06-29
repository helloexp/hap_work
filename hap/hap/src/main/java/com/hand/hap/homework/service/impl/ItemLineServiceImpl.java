package com.hand.hap.homework.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.core.IRequest;


import com.hand.hap.homework.dto.ItemLine;
import com.hand.hap.homework.mapper.ItemLineMapper;

import com.hand.hap.homework.service.IItemLineService;
import com.hand.hap.message.IMessagePublisher;
import com.hand.hap.system.service.impl.BaseServiceImpl;


@Service
@Transactional
public class ItemLineServiceImpl extends BaseServiceImpl<ItemLine> implements IItemLineService{
	@Autowired
	private ItemLineMapper itemLineMapper;
	@Autowired
	private IMessagePublisher messagePublisher;
	
	@Override
	protected boolean useSelectiveUpdate() {
        return false;
    }


	public List<ItemLine> batchUpdate(IRequest request, List<ItemLine> list) {
		super.batchUpdate(request, list);
		for (ItemLine itemLine : list) {
			messagePublisher.publish("itemLine.change", itemLine);
		}
		return list;
	}
}
