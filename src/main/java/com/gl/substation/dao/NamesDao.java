package com.gl.substation.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import com.gl.substation.view.Names;


@Component
public class NamesDao {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private JdbcService jdbcService;
	
	public List<Names> getAllName(){ 
		String query ="select id, name from test";
		logger.info("query: "+query);
		 return jdbcService.getJdbcTemplate().query(query,new ResultSetExtractor<List<Names>>(){  
		    @Override  
		     public List<Names> extractData(ResultSet rs) throws SQLException,  
		            DataAccessException {  
		      List<Names> NamesList=new ArrayList<Names>();  
		        while(rs.next()){  
		        	Names name=new Names(); 
		        	name.setId(rs.getInt("id"));
		        	name.setName(rs.getString("name"));
		        	NamesList.add(name);
		        }  
		        return NamesList;  
		        }  
		    });  
	}

}
