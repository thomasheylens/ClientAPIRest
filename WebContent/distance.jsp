<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>Distance</title>
	</head>
	<body>
		<div class="container-fluid bg-primary text-white" id="top-bar">
			<div class="row p-4">
				<div class="col-3">
					<a href="index.jsp" class="btn btn-outline-light">Retour à l'accueil</a>
				</div>
				<div class="col-6">
					<h2 class="text-center">Distance</h2>
				</div>
			</div>
		</div>
		<div class="container mt-5">
			<div class="row">
				<form action="DistanceServlet" method="POST">
					<div class="form-group">
				    	<label for="ville1">Choisissez la première ville</label>
				    	<select class="form-control" id="ville1" name="ville1">
				      		<c:forEach var="ville1" items="${villes}">
								<option value="<c:out value="${ville1.getCodeCommuneINSEE()}"/>">${ville1.getNomCommune()}</option>
							</c:forEach>
				    	</select>
				  	</div>
				  	<div class="form-group">
				    	<label for="ville2">Choisissez la deuxième ville</label>
				    	<select class="form-control" id="ville2" name="ville2">
				      		<c:forEach var="ville2" items="${villes}" varStatus="loop">
								<option value="<c:out value="${ville2.getCodeCommuneINSEE()}"/>">${ville2.getNomCommune()}</option>
							</c:forEach>
				    	</select>
				  	</div>
				  	<button type="submit" class="btn btn-primary">Calculer</button>
				</form>
			</div>
			
			<div class="row">
				<h4>La distance entre ${ville1.getNomCommune()} et ${ville2.getNomCommune()} est de <c:out value="${distance}"/></h4>
			</div>
			
		</div>		
	</body>
</html>