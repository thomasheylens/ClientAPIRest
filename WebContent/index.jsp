<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>Accueil</title>
	</head>
	<body>
		<div class="text-center" id="choice-content">
			<h1><strong>Bienvenue sur votre plateforme des villes de France</strong></h1>
			<h4><em>Que souhaitez-vous faire ?</em></h4>
			
			<br /><br />
			
			<div id="btn-choice-elt">
				<a href="VillesServlet" class="btn btn-primary btn-lg btn-choice">Voir la liste des villes</a>
				<a href="DistanceServlet" class="btn btn-primary btn-lg btn-choice">Calculer une distance</a>
			</div>
		</div>
	</body>
</html>
