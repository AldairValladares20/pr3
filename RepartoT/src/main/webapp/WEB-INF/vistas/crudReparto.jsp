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
 <h1>Crud de Reparto</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudReparto">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudReparto" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">codrepartidor</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el codrepartidor" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
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
												<th>Actualiza</th>
												<th>Elimina</th>
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
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idReparto}','${x.codrepartidor}','${x.direccion}','${x.nombreTienda}','${x.precioMaxima}','${x.precioMinima}','${x.total}','${x.turno.idTurno}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idReparto}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Reparto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudReparto" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Reparto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_codrepartidor">codrepartidor</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_codrepartidor" name="codrepartidor" placeholder="Ingrese el codrepartidor" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_num_hombres">DIRECCION</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_num_hombres" name="direccion" placeholder="Ingrese el número de hombres" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_num_mujeres">NOMBRE TIENDA</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_num_mujeres" name="nombreTienda" placeholder="Ingrese el número de mujeres" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_maxima">PRECIO MAXIMO</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_maxima" name="precioMaxima" placeholder="Ingrese la edad máxima" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_minima">PRECIO MINIMO</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_minima" name="precioMinima" placeholder="Ingrese la edad mínima" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_minima">Total</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_minima" name="precioMinima" placeholder="Ingrese la edad mínima" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_turno">Turno</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_turno" name="turno.idTurno" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Reparto</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudReparto" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Reparto</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idReparto" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_codrepartidor">codrepartidor</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_codrepartidor" name="codrepartidor" placeholder="Ingrese el codrepartidor" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_num_hombres">direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_num_hombres" name="direccion" placeholder="Ingrese el número de hombres" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_num_mujeres">Nombre Tienda</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_num_mujeres" name="nombreTienda" placeholder="Ingrese el número de mujeres" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_maxima">Precio Máxima</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_maxima" name="precioMaxima" placeholder="Ingrese la edad máxima" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_minima">Precio Mínima</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_minima" name="precioMinima" placeholder="Ingrese la edad mínima" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_total">Total</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_total" name="preciototal" placeholder="Ingrese la edad mínima" type="text" maxlength="4"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_turno">Turno</label>
		                                        <div class="col-lg-5">
													<select id="id_act_turno" name="turno.idTurno" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
$.getJSON("cargaTurno", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_turno").append("<option value="+item.idTurno +">"+ item.nombre +"</option>");
		$("#id_act_turno").append("<option value="+item.idTurno +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,codrepartidor,direccion,nombreTienda,precioMaxima, precioMinima,total , idTurno){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_codrepartidor]').val(codrepartidor);
	$('input[id=id_act_num_hombres]').val(direccion);
	$('input[id=id_act_num_mujeres]').val(nombreTienda);
	$('input[id=id_act_minima]').val(precioMinima);
	$('input[id=id_act_maxima]').val(precioMaxima);
	$('input[id=id_act_total]').val(total);
	$('select[id=id_act_turno]').val(idTurno);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"codrepartidor": {
        		selector : '#id_reg_codrepartidor',
                validators: {
                    notEmpty: {
                        message: 'El codrepartidor es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El codrepartidor es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "direccion": {
        		selector : '#id_reg_num_hombres',
                validators: {
                    notEmpty: {
                        message: 'La direccion es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'Nombre tienda es de 3 a 20 caracteres',
                    	min : 5,
                    	max : 20
		            }
                }
            },
            "nombreTienda": {
        		selector : '#id_reg_num_mujeres',
                validators: {
                	notEmpty: {
                        message: 'El número de mujeres es un campo obligatorio'
                	 },
                     stringLength :{
                     	message:'Nombre tienda es de 3 a 20 caracteres',
                     	min : 5,
                     	max : 20
		            }
                }
            },
            "precioMaxima": {
        		selector : '#id_reg_maxima',
                validators: {
                	notEmpty: {
                        message: 'La edad máxima es un campo obligatorio'
                    },
                    lessThan: {
		                value: 35,
		                inclusive: true,
		                message: 'precio es menor a 5000'
		            },
		            greaterThan: {
		                value: 18,
		                inclusive: true,
		                message: 'precio es mayor a 20'
		            }
                }
            },
            "precioMinima": {
        		selector : '#id_reg_minima',
                validators: {
                	notEmpty: {
                        message: 'La edad mínima es un campo obligatorio'
                    },
                    lessThan: {
		                value: 35,
		                inclusive: true,
		                message: 'precio es menor a 5000'
		            },
		            greaterThan: {
		                value: 18,
		                inclusive: true,
		                message: 'precio es mayor a 20'
		            }
                }
            },
            "total": {
        		selector : '#id_reg_total',
                validators: {
                	notEmpty: {
                        message: 'El totales un campo obligatorio'
                    },
                    lessThan: {
		                value: 35,
		                inclusive: true,
		                message: 'El total es menor a 5000'
		            },
		            greaterThan: {
		                value: 18,
		                inclusive: true,
		                message: 'El total es mayor a 20'
		            }
                }
            },
            "turno.idTurno": {
        		selector : '#id_reg_turno',
                validators: {
                	notEmpty: {
                        message: 'El turno un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"codrepartidor": {
        		selector : '#id_act_codrepartidor',
                validators: {
                    notEmpty: {
                        message: 'El codrepartidor es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El codrepartidor es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "direccion": {
        		selector : '#id_act_num_hombres',
                validators: {
                	notEmpty: {
                        message: 'LA direccion  de hombres es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El  codigo repartidor es de 6 a 20 caracteres',
                    	min : 6,
                    	max : 20
		            }
                }
            },
            "nombreTienda": {
        		selector : '#id_act_num_mujeres',
                validators: {
                	notEmpty: {
                        message: 'Nombre tienda  es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'Nombre tienda es de 3 a 20 caracteres',
                    	min : 5,
                    	max : 20
		            }
                }
            },
            "precioMaxima": {
        		selector : '#id_act_maxima',
                validators: {
                	notEmpty: {
                        message: 'La edad máxima es un campo obligatorio'
                    },
                    lessThan: {
		                value: 35,
		                inclusive: true,
		                message: 'La edad es menor a 35'
		            },
		            greaterThan: {
		                value: 18,
		                inclusive: true,
		                message: 'La edad es mayor a 18'
		            }
                }
            },
            "precioMinima": {
        		selector : '#id_act_minima',
                validators: {
                	notEmpty: {
                        message: 'La edad mínima es un campo obligatorio'
                    },
                    lessThan: {
		                value: 35,
		                inclusive: true,
		                message: 'La edad es menor a 35'
		            },
		            greaterThan: {
		                value: 18,
		                inclusive: true,
		                message: 'La edad es mayor a 18'
		            }
                }
            },
            "total": {
        		selector : '#id_act_total',
                validators: {
                	notEmpty: {
                        message: 'El total es un campo obligatorio'
                    },
                    lessThan: {
		                value: 35,
		                inclusive: true,
		                message: 'El total es menor a 5000'
		            },
		            greaterThan: {
		                value: 18,
		                inclusive: true,
		                message: 'EL total es mayor a 20'
		            }
                }
            },
            "turno.idTurno": {
        		selector : '#id_act_turno',
                validators: {
                	notEmpty: {
                        message: 'El turno un campo obligatorio'
                    },
                }
            },
          
        }   
    });
</script>
    
</body>
</html> 