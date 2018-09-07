package com.recon.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.recon.model.JsonModel;
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
		
		List<JsonModel> jsonData = jdbcTemplate.query("select jsonrowdata from filerowdata where reconfiles_id="+id,
				new RowMapper<JsonModel>() {
			@Override
			public JsonModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				String jsonString = rs.getString("jsonrowdata");
				System.out.println(jsonString);
				JsonModel[] p = null; 
				p = g.fromJson(jsonString, JsonModel[].class);
				System.out.println(p);
				return p[0];
			}
		});
		return jsonData;
		
	}
}
