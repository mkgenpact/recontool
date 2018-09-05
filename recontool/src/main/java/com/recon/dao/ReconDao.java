package com.recon.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

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

}
