package com.hand.hap.homework.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.hand.hap.core.IRequest;
import com.hand.hap.core.exception.TokenException;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;
import com.hand.hap.homework.dto.TrxDetail;
import com.hand.hap.homework.service.ITrxDetailService;

@Controller
public class TrxDetailController extends BaseController{
    
	@Autowired
    private ITrxDetailService trxDetailService;
	
    
    //查询
    @RequestMapping(value="/aaa/TrxDetail/query")
    @ResponseBody
    public ResponseData getTrxDetail(HttpServletRequest request, TrxDetail TrxDetail, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
    @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize){
	 IRequest iRequest=createRequestContext(request);
	 return new ResponseData(trxDetailService.select(iRequest, TrxDetail, page, pagesize));
}

    //删除
    @RequestMapping(value="/aaa/TrxDetail/remove")
    @ResponseBody
    public ResponseData delete(HttpServletRequest request,@RequestBody List<TrxDetail> trxDetails){
    	trxDetailService.batchDelete(trxDetails);
       return new ResponseData();
   }
  
    //新建、修改
    @RequestMapping(value="aaa/TrxDetail/submit",method = RequestMethod.POST)
	public ResponseData submitTrxDetail(@RequestBody List<TrxDetail> trxDetails, BindingResult result, HttpServletRequest request)
			throws TokenException {
//		checkToken(request, trxDetails);
		getValidator().validate(trxDetails, result);
		if (result.hasErrors()) {
			ResponseData rd = new ResponseData(false);
			rd.setMessage(getErrorMessage(result, request));
			return rd;
		}
		IRequest requestCtx = createRequestContext(request);
		return new ResponseData(trxDetailService.batchUpdate(requestCtx, trxDetails));
	}
}

