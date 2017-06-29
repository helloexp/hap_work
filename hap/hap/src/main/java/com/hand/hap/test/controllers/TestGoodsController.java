package com.hand.hap.test.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.hand.hap.test.dto.TestGoods;

import com.hand.hap.test.service.ITestGoodsService;


@Controller
public class TestGoodsController extends BaseController{
 
	@Autowired
	private ITestGoodsService testGoodsService;
	
	private static Logger log = LoggerFactory.getLogger(TestGoodsController.class);
	
	
	@RequestMapping(value = "test/goods/queryAll",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData queryAllTestUsers(TestGoods testGoods,HttpServletRequest request,@RequestParam(defaultValue = DEFAULT_PAGE) int page,
			@RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize){
		
		
		IRequest iRequest = createRequestContext(request);		
		return new ResponseData(testGoodsService.selectAll(iRequest));		
			
	}
	
	@RequestMapping(value = "test/goods/submit", method = RequestMethod.POST)
	public ResponseData submitPosition(@RequestBody List<TestGoods> testGoods, BindingResult result, HttpServletRequest request)
			throws TokenException {
		
		
		/*checkToken(request, testGoods);
		getValidator().validate(testGoods, result);
		if (result.hasErrors()) {
			ResponseData rd = new ResponseData(false);
			rd.setMessage(getErrorMessage(result, request));
			return rd;
		}*/
		IRequest requestCtx = createRequestContext(request);
		return new ResponseData(testGoodsService.batchUpdate(requestCtx, testGoods));
	}
	
	
	@RequestMapping(value = "test/goods/remove")
    @ResponseBody
    public ResponseData delete(HttpServletRequest request,@RequestBody List<TestGoods> testGoods){
		testGoodsService.batchDelete(testGoods);
        return new ResponseData();
    }
}
