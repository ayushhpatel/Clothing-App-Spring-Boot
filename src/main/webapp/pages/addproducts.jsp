<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <!-- Font awesome -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">   
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="css/jquery.simpleLens.css">    
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="css/theme-color/default-theme.css" rel="stylesheet">
    <!-- Top Slider CSS -->
    <link href="css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="css/style.css" rel="stylesheet">    

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
</head>
<body>
<form class="aa-login-form" action="addpdetails" method="post">
            <label for="">Give Wear Type</label>
            <input type="text" name="type" placeholder="man/women/kid" required>
            <label for="">Name of Product</label>
            <input type="text" name="name" placeholder="Linen Shirt" max-length="10" required>
            <label for="">Category</label>
            <input type="text" name="category" placeholder="Shirts" required max-length="10">
            <label for="">Available Quantity</label>
            <input type="text" name="aqty" placeholder="50" required max-length="10">
            <label for="">Price</label>
            <input type="text" name="price" placeholder="800" required max-length="10">
            <label for="">Image Path of product</label>
            <input type="text" name="imgpath" placeholder="img/man/man-linen-1.jpg" required>
            <label for="">Product description</label>
            <input type="text" name="description" required max-length="15">
            <button class="aa-browse-btn" type="submit">Add Product</button>
          </form>
</body>
</html>