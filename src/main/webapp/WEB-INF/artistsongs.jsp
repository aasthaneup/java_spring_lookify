<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container">
		<div class=header>
			<h5>Songs by artist: <c:out value="${artist}"/></h5>
			<form action="/search" method="post">
				<input type="text" name="artist"> <input type="submit"
					value="New Search" class="btn btn-primary">
			</form>
		</div>
		<div class="content">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Title</th>
						<th scope="col">Rating</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${artistSongs}" var="song">
						<tr>
							<td scope="row"><a href="/songs/${song.id}">${song.title}</a></td>
							<td><c:out value="${song.rating}" /></td>
							<td>
								<form action="/songs/${song.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<button class="btn btn-danger">Delete</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>