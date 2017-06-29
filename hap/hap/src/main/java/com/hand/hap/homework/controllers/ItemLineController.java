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
import com.hand.hap.homework.dto.ItemLine;
import com.hand.hap.homework.service.IItemLineService;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;




@Controller
public class ItemLineController extends BaseController{
	@Autowired
	private IItemLineService itemLineService;
	
	@RequestMapping(value = "/item/itemLine/query")
	@ResponseBody
	public ResponseData queryAll(final ItemLine itemLine,@RequestParam(defaultValue = DEFAULT_PAGE) final int page,
								 @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) final int pagesize, final HttpServletRequest request) {
		
		IRequest requestContext = createRequestContext(request);
		return new ResponseData(itemLineService.select(requestContext, itemLine, page, pagesize));
		
	}
	
	
	
	@RequestMapping(value = "/item/itemLine/submit", method = RequestMethod.POST)
	public ResponseData submitTrxType(@RequestBody List<ItemLine> itemLines, BindingResult result, HttpServletRequest request)
			throws TokenException {

		checkToken(request, itemLines);
		getValidator().validate(itemLines, result);
		if (result.hasErrors()) {
			ResponseData rd = new ResponseData(false);
			rd.setMessage(getErrorMessage(result, request));
			return rd;
		}
		IRequest requestCtx = createRequestContext(request);
		return new ResponseData(itemLineService.batchUpdate(requestCtx, itemLines));
	}
}
