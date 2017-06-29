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
import com.hand.hap.homework.dto.ItemHeader;
import com.hand.hap.homework.service.IItemHeaderService;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;



@Controller
public class ItemHeaderController extends BaseController{
	@Autowired
	private IItemHeaderService itemHeaderService;
	
	
	@RequestMapping(value = "/item/itemHeader/query")
	@ResponseBody
	public ResponseData queryAll(final ItemHeader itemHeader,@RequestParam(defaultValue = DEFAULT_PAGE) final int page,
								 @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) final int pagesize, final HttpServletRequest request) {
		
		IRequest requestContext = createRequestContext(request);
		return new ResponseData(itemHeaderService.select(requestContext, itemHeader, page, pagesize));
		
	}
	
	
	
	@RequestMapping(value = "/item/itemHeader/submit", method = RequestMethod.POST)
	public ResponseData submitTrxType(@RequestBody List<ItemHeader> itemHeaders, BindingResult result, HttpServletRequest request)
			throws TokenException {
		for(int i=0;i<itemHeaders.size();i++){
			System.out.println(itemHeaders.get(i).toString());
		}
		checkToken(request, itemHeaders);
		getValidator().validate(itemHeaders, result);
		if (result.hasErrors()) {
			ResponseData rd = new ResponseData(false);
			rd.setMessage(getErrorMessage(result, request));
			return rd;
		}
		IRequest requestCtx = createRequestContext(request);
		return new ResponseData(itemHeaderService.batchUpdate(requestCtx, itemHeaders));
	}
}
