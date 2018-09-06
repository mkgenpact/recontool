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
	
	@RequestMapping("/loadBasic")
	public String loadBasic(HttpServletRequest request,Map<String, Object> model) {
		//String id = request.getParameter("id");
		String id = "1";
		
		ReconModel recon = reconDao.loadBasic(id);
		model.put("recon", recon);
		return "BasicInfo";
	}
	
	@RequestMapping("/loadException")
	public String loadException(HttpServletRequest request,Map<String, Object> model) {
		//String id = request.getParameter("id");
		String id = "1";
		
		List<String> listOfString = reconDao.loadException(id);
		
		System.out.println(listOfString);
		//model.put("recon", recon);
		return "Exception";
	}
	
	@RequestMapping("/loadReportDashboard")
	public String loadReportDashboard(@RequestParam String rpName) {
		
		return "dashboradReport";
	}
	
	@RequestMapping("/mainPage")
	public String mainPage() {
		
		return "Main";
	}

}
