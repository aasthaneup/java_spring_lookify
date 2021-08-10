<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container">
		<div class="newheader">
			<a href="/dashboard" class="float-right">Dashboard</a>
		</div>
		<div class="content">
			<h4>
				Title:
				<c:out value="${song.title}"></c:out>
			</h4>
			<h4>
				Artist:
				<c:out value="${song.artist}"></c:out>
			</h4>
			<h4>
				Rating (1-10):
				<c:out value="${song.rating}"></c:out>
			</h4>
		</div>
		<form action="/songs/${song.id}" method="post">
			<input type="hidden" name="_method" value="delete">
			<button class="btn btn-danger">Delete</button>
		</form>
	</div>
</body>
</html>