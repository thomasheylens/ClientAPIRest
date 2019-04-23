<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>Liste des villes</title>
	</head>
	<body>
		<div class="container-fluid bg-primary text-white" id="top-bar">
			<div class="row p-4">
				<div class="col-3">
					<a href="index.jsp" class="btn btn-outline-light">Retour à l'accueil</a>
				</div>
				<div class="col-6">
					<h2 class="text-center">Villes</h2>
				</div>
			</div>
		</div>
		<div class="container mt-5">
			<div class="card">
				<div class="card-header">
		    		Liste des villes
		  		</div>
		  		<div class="card-body">
		    		
					<table id="table" class="table table-striped table-hover table-bordered">
					  	<thead>
					    	<tr>
							      <th scope="col">Code commune INSEE</th>
							      <th scope="col">Nom commune</th>
							      <th scope="col">Code postal</th>
							      <th scope="col">Actions</th>
					    	</tr>
					  	</thead>
					  	<tbody>
					    	<c:forEach var="ville" items="${villes}">
					    		<tr>
						    		<th>${ville.getCodeCommuneINSEE()}</th>
							    	<td>${ville.getNomCommune()}</td>
							    	<td>${ville.getCodePostal()}</td>
							    	<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal">Editer</button></td>
							    </tr>
							    <!-- Modal -->
								<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">Editer une ville</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								      	<form method="POST" action="POST">
								      		<div class="form-group">
								            	<label for="nomCommune" class="col-form-label">Nom Commune</label>
								            	<input type="text" class="form-control" id="nomCommune" value="${ville.getNomCommune()}">
								          	</div>
								          	<div class="form-group">
								            	<label for="codePostal" class="col-form-label">Code Postal</label>
								            	<input type="text" class="form-control" id="codePostal">
								          	</div>
								          	<div class="form-group">
								            	<label for="libelleAcheminement" class="col-form-label">Libellé acheminement</label>
								            	<input type="text" class="form-control" id="libelleAcheminement">
								          	</div>
								          	<div class="form-group">
								            	<label for="ligne5" class="col-form-label">Ligne 5</label>
								            	<input type="text" class="form-control" id="ligne5">
								          	</div>
								          	<div class="form-group">
								            	<label for="latitude" class="col-form-label">Latitude</label>
								            	<input type="text" class="form-control" id="latitude">
								          	</div>
								          	<div class="form-group">
								            	<label for="longitude" class="col-form-label">Longitude</label>
								            	<input type="text" class="form-control" id="longitude">
								          	</div>
								        </form>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
								        <button type="button" class="btn btn-primary">Enregistrer</button>
								      </div>
								    </div>
								  </div>
								</div>
					    	</c:forEach>
					 	</tbody>
					</table>
				</div>
			</div>
		</div>
	</body>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
