package com.hand.hap.homework.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.hand.hap.homework.dto.TrxType;
import com.hand.hap.homework.service.IBaseTypeService;
import com.hand.hap.homework.service.ITrxDetailService;
import com.hand.hap.homework.service.ITrxTypeService;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;

@Controller
public class TrxTypeController extends BaseController {
	@Autowired
	private IBaseTypeService iBaseTypeService;
     @Autowired
     private ITrxTypeService trxTypeService;
     @Autowired
     private ITrxDetailService trxDetailService;
     
   //查询
     @RequestMapping(value="/aaa/TrxType/query")
     @ResponseBody
     public ResponseData getPosition(HttpServletRequest request, TrxType trxType, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
     @RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize){
	 IRequest iRequest=createRequestContext(request);
	 return new ResponseData(trxTypeService.select(iRequest, trxType, page, pagesize));
}

     //删除
     @RequestMapping(value="/aaa/TrxType/remove")
     @ResponseBody
     public ResponseData delete(HttpServletRequest request,@RequestBody List<TrxType> trxTypes){
    	 iBaseTypeService.batchDelete(trxTypes);
 		System.out.println(trxTypes.toString());
 		trxDetailService.deleteMessage(trxTypes.get(0).getTrxTypeId());
         return new ResponseData();
		/*trxTypeService.batchDelete(trxTypes);
        return new ResponseData();*/
    }
   
     //新建、修改
     @RequestMapping(value="/aaa/TrxType/submit",method = RequestMethod.POST)
 	public ResponseData submitTrxType(@RequestBody List<TrxType> trxTypes, BindingResult result, HttpServletRequest request)
			throws TokenException {
		checkToken(request, trxTypes);
		getValidator().validate(trxTypes, result);
		if (result.hasErrors()) {
			ResponseData rd = new ResponseData(false);
			rd.setMessage(getErrorMessage(result, request));
			return rd;
		}
		IRequest requestCtx = createRequestContext(request);
		return new ResponseData(trxTypeService.batchUpdate(requestCtx, trxTypes));
	}

    	 
     @RequestMapping(value = "/homework/trxtype/addVersion")
 	public void addVersion(HttpServletRequest request,HttpServletResponse response)throws Exception
 	{
 		String id=request.getParameter("id");
 		Integer trxTypeId=Integer.parseInt(id);
 		//根据id号查询出当前标识的数据
 		TrxType trxType1=trxTypeService.selectById(trxTypeId);
 		
 		//查出当前标识的总数
 		int count=trxTypeService.selectCount(trxType1);
 		//获取最大的id号
 		Long maxTrxTypeId=trxTypeService.selectMaxTrxTypeId();
 		
 		//修改trxType1中的状态和版本号
 		trxType1.setTrxTypeId(maxTrxTypeId+1);
 		trxType1.setVersionNumber((long)(count+1));
 		trxType1.setStatusCode("DRAFT");
 		
 		//插入新的版本号数据
 		trxTypeService.insertValue(trxType1);
 	}
     
   
  
     
     
     
     
}
