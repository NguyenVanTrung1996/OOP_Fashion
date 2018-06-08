<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Content</title>
</head>
<body>
	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		ProductDAO dao = new ProductDAO();
	%>
	<div class="container">
		<div class="content">
			<%
				for (Category c : categoryDAO.getListCategory()) {
			%>
			<div class="content-top">
				<h3 class="future"><%=c.getCategoryName()%></h3>
				<div class="content-top-in">
					<%
						for (Product p : dao.getListProductByCategory(c.getCategoryID())) {
								System.out.println(p.getProductID() + " - " + p.getProductName());
					%>
					<div class="col-md-3 md-col">
						<div class="col-md">
							<a href="single.html"><img
								src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>" /></a>
							<div class="top-content">
								<h5>
									<a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a>
								</h5>
								<div class="white">
									<a
										href="CartServlet?command=plus&productID=<%=p.getProductID()%>"
										class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">ADD
										TO CART</a>
									<p class="dollar">
										<span class="in-dollar">$</span><span><%=p.getProductPrice()%></span>
									</p>
									<div class="clearfix"></div>
								</div>

							</div>
						</div>
					</div>

					<%
						}
					%>
					<div class="clearfix"></div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
</body>
</html>