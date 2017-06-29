package com.hand.hap.sale.controllers;

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
import com.hand.hap.sale.dto.Line;
import com.hand.hap.sale.service.ILineService;
import com.hand.hap.system.controllers.BaseController;
import com.hand.hap.system.dto.ResponseData;

@Controller
public class LineController extends BaseController {

	@Autowired
	private ILineService lineService;

	// 查询

	@RequestMapping(value = "/sale/orderLines/query")
	@ResponseBody
	public ResponseData getOrderHeader(HttpServletRequest request, Line orderLines,
			@RequestParam(defaultValue = DEFAULT_PAGE) int page,
			@RequestParam(defaultValue = DEFAULT_PAGE_SIZE) int pagesize) {
		IRequest iRequest = createRequestContext(request);
		System.out.println(orderLines.getHeaderId());
		return new ResponseData(lineService.queryOrderLines(iRequest, orderLines, page, pagesize));

	}

	// 新增
	// submit
	@RequestMapping(value = "/sale/orderLines/submit", method = RequestMethod.POST)
	@ResponseBody
	public void submitData(@RequestBody List<Line> lines, HttpServletRequest request) {
		Line line = lines.get(0);
		System.out.println(line);
		//获得最大lineId
		int maxLineId = lineService.selectMax();
		//+1
		maxLineId+=1;
		line.setLastUpdateLogin(4);
		line.setLineId(maxLineId);
		lineService.insertLine(line);
	}

}
