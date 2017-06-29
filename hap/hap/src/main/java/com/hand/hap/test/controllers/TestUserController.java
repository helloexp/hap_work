package com.hand.hap.test.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hand.hap.core.IRequest;
import com.hand.hap.core.exception.TokenException;
import com.hand.hap.excel.dto.ColumnInfo;
import com.hand.hap.excel.dto.ExportConfig;
import com.hand.hap.excel.service.IExportService;
import com.hand.hap.excel.service.IHapExcelImportService;
import com.hand.hap.function.dto.Function;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;
import com.hand.hap.test.dto.TestUser;
import com.hand.hap.test.service.ITestUserService;

import org.mozilla.javascript.tools.debugger.downloaded.JTreeTable.ListToTreeSelectionModelWrapper;
import org.slf4j.Logger;


@Controller
public class TestUserController extends BaseController{
  
	@Autowired
	private ITestUserService testUserService;
	
	private static Logger log = LoggerFactory.getLogger(TestUserController.class);
	
	//查询方法
	@RequestMapping(value = "test/user/queryAll",method=RequestMethod.POST)
	@ResponseBody
	public ResponseData queryAllTestUsers(TestUser testUser,HttpServletRequest request,@RequestParam(defaultValue = DEFAULT_PAGE) int page,
			@RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize){
		
		IRequest iRequest = createRequestContext(request);
		/*return new ResponseData(testUserService.queryAllTestUsers(iRequest,testUser,page,pagesize));
		List<TestUser> tests=testUserService.select(iRequest, testUser, page,pagesize);
		log.info(tests.toString());
		return new ResponseData(tests);*/
		return new ResponseData(testUserService.selectAll(iRequest));
	}
	
	
	//编辑和新增方法
	@RequestMapping(value = "test/user/submit", method = RequestMethod.POST)
	public ResponseData submitPosition(@RequestBody List<TestUser> testUsers, BindingResult result, HttpServletRequest request)
			throws TokenException {
		
		/*checkToken(request, testUsers);		   
		getValidator().validate(testUsers, result);
		if (result.hasErrors()) {
			ResponseData rd = new ResponseData(false);
			rd.setMessage(getErrorMessage(result, request));
			return rd;
		}*/
		
		IRequest requestCtx = createRequestContext(request);
		return new ResponseData(testUserService.batchUpdate(requestCtx, testUsers));
	}
		
	//删除方法
	@RequestMapping(value = "test/user/remove")
    @ResponseBody
    public ResponseData delete(HttpServletRequest request,@RequestBody List<TestUser> testUsers){
		
		testUserService.batchDelete(testUsers);
        return new ResponseData();
    }
	
	
	
	//导出文件
	@Autowired
    IExportService excelService;
    
    @Autowired
    ObjectMapper objectMapper;

    @RequestMapping(value = "/test/user/export")
    public void createXLS(HttpServletRequest request, @RequestParam String config,
            HttpServletResponse httpServletResponse) {
        IRequest requestContext = createRequestContext(request);
        
        try {
            JavaType type = objectMapper.getTypeFactory().constructParametrizedType(ExportConfig.class,
                    ExportConfig.class, Function.class, ColumnInfo.class);
            ExportConfig<Function, ColumnInfo> exportConfig = objectMapper.readValue(config, type);
            excelService.exportAndDownloadExcel("com.hand.hap.function.mapper.FunctionMapper.selectFunctions",
                    exportConfig, request, httpServletResponse, requestContext);
        } 
        catch (IOException e) {
            e.printStackTrace();
        }
    }

}
