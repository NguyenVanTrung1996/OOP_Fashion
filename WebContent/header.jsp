<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bonfire a Ecommerce Category Flat Bootstarp Responsive
	Website Template | Home :: w3layouts</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
	 function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!--slider-script-->
<script src="js/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider1").responsiveSlides({
			auto : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>
<!--//slider-script-->
<script>
	$(document).ready(function(c) {
		$('.alert-close').on('click', function(c) {
			$('.message').fadeOut('slow', function(c) {
				$('.message').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.alert-close1').on('click', function(c) {
			$('.message1').fadeOut('slow', function(c) {
				$('.message1').remove();
			});
		});
	});
</script>
<title>Product</title>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.0&appId=189276175030169&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</head>
<body>

	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		Users users = null;
		if (session.getAttribute("user") != null) {
			users = (Users) session.getAttribute("user");
		}
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>

	<!--header-->
	<div class="header">
		<div class="header-top">
			<div class="container">
				<div class="header-top-in">
					<div class="logo">
						<a href="index.jsp"><img src="images/logo.png" alt=" "></a>
					</div>
					<div class="header-in">
						<ul class="icon1 sub-icon1">
							<%
								if (users != null) {
							%>
							<li><a href="index.jsp"><%=users.getUserEmail()%></a></li>
							<%
								}
							%>
							<%
								if (users == null) {
							%>
							<li><a href="login.jsp">LOGIN</a></li>
							<li><a href="register.jsp">REGISTER</a></li>
							<%
								}
							%>
							<%
								if (users != null) {
							%>
							<li><a href="UsersServlet">LOGOUT</a></li>
							<li><a href="checkout.jsp">CHECKOUT</a></li>
							<%
								}
							%>
							
							<%-- 
							<li>
								<form action="UsersServlet" method="GET">
									<input type="submit" value="LOGOUT" >
								</form>
							</li>
							--%>
							<li><div class="cart">
									<a href="#" class="cart-in"> </a> <span> <%=cart.countItem()%></span>
								</div>
								<ul class="sub-icon1 list">
									<h3>Recently added items</h3>
									<div class="shopping_cart">
										<%
											for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {
										%>
										<div class="cart_box">
											<div class="message">
												<div class="alert-close"></div>
												<div class="list_img">
													<img
														src="<%=list.getValue().getProduct().getProductImage()%>"
														class="img-responsive" alt="">
												</div>
												<div class="list_desc">
													<h4>
														<a
															href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"><%=list.getValue().getProduct().getProductName()%></a>
													</h4>
													<%=list.getValue().getQuantity()%>
													x<span class="actual"> $<%=list.getValue().getProduct().getProductPrice()%></span>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<%
											}
										%>

									</div>
									<div class="total">
										<div class="total_left">Cart Subtotal:</div>
										<div class="total_right">
											$<%=cart.totalCart()%></div>
										<div class="clearfix"></div>
									</div>
									<div class="login_buttons">
										<div class="check_button">
											<a href="checkout.jsp">Check out</a>
										</div>
									</div>
									<div class="clearfix"></div>
								</ul>
								</li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="container">
				<div class="h_menu4">
					<a class="toggleMenu" href="#">Menu</a>
					<ul class="nav">
						<li class="active"><a href="index.jsp"><i> </i>Home</a></li>
						<li><a href="#">CATEGORY</a>
							<ul class="drop">
								<%
									for (Category c : categoryDAO.getListCategory()) {
								%>
								<li><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1"><%=c.getCategoryName()%></a></li>
								<%
									}
								%>
							</ul></li>
						<li><a href="contact.jsp">Contact </a></li>

					</ul>
					<script type="text/javascript" src="js/nav.js"></script>
				</div>
			</div>
		</div>
		<div class="header-bottom-in">
			<div class="container">
				<div class="header-bottom-on">
					<p class="wel">
						<a href="#">Welcome visitor you can login or create an
							account.</a>
					</p>
					<div class="header-can">
						<ul class="social-in">
							<li><a href="#"><i> </i></a></li>
							<li><a href="#"><i class="facebook"> </i></a></li>
							<li><a href="#"><i class="twitter"> </i></a></li>
							<li><a href="#"><i class="skype"> </i></a></li>
						</ul>
						<div class="down-top">
							<select class="in-drop">
								<option value="Dollars" class="in-of">Dollars</option>
								<option value="Euro" class="in-of">Euro</option>
								<option value="Yen" class="in-of">Yen</option>
							</select>
						</div>
						<div class="search">
							<form>
								<input type="text" value="Search" onfocus="this.value = '';"
									onblur="if (this.value == '') {
                                                this.value = '';
                                            }">
								<input type="submit" value="">
							</form>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>