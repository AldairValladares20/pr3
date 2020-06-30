package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.Turno;
import com.redsocial.entidad.Reparto;

@Repository
public class RepartoMySqlRepositorio implements RepartoRepositorio{
	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<Reparto> mapperReparto = new RowMapper<Reparto>() {
		@Override
		public Reparto mapRow(ResultSet rs, int rowNum) throws SQLException {
			Reparto obj = new Reparto();
			obj.setIdreparto(rs.getInt(1));
			obj.setCodrepartidor(rs.getString(2));
			obj.setDireccion(rs.getString(3));
			obj.setNombreTienda(rs.getString(4));
			obj.setPrecioMaxima(rs.getInt(5));
			obj.setPrecioMinima(rs.getInt(6));
			obj.setTotal(rs.getDouble(7));
			
			Turno objDep = new Turno();
			objDep.setIdTurno(rs.getInt(8));
			objDep.setNombre(rs.getString(9));
		
			obj.setTurno(objDep);
			
			return obj;
		}
	};
	
	@Override
	public Reparto insertaActualizaReparto(Reparto obj) {
		Reparto salida = null;
		if (obj.getIdreparto() == 0) {
			jdbcTemplate.update("insert into reparto values(null,?,?,?,?,?,?,?)",
			new Object[] {obj.getCodrepartidor(), obj.getDireccion(), obj.getNombreTienda(), obj.getPrecioMaxima(),obj.getPrecioMinima(),obj.getTotal(),obj.getTurno().getIdTurno()});	
			List<Reparto> lista = jdbcTemplate.query("select m.*,d.Codrepartidor from Reparto m inner join reparto d on m.idReparto = d.idreparto order by m.idreparto desc limit 0, 1",new Object[] {} ,mapperReparto);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update reparto set codrepartidor=?,direccion=?,nombreTienda=?,PrecioMaxima=?,PrecioMinima =?,total =?, idReparto = ? where idreparto=?", new Object[] {obj.getCodrepartidor(), obj.getDireccion(), obj.getNombreTienda(), obj.getPrecioMaxima(),obj.getPrecioMinima(),obj.getTotal(),obj.getTurno().getIdTurno(), obj.getIdreparto()});
			List<Reparto> lista = jdbcTemplate.query("select m.*,d.codrepartidor from reparto m inner join reparto d on m.idReparto = d.idreparto where m.idreparto =?",new Object[] {obj.getIdreparto()} ,mapperReparto);
			salida = lista.get(0);
		}
		return salida;
	}

	@Override
	public void eliminaReparto(int idReparto) {
		jdbcTemplate.update("delete from reparto where idreparto = ?",new Object[] {idReparto});		
	}
	@Override
	public List<Reparto> listaReparto() {
		List<Reparto> lista = jdbcTemplate.query("select m.*,d.codrepartidor from reparto m inner join reparto d on m.idReparto = d.idreparto", new Object[] {} ,mapperReparto);
		return lista;
	}

	@Override
	public List<Reparto> listaRepartoPorNombre(String nom) {
		List<Reparto> lista = jdbcTemplate.query("select m.*,d.codrepartidor from reparto m inner join reparto d on m.idReparto = d.idreparto where m.codrepartidor like ?", new Object[] {nom} ,mapperReparto);
		return lista;
	}

	@Override
	public List<Reparto> listaReparto(int idTurno, String nombre, int precio) {
		List<Reparto> lista = jdbcTemplate.query("select m.*,d.codrepartidor from reparto m inner join reparto d on m.idReparto = d.idreparto where m.idReparto =? and m.codrepartidor like ? and m.precioMinima<= ? and m.precioMaxima>= ? ", new Object[] {idTurno, nombre, precio,precio} ,mapperReparto);
		return lista;
	}
	}


