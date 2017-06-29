package com.hand.hap.homework.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.homework.dto.TrxDetail;
import com.hand.hap.homework.service.IBaseDetailService;
import com.hand.hap.system.service.impl.BaseServiceImpl;

@Service
@Transactional
public class BaseDetailServiceImpl extends BaseServiceImpl<TrxDetail> implements IBaseDetailService{

}
