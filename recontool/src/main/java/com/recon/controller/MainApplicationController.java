package com.recon.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.recon.dao.ReconDao;
import com.recon.model.ExceptionResponse;
import com.recon.model.JsonModel;
import com.recon.model.Login;
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
		String id = request.getParameter("id");
		//String id = "1";
		
		ReconModel recon = reconDao.loadBasic(id);
		model.put("recon", recon);
		return "BasicInfo";
	}
	
	@RequestMapping("/loadException")
	public String loadException(HttpServletRequest request,Map<String, Object> model) {
		//String id = request.getParameter("id");
		String id = "1";
		
		List<JsonModel> listOfJsonObject = reconDao.loadException(id);
		Map<String, ExceptionResponse> exceptionRes = new HashMap<String, ExceptionResponse>();
		for(JsonModel eachModel: listOfJsonObject) {
			ExceptionResponse next = new ExceptionResponse();
			next.setTradeid(eachModel.getTradeid());
			next.setCounterpartyid(eachModel.getCounterpartyid());
			next.setCategory(eachModel.getCategory());
			next.setSubcat1(eachModel.getStatus());
			if(exceptionRes.get(eachModel.getTradeid()) == null) {
				//Reference data set
				exceptionRes.put(eachModel.getTradeid(), next);
			}
			
		}
		
		model.put("exceptions", exceptionRes.values());
		return "Exception";
	}
	
	@RequestMapping("/loadReportDashboard")
	public String loadReportDashboard(@RequestParam String rpName) {
		
		return "dashboradReport";
	}
	
	@RequestMapping("/mainPage")
	public String mainPage(HttpServletRequest request,Map<String, Object> model) {
		String fileId = request.getParameter("id");

		model.put("id", fileId);
		return "Main";
	}
	
	@RequestMapping("/Graph")
	public String graph(HttpServletRequest request,Map<String, Object> model) {
		List<JsonModel> listOfJsonObject = reconDao.loadException("1");
		int smcount = 0;
		int stcount = 0;
		int amcount = 0;
		for(JsonModel eachModel: listOfJsonObject) {
		if(eachModel.getCategory() != null) {	
			if(eachModel.getCategory().equals("singleton"))
				stcount = stcount + 1;
			else if(eachModel.getCategory().equals("Status Mismatch"))
				smcount = smcount + 1;
		}}
		
		int total = smcount + stcount + amcount;
		model.put("stcount", stcount);
		model.put("smcount", smcount);
		model.put("amcount", amcount);
		model.put("total", total);
		
		return "Graph";
	}
	
	@RequestMapping("/DashboardTable")
	public String DashboardTable(HttpServletRequest request,Map<String, Object> model) {
		String id = "1";
		List<JsonModel> listOfJsonObject = reconDao.loadException(id);
		int smcount = 0;
		int stcount = 0;
		int amcount = 0;
		for(JsonModel eachModel: listOfJsonObject) {
		if(eachModel.getCategory() != null) {	
			if(eachModel.getCategory().equals("singleton"))
				stcount = stcount + 1;
			else if(eachModel.getCategory().equals("Status Mismatch"))
				smcount = smcount + 1;
		}}
		
		int total = smcount + stcount + amcount;
		model.put("stcount", stcount);
		model.put("smcount", smcount);
		model.put("amcount", amcount);
		model.put("total", total);
		return "DashboardTable";
	}
	
	
	@RequestMapping(value = "/login")
    public String login(Model model, String error, String logout) {
		if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");
        model.addAttribute("login", new Login());
        return "login";
    }
	

	@RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request,Model model) {
		request.getSession().invalidate();
        model.addAttribute("message", "You have been logged out successfully.");
        model.addAttribute("login", new Login());
        return "login";
    }
}
