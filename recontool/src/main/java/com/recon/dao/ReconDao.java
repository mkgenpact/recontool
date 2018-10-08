package com.recon.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.recon.model.BreakAction;
import com.recon.model.FoMoResponse;
import com.recon.model.JsonModel;
import com.recon.model.ReconFile;
import com.recon.model.ReconModel;

@Component
public class ReconDao {
	
	@Autowired
    JdbcTemplate jdbcTemplate;
	
	public List<ReconModel> loadRecons(){
		
		List<ReconModel> recons = jdbcTemplate.query("select * from reconfiles", new RowMapper<ReconModel>() {

			@Override
			public ReconModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReconModel rm = new ReconModel();
				rm.setReconId(rs.getInt("id"));
				rm.setName(rs.getString("name"));
				rm.setDescription(rs.getString("description"));
				rm.setInformation(rs.getString("information"));
				rm.setRunschedule(rs.getString("runschedule"));
				return rm;
			}
			
		});
		return recons;
		
	}
	

public List<ReconModel> loadReconsByName(String fileName){
		
		List<ReconModel> recons = jdbcTemplate.query("select * from reconfiles where name='"+fileName+"'", new RowMapper<ReconModel>() {

			@Override
			public ReconModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReconModel rm = new ReconModel();
				rm.setReconId(rs.getInt("id"));
				rm.setName(rs.getString("name"));
				rm.setDescription(rs.getString("description"));
				rm.setInformation(rs.getString("information"));
				rm.setRunschedule(rs.getString("runschedule"));
				return rm;
			}
			
		});
		return recons;
		
	}

	public ReconModel loadBasic(String id){
		
		List<ReconModel> recons = jdbcTemplate.query("select * from reconfiles where id="+id, new RowMapper<ReconModel>() {
			@Override
			public ReconModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReconModel rm = new ReconModel();
				rm.setReconId(rs.getInt("id"));
				rm.setName(rs.getString("name"));
				rm.setDescription(rs.getString("description"));
				rm.setInformation(rs.getString("information"));
				rm.setRunschedule(rs.getString("runschedule"));
				return rm;
			}
		});
		return recons.get(0);
		
	}
	
	public List<JsonModel> loadException(String id){
		
		Gson g = new Gson(); 
		
		List<JsonModel> jsonData = jdbcTemplate.query("select id,jsonrowdata, comment,breakactions_id from filerowdata where reconfiles_id="+id,
				new RowMapper<JsonModel>() {
			@Override
			public JsonModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				String fileRowId = String.valueOf(rs.getInt("id"));
				String jsonString = rs.getString("jsonrowdata");
				String comment = rs.getString("comment");
				String breakActionId = rs.getString("breakactions_id");
				//System.out.println(jsonString);
				JsonModel[] p = null; 
				p = g.fromJson(jsonString, JsonModel[].class);
				//System.out.println(p);
				p[0].setFileRowId(fileRowId);
				p[0].setComment(comment);
				p[0].setBreakactionid(breakActionId);
				return p[0];
			}
		});
		return jsonData;
		
	}
	
public List<BreakAction> loadBreakActions(){
		
		List<BreakAction> dbData = jdbcTemplate.query("select * from breakactions",
				new RowMapper<BreakAction>() {
			@Override
			public BreakAction mapRow(ResultSet rs, int rowNum) throws SQLException {
				BreakAction rm = new BreakAction();
				rm.setId(rs.getInt("id"));
				rm.setName(rs.getString("name"));
				rm.setAction1(rs.getString("action1"));
				rm.setAction2(rs.getString("action2"));
				return rm;
			}
		});
		return dbData;
		
	}


public void updateFoMoStatus(FoMoResponse[] resList){
	for(FoMoResponse res : resList){
		Gson g = new Gson(); 
		List<JsonModel> jsonData = jdbcTemplate.query("select jsonrowdata from filerowdata where id="+Integer.parseInt(res.getId()),
				new RowMapper<JsonModel>() {
			@Override
			public JsonModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				String jsonString = rs.getString("jsonrowdata");
				//System.out.println(jsonString);
				JsonModel[] p = null; 
				p = g.fromJson(jsonString, JsonModel[].class);
				//System.out.println(p);
				return p[0];
			}
		});
		if(jsonData ==null || jsonData.size() ==0){
			throw new IllegalArgumentException("Json recod not found for the id = "+res.getId());
		}
		JsonModel jsonMode= jsonData.get(0);
		jsonMode.setComment(res.getMessage());
		jsonMode.setActiontaken(res.getActiontaken());
		//update in database
		JsonModel[] jsoUpArray = {jsonMode} ;
		String jsonUpdStr = g.toJson(jsoUpArray);
		System.out.println(jsonUpdStr);
		
		jdbcTemplate.update("update filerowdata set jsonrowdata =?,comment=?,actiontaken=? where id= ? ", new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, jsonUpdStr);
				ps.setString(2, jsonMode.getComment());
				ps.setString(3, jsonMode.getActiontaken());
				ps.setInt(4, Integer.parseInt(res.getId()));
			}
		});
	}
}

public void createFile(ReconModel recModel){
	jdbcTemplate.update("insert into reconfiles(name,description,runschedule,information) values(?,?,?,?)", new PreparedStatementSetter(){
		@Override
		public void setValues(PreparedStatement ps) throws SQLException {
			ps.setString(1, recModel.getName());
			ps.setString(2, recModel.getDescription());
			ps.setString(3, recModel.getRunschedule());
			ps.setString(4, recModel.getInformation());
		}
		
	});
}


public void populateReconRowData(ReconFile[] recons, int recFileId) {
	
	List<BreakAction> breakActions = loadBreakActions();
	
	for(ReconFile recon : recons){
		List<BreakAction> breks =breakActions.stream().filter(action ->(action.getName().equals(recon.getBreakaction()))).
		collect(Collectors.toList());
		final String action = (breks!=null && breks.size()>0)?String.valueOf(breks.get(0).getId()):null;
		jdbcTemplate.update("insert into filerowdata(reconfiles_id,jsonrowdata,breakactions_id,insertdate) values(?,?,?,CURDATE())", new PreparedStatementSetter(){

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, recFileId);
				ps.setString(2, recon.getJsonrowdata());
				ps.setString(3, action );
			}
			
		});
	}
	
}


}
