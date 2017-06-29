package com.hand.hap.sale.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hand.hap.sale.dto.Customer;
import com.hand.hap.sale.service.ICustomerService;
import com.hand.hap.system.service.impl.BaseServiceImpl;

@Service
@Transactional
public class CustomerServiceImpl extends BaseServiceImpl<Customer> implements ICustomerService{

}
