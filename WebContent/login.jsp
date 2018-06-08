<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="account">
			<h2 class="account-in">login</h2>
			<form action="UsersServlet" method="POST">
				<%
					if (request.getParameter("error") != null) {
				%>
				<div>
					<p style="color: red"><%=request.getParameter("error")%></p>
				</div>
				<%
					}
				%>
				<div>
					<span>Username *</span> <input type="text" name="email">
				</div>
				<div>
					<span class="word">Password *</span> <input type="password"
						name="pass">
				</div>
				<input type="hidden" value="login" name="command"> <input
					type="submit" value="Login">
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>