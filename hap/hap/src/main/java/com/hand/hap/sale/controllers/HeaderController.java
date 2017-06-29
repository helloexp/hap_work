package com.hand.hap.sale.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hand.hap.core.IRequest;
import com.hand.hap.excel.dto.ColumnInfo;
import com.hand.hap.excel.dto.ExportConfig;
import com.hand.hap.excel.service.IExportService;
import com.hand.hap.sale.dto.Header;
import com.hand.hap.sale.service.IHeaderService;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;

@Controller
public class HeaderController extends BaseController{

	    @Autowired 
	    private IHeaderService headerService;
	
	    //导出Excel
	    @Autowired
	    IExportService excelService;

	    @Autowired
	    ObjectMapper objectMapper;

	    @RequestMapping(value = "/sale/orderHeader/export")
	    public void createXLS(HttpServletRequest request, @RequestParam String config,
	            HttpServletResponse httpServletResponse) {
	        IRequest requestContext = createRequestContext(request);
	        try {
	            JavaType type = objectMapper.getTypeFactory().constructParametrizedType(ExportConfig.class,
	                    ExportConfig.class, Header.class, ColumnInfo.class);
	            ExportConfig<Header, ColumnInfo> exportConfig = objectMapper.readValue(config, type);
	            excelService.exportAndDownloadExcel("com.hand.hap.sale.mapper.HeaderMapper.selectOrderHeaders",
	                    exportConfig, request, httpServletResponse, requestContext);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    
//	    查询

		@RequestMapping(value="/sale/orderHeaders/query")
		@ResponseBody
		public ResponseData getOrderHeader(HttpServletRequest request, Header orderHeader, @RequestParam(defaultValue = DEFAULT_PAGE) int page,
				@RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize){
			IRequest iRequest=createRequestContext(request);
			return new ResponseData(headerService.queryOrderHeaders(iRequest, orderHeader, page, pagesize));
			
		}
	    
	    
	    
	    
}
