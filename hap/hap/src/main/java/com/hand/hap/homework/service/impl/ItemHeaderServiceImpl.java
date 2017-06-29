package com.hand.hap.homework.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.core.IRequest;

import com.hand.hap.homework.dto.ItemHeader;
import com.hand.hap.homework.mapper.ItemHeaderMapper;
import com.hand.hap.homework.service.IItemHeaderService;
import com.hand.hap.message.IMessagePublisher;
import com.hand.hap.system.service.impl.BaseServiceImpl;


@Service
@Transactional
public class ItemHeaderServiceImpl extends BaseServiceImpl<ItemHeader> implements IItemHeaderService{
	@Autowired
	private ItemHeaderMapper itemHeaderMapper;
	@Autowired
	private IMessagePublisher messagePublisher;
	
	@Override
	protected boolean useSelectiveUpdate() {
        return false;
    }


	public List<ItemHeader> batchUpdate(IRequest request, List<ItemHeader> list) {
		super.batchUpdate(request, list);
		for (ItemHeader itemHeader : list) {
			messagePublisher.publish("itemHeader.change", itemHeader);
		}
		return list;
	}
}
