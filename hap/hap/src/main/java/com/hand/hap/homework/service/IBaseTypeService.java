package com.hand.hap.homework.service;

import com.hand.hap.homework.dto.TrxType;
import com.hand.hap.core.ProxySelf;
import com.hand.hap.system.service.IBaseService;

public interface IBaseTypeService extends IBaseService<TrxType>,ProxySelf<IBaseTypeService>{

	TrxType loadTrxtype(int tryTxpeId);

}
