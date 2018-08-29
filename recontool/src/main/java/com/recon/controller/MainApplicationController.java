package com.recon.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.recon.model.ReconModel;

@Controller
public class MainApplicationController {
	
	@RequestMapping("/loadReconReports")
	public String loadReconReports(HttpServletRequest request,Map<String, Object> model) {
		String filename = request.getParameter("fileName");
		String tradeId = request.getParameter("tradeId");
		String cpId = request.getParameter("cpId");
		
		//TO-DO Load from DB
		//For now hardcoded
		List<ReconModel> recons = new ArrayList<>();
		ReconModel model1 = new ReconModel();
		model1.setReconFileName("ABC");
		model1.setRecievedDate(new Date().toString());
		model1.setSource("Intellematch");
		
		ReconModel model2 = new ReconModel();
		
		model2.setReconFileName("BED");
		model2.setRecievedDate(new Date().toString());
		model2.setSource("Bloombarg");
		
		ReconModel model3 = new ReconModel();
		
		model3.setReconFileName("DEG");
		model3.setRecievedDate(new Date().toString());
		model3.setSource("Oracle");
		
		recons.add(model1);
		recons.add(model2);
		recons.add(model3);
		
		model.put("recons", recons);
		
		
		return "reconsData";
	}
	
	@RequestMapping("/loadReportDashboard")
	public String loadReportDashboard(@RequestParam String rpName) {
		
		return "dashboradReport";
	}

}
