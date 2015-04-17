<%@page import="model.Category"%>
<%@page import="java.util.Iterator"%>
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
				<div class="col-sm-10 col-sm-offset-1">
					<table class="table table-hover">
				   	    <thead>
				            <tr>
				                <th>ID</th>
				                <th>Category Name</th>
				                <th>Description</th>
				                <th>Status</th>
				                <th>Edit</th>
				                <th>Delete</th>
				            </tr>
				        </thead>
				        <tbody>
				        <%
								SessionFactory factory= HibernateUtil.getSessionFactory();
								Session sessionHb=factory.openSession();
								Query query=sessionHb.createQuery("from Category where status=1");
								List<Category> list=query.list();
								Iterator<Category> itr=list.iterator();
								while(itr.hasNext())
								{
									Category category=itr.next();
									%>
										<tr>
					                		<td><%out.print(category.getCategoryId()); %></td>
					                		<td><%out.print(category.getName()); %></td>
					                		<td><%out.print(category.getDescription()); %></td>
					                		<td><%
					                			if(category.getStatus()==1)
					                				out.print("Published");
					                			else
					                				out.print("Unpublished");
					                		%></td>
					                		<td></td>
					                		<td></td>
				            			</tr>		
									<% 
								}
								sessionHb.close();
							%>
				            
				        </tbody>
				    </table>

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