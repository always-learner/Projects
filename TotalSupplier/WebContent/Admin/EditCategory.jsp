<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Admin | TOTAL-SUPPLIER</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<%@include file="includes/header.jsp" %>
	
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Add Main category</h2>
						<form action="UpadetCategory" method="post" class="form-group">
						
						<%
						SessionFactory factory=HibernateUtil.getSessionFactory();
						Session sessionHB=factory.openSession();
						
						String hql = "FROM Category WHERE CategoryId = "+request.getParameter("category_id");
						Query query = sessionHB.createQuery(hql);
						@SuppressWarnings("unchecked")
						List<Category> categories=query.list();
						if(categories.size()>0)
						{
						Category category=categories.get(0);
						%>
							<label for="usr">Category ID:</label>
							<input type="hidden" value="<%out.print(request.getParameter("category_id"));%>" name="category_id"> 
							<input type="text" class="form-control" placeholder="Category id" name="category_id_demo" disabled="disabled" value="<%out.print(request.getParameter("category_id"));%>"/>
							<label for="usr">Category Name:</label>
							<input type="text" class="form-control" placeholder="Category name" name="category_name" value="<%out.print(category.getName());%>"/>
							<label for="usr">Category Description:</label>
							<textarea rows="3" class="form-control" cols="5" name="desc" placeholder="short descreption of category"><%out.print(category.getDescription());%></textarea>
							<label for="usr">Category Status:</label>
							<select name="status" class="form-control" style="margin-top: 20px">
							<% 
							if(category.getStatus()==1) 
								{
							%>
								<option value="publish" class="form-control" selected="selected" >Publish</option>
								<option value="unpublish" class="form-control">Unpublish</option>
								<%}
							else
							{
								%>
								<option value="publish" class="form-control">Publish</option>
								<option value="unpublish" class="form-control" selected="selected">Unpublish</option>
								<% 								
							}%>
							</select>															
							<button type="submit" class="btn btn-default">Update</button>
							<%
						}
						 %>
						</form>
						
					</div><!--/login form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	<%@include file="includes/Footer.jsp" %>
  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>