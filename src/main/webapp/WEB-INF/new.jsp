<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Song</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container newcontainer">
		<div class="newheader">
			<a href="/dashboard" class="float-right">Dashboard</a>
		</div>
		<div class="content">
			<form:form action="/songs/new" method="post" modelAttribute="song">
				<div class="form-group">
					<p>
						<form:label path="title">Title</form:label>
						<form:errors path="title" />
						<form:input path="title" />
					</p>
					<p>
						<form:label path="artist">Artist</form:label>
						<form:errors path="artist" />
						<form:input path="artist" />
					</p>
					<p>
						<form:label path="rating">Rating (1-10)</form:label>
						<form:errors path="rating" />
						<form:input type="number" path="rating" />
					</p>
					<input class="float-right mr-5 mt-3 btn btn-success" type="submit"
						value="Submit" />
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>