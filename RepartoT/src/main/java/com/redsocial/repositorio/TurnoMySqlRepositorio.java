package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Turno;
@Repository
public class TurnoMySqlRepositorio implements TurnoRepositorio {

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<Turno> mapperTurno = new RowMapper<Turno>() {
		@Override
		public Turno mapRow(ResultSet rs, int rowNum) throws SQLException {
			Turno obj = new Turno();
			obj.setIdTurno(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			return obj;
		}
	};
	
	@Override
	public List<Turno> listaTurno() {
		List<Turno> lista = jdbcTemplate.query("select * from turno", new Object[] {} ,mapperTurno);
		return lista;
	}

}
