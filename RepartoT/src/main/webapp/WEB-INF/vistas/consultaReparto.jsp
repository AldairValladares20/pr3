<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Valladares</title>
</head>

<body> 
<div class="container">
 <h2>Consulta de Reparto</h2>
		 <div class="col-md-23" >  
		       <form accept-charset="UTF-8"  action="consultaReparto" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
								<select id="id_turno" name="idTurno" class='form-control'>
										<option value=" "> [ Seleccione Reparto]</option>    
								</select>
						</div>
						<div class="col-md-3">
								<input class="form-control" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" type="text"/>
						</div>
						<div class="col-md-3">
								<input class="form-control" id="id_precio" name="precio" placeholder="Ingrese el precio" type="text" maxlength="2"/>
						</div>
						<div class="col-md-3">
								<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>CodRepartidor</th>
												<th>Direccion</th>
												<th>NombreTienda</th>
												<th>Precio Máximo</th>
												<th>Precio Minimo</th>
												<th>Total</th>
												<th>Turno</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${modalidades}" var="x">
													<tr>
														<td>${x.idReparto}</td>
														<td>${x.codrepartidor}</td>
														<td>${x.direccion}</td>
														<td>${x.nombreTienda}</td>
														<td>${x.precioMaxima}</td>
														<td>${x.precioMinima}</td>
														<td>${x.total}</td>
														<td>${x.turno.nombre}</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
 </div>

<script type="text/javascript">
$.getJSON("cargaTurno", {}, function(data){
	$.each(data, function(index,item){
		$("#id_turno").append("<option value="+item.idTurno +">"+ item.nombre +"</option>");
	});
});
</script>
    
</body>
</html> 