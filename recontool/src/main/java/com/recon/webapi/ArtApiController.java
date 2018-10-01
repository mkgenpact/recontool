package com.recon.webapi;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.recon.dao.ReconDao;
import com.recon.model.FoMoResponse;
import com.recon.model.JsonModel;
import com.recon.model.ReconFile;
import com.recon.model.ReconModel;


@RestController
@RequestMapping("/artApi")
public class ArtApiController {
	
	@Autowired
	private ReconDao reconDao;
	
	/**
	 * expected json
	 * @param[{
		 "id" : "1",
		 "actiontaken" : "Activate FO",
		 "message" : "successfully update in FO"
		}]
	 * @param fomoresp
	 * @return
	 */
	@PostMapping("/updateFoMoResponse")
	public String updateFOMOResponse(@RequestBody String fomoresp){
		System.out.println(fomoresp.toString());
		Gson g = new Gson();
		FoMoResponse[] foMoUpdateArray = g.fromJson(fomoresp, FoMoResponse[].class);
		reconDao.updateFoMoStatus(foMoUpdateArray);
		return "updated Sucessfully";
	}
	
	/**
	 * 
	 * [{
		"name" : "fileName",
		"description" : "fileDescription",
		"runschedule" : "filerunschedule",
		"information" : "fileinformation",
		"jsonrowdata" : "[{\"side\":\"FO\",\"buysell\":\"Buy\",\"tradeid\":\"12345\",\"counterpartyid\":\"1234\",\"counterpartyname\":\"ABC DEF\",\"focode\":\"VIP\",\"status\":null,\"attribute\":null,\"category\":\"Singleton\",\"value\":null}]",
		"breakaction" : "Activate FO Inactivate MO"
		},
		{
		"name" : "fileName",
		"description" : "fileDescription",
		"runschedule" : "filerunschedule",
		"information" : "fileinformation",
		"jsonrowdata" : "[{\"side\":\"FO\",\"buysell\":\"Buy\",\"tradeid\":\"12345\",\"counterpartyid\":\"1234\",\"counterpartyname\":\"ABC DEF\",\"focode\":\"VIP\",\"status\":null,\"attribute\":null,\"category\":\"Singleton\",\"value\":null}]",
		"breakaction" : "Activate FO Inactivate MO"
		}]
	 * 
	 * @param json
	 * @return
	 */
	@PostMapping("/processReconFile")
	public String processReconFile(@RequestBody String json){
		System.out.println(json);
		Gson g = new Gson();
		ReconFile[] reconFilear = g.fromJson(json, ReconFile[].class);
		//now populate the recon file info
		//set data
		ReconModel recModel = new ReconModel();
		recModel.setName(reconFilear[0].getName());
		recModel.setDescription(reconFilear[0].getDescription());
		recModel.setInformation(reconFilear[0].getInformation());
		recModel.setRunschedule(reconFilear[0].getRunschedule());
		reconDao.createFile(recModel);
		
		//load file
		List<ReconModel> reconFileList =reconDao.loadReconsByName(recModel.getName());
		int recFileId = reconFileList.get(0).getReconId();
		
		reconDao.populateReconRowData(reconFilear,recFileId);
		
		return "Recon file has been successfully updated";
	}

}
