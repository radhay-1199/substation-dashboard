package com.gl.substation.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JdbcService {

	
	  @Autowired private JdbcTemplate jdbcTemplate;
	  
	  public JdbcTemplate getJdbcTemplate()
	  { 
		  return jdbcTemplate;
	  } 
	  
	  public void setJdbcTemplate(JdbcTemplate jdbcTemplate) { 
		  this.jdbcTemplate = jdbcTemplate; 
	  }
	 
}
