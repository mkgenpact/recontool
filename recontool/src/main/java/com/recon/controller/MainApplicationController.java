package com.recon.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.recon.dao.ReconDao;
import com.recon.model.BreakAction;
import com.recon.model.ExceptionResponse;
import com.recon.model.JsonModel;
import com.recon.model.Login;
import com.recon.model.ReconModel;

@Controller
public class MainApplicationController {
	
	@Autowired
	private ReconDao reconDao;
	
	
	@RequestMapping("/loadRecons")
	@ResponseBody
	public List<ReconModel> loadRecons(HttpServletRequest request){
		final List<ReconModel> recons = reconDao.loadRecons();
		return recons;
	}
	
	@RequestMapping("/loadReconReports")
	public String loadReconReports(HttpServletRequest request,Map<String, Object> model) {
		String filename = request.getParameter("fileName");
		List<ReconModel> recons = reconDao.loadReconsByName(filename);
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
	
	@RequestMapping("/loadExceptionFilter")
	public String loadExceptionFilter(HttpServletRequest request,Map<String, Object> model, Principal auth) {
		List<BreakAction> listOfActions = reconDao.loadBreakActions();
		model.put("breakActions", listOfActions);
		return "Exception";
	}
	
	@RequestMapping("/loadException")
	public String loadException(HttpServletRequest request,Map<String, Object> model, Principal auth) {
		String category = request.getParameter("category");
		System.out.println(category);
		String id = request.getParameter("id");
		//System.out.println(auth);
		List<JsonModel> listOfJsonObject = reconDao.loadException(id);
		List<BreakAction> listOfActions = reconDao.loadBreakActions();
		Authentication authUser = SecurityContextHolder.getContext().getAuthentication();
		System.out.println(authUser.getAuthorities());
		Map<String, ExceptionResponse> exceptionRes = new HashMap<String, ExceptionResponse>();
		
		for(JsonModel eachModel: listOfJsonObject) {
			ExceptionResponse next = new ExceptionResponse();
			next.setFileRowId(eachModel.getFileRowId());
			next.setTradeid(eachModel.getTradeid());
			next.setSide(eachModel.getSide());
			next.setComment(eachModel.getComment());
			next.setCategory(eachModel.getCategory());
			next.setSubcat1(eachModel.getSubcategory());
			next.setAttributeName(eachModel.getAttribute());
			next.setAttributeValue(eachModel.getValue());
			next.setCounterpartyName(eachModel.getCounterpartyname());
			next.setStatus(eachModel.getStatus());
			final String excepetionCategory = eachModel.getSubcategory().replaceAll("\\s","");
			for (BreakAction action : listOfActions) {
				final String breakActionExce = action.getName().replaceAll("\\s","");
				if (breakActionExce.equalsIgnoreCase(excepetionCategory)) {
					next.setAction1(action.getAction1());
					next.setAction2(action.getAction2());
					next.setBreakId(action.getId());
				}
			}
			if(category !=null && !"0".equals(category)){
				if(Integer.valueOf(category) == next.getBreakId()){
					exceptionRes.put(eachModel.getTradeid(), next);
				}
			}else{
				exceptionRes.put(eachModel.getTradeid(), next);
			}
			
		}
		
		model.put("exceptions", exceptionRes.values());
		model.put("access", authUser.getAuthorities());
		model.put("breakActions", listOfActions);
		model.put("excCategoryId",Integer.valueOf(category));
		if(category !=null && !"0".equals(category)){
			
			for (BreakAction action : listOfActions) {
				if(action.getId() == Integer.valueOf(category) ){
					model.put("action1", action.getAction1());
					model.put("action2", action.getAction2());
					break;
				}
			}
		}
		return "ExceptionPage";
	}
	
	@RequestMapping("/loadReportDashboard")
	public String loadReportDashboard(@RequestParam String rpName) {
		
		return "dashboradReport";
	}
	
	@RequestMapping("/mainPage")
	public String mainPage(HttpServletRequest request,Map<String, Object> model) {
		String fileId = request.getParameter("id");
		loadBasic(request, model);

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
	
	@RequestMapping(value = "/upload")
	protected void processRequest(HttpServletRequest request,
	        HttpServletResponse response)
	        throws ServletException, IOException {
	    response.setContentType("text/html;charset=UTF-8");

	    // Create path components to save the file
	    final String path = request.getParameter("destination");
	    final Part filePart = request.getPart("file");
	    final String fileName = getFileName(filePart);

	    OutputStream out = null;
	    InputStream filecontent = null;
	    final PrintWriter writer = response.getWriter();

	    try {
	        out = new FileOutputStream(new File(path + File.separator
	                + fileName));
	        filecontent = filePart.getInputStream();

	        int read = 0;
	        final byte[] bytes = new byte[1024];

	        while ((read = filecontent.read(bytes)) != -1) {
	            out.write(bytes, 0, read);
	        }
	        writer.println("New file " + fileName + " created at " + path);
	    } catch (FileNotFoundException fne) {
	        writer.println("You either did not specify a file to upload or are "
	                + "trying to upload a file to a protected or nonexistent "
	                + "location.");
	        writer.println("<br/> ERROR: " + fne.getMessage());

	    } finally {
	        if (out != null) {
	            out.close();
	        }
	        if (filecontent != null) {
	            filecontent.close();
	        }
	        if (writer != null) {
	            writer.close();
	        }
	    }
	}
	
	private String getFileName(final Part part) {
	    final String partHeader = part.getHeader("content-disposition");
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}
	
	@RequestMapping("/indexPage")
	public String IndexPage(HttpServletRequest request,Model model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	     String name = auth.getName(); //get logged in username
	      model.addAttribute("username", "Hello "+ name);
	      //set the recons
	      final List<ReconModel> recons = reconDao.loadRecons();
	      model.addAttribute("recons", recons);
		return "index";
		
	}
	
}
