package com.recon.user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.recon.model.User;

@Repository
public class UserRepository {
	
	@Autowired
    JdbcTemplate jdbcTemplate;
	
	public User findByUsername(String username) {
		 String sql = "select * from reconusers where username='" + username+"'";
		    List<User> users = jdbcTemplate.query(sql, new UserMapper());
		    return users.size() > 0 ? users.get(0) : null;
	}

}

class UserMapper implements RowMapper<User> {
	  public User mapRow(ResultSet rs, int arg1) throws SQLException {
	    User user = new User();
	    user.setUsername(rs.getString("username"));
	    user.setPassword(rs.getString("password"));
	    Set<String> roleList = new HashSet();
	    roleList.add(rs.getString("role"));
	    user.setRoles(roleList);
	    user.setApplication(rs.getString("application"));
	    return user;
	  }
}
