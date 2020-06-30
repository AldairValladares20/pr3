<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Valladares </title>
</head>
<body>

<div class="container">
<h1>Registra Reparto</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraReparto" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">CODREPARTIDOR</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_num_hombres">DIRECCION</label>
				<input class="form-control" id="id_num_hombres" name="numHombres" placeholder="Ingrese el número de hombres" type="text" maxlength="20"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_num_mujeres">NOMBRETIENDA</label>
				<input class="form-control" id="id_num_mujeres" name="numMujeres" placeholder="Ingrese el número de mujeres" type="text" maxlength="20"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_maxima">PRECIO MAXIMO</label>
				<input class="form-control" id="id_maxima" name="edadMaxima" placeholder="Ingrese la edad máxima" type="text" maxlength="4"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_minima">PRECIO MINIMO</label>
				<input class="form-control" id="id_minima" name="edadMinima" placeholder="Ingrese la edad mínima" type="text" maxlength="4"/>
			</div>
			<div class="form-group">
		    <label class="col-lg-3 control-label" for="id_total">Total</label>		        
				  <input class="form-control" id="id_total" name="preciototal" placeholder="Ingrese total " type="text" maxlength="10"/>
		       </div>  
			<div class="form-group">
				<label class="control-label" for="id_turno">TURNO</label>
				<select id="id_turno" name="turno.idTurno" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Libro</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$.getJSON("cargaTurno", {}, function(data){
	$.each(data, function(index,item){
		$("#id_turno").append("<option value="+item.idTurno +">"+ item.nombre +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El codigo repartidor es un campo obligatorio'
                },
                stringLength :{
                	message:'El  codigo repartidor es de 3 a 6 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        numHombres: {
    		selector : '#id_num_hombres',
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
        numMujeres: {
    		selector : '#id_num_mujeres',
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
        edadMaxima: {
    		selector : '#id_maxima',
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
        edadMinima: {
    		selector : '#id_minima',
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
    		selector : '#id_total',
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
        turno: {
    		selector : '#id_turno',
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
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




