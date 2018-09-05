package com.recon.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.recon.dao.ReconDao;
import com.recon.model.ReconModel;

@Controller
public class MainApplicationController {
	
	@Autowired
	private ReconDao reconDao;
	
	@RequestMapping("/loadReconReports")
	public String loadReconReports(HttpServletRequest request,Map<String, Object> model) {
		String filename = request.getParameter("fileName");
		String tradeId = request.getParameter("tradeId");
		String cpId = request.getParameter("cpId");
		
		//TO-DO Load from DB
		//For now hardcoded
		List<ReconModel> recons = reconDao.loadRecons();
		model.put("recons", recons);
		return "reconsData";
	}
	
	@RequestMapping("/loadReportDashboard")
	public String loadReportDashboard(@RequestParam String rpName) {
		
		return "dashboradReport";
	}

}
