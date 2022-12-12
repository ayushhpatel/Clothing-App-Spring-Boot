<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Daily Shop | Home</title>
  
  <!-- Font awesome -->
  <link href="css/style.css" rel="stylesheet">
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
  <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet">
  <!-- Top Slider CSS -->
  <link href="css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

  <!-- Main style sheet -->
  <link href="css/style.css" rel="stylesheet">

  <!-- Google Font -->
  <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>

</head>

<body>

<div class="alert alert-info" role="alert">
  ${msg}
</div>
  <!-- wpf loader Two -->
  <div id="wpf-loader-two">
    <div class="wpf-loader-two-inner">
      <span>Loading</span>
    </div>
  </div>
  <!-- / wpf loader Two -->
  <!-- SCROLL TOP BUTTON -->
  <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->


  <!-- Start header section -->
  <header id="aa-header">
    <!-- start header top  -->
    <div class="aa-header-top">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-top-area">
              <!-- start header top left -->
              <div class="aa-header-top-left">
                <!-- start language -->
                
                <!-- / language -->

                <!-- start currency -->
                
                <!-- / currency -->             
              <!-- / header top left -->
              <div class="aa-header-top-right">
                <ul class="aa-head-top-nav-right">                                   
                  <c:choose>
                    <c:when test="${name !=null}">                    
                      <li class="hidden-xs"><a href="getcart?name=${name}">My Cart</a></li>
                      <li class="hidden-xs"><a href="updateacc?name=${name}">Update Account</a></li>                     
                      <li class="hidden-xs"><a href="deleteacc?name=${name}">Delete Account</a></li>
                      <li class="hidden-xs"><a href="logout">Logout</a></li>
                    </c:when>
                    <c:otherwise>
                      <li><a href="account">Register</a></li>
                      <li><a href="" data-toggle="modal" data-target="#login-modal">Login</a></li>
                    </c:otherwise>
                  </c:choose>                       
                </ul>              
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    <!-- / header top  -->
  </header>
  <!-- / header section -->
  <!-- menu -->
  <section id="menu">
    <div class="container">
      <div class="menu-area">
        <!-- Navbar -->
        <div class="navbar navbar-default" role="navigation">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div class="navbar-collapse collapse">
            <!-- Left nav -->
            <ul class="nav navbar-nav">
              <li><a href="home">Home</a></li>
              <li><a href="#">Men <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="scm?c=Casual">Casual</a></li>
                  <li><a href="scm?c=Sports">Sports</a></li>
                  <li><a href="scm?c=Formal">Formal</a></li>
                  <li><a href="scm?c=Standard">Standard</a></li>
                  <li><a href="scm?c=T-Shirts">T-Shirts</a></li>
                  <li><a href="scm?c=Shirts">Shirts</a></li>
                  <li><a href="scm?c=Jeans">Jeans</a></li>
                </ul>
              </li>
              <li><a href="#">Women <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="scw?c=Kurti">Kurtis</a></li>
                  <li><a href="scw?c=Trousers">Trousers</a></li>
                  <li><a href="scw?c=Casual">Casual</a></li>
                  <li><a href="scw?c=Sports">Sports</a></li>
                  <li><a href="scw?c=Formal">Formal</a></li>
                  <li><a href="scw?c=Sarees">Sarees</a></li>                  
                  </ul>
              <li><a href="#">Kids <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="sck?c=Casual">Casual</a></li>
                  <li><a href="sck?c=Sports">Sports</a></li>                 
                  <li><a href="sck?c=Standard">Standard</a></li>
                  <li><a href="sck?c=T-Shirts">T-Shirts</a></li>
                  <li><a href="sck?c=Shirts">Shirts</a></li>
                  <li><a href="sck?c=Jeans">Jeans</a></li>
                </ul>
              </li>
            </ul>
          </div>
          <!--/.nav-collapse -->
        </div>
      </div>
    </div>
  </section>
  <!-- / menu -->
  <!-- Start slider -->
  <section id="aa-slider">
    <div class="aa-slider-area">
      <div id="sequence" class="seq">
        <div class="seq-screen">
          <ul class="seq-canvas">
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="img/slider-1.jpg" alt="Men slide img" />
              </div>
              <div class="seq-title">              
                <h2 data-seq>Men's Collection</h2>              
           
              </div>
            </li>
            <!-- single slide item -->        
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="img/slider-2.jpg" alt="Women Jeans slide img" />
              </div>
              <div class="seq-title">               
                <h2 data-seq>Jeans Collection</h2>
                
              </div>
            </li>
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="img/slider-3.jpg" alt="Shoes slide img" />
              </div>
              <div class="seq-title">               
                <h2 data-seq>Exclusive Shoes</h2>
               
              </div>
            </li>
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="img/slider-4.jpg" alt="Male Female slide img" />
              </div>
              <div class="seq-title">
                <h2 data-seq>Best Collection</h2>                        
              </div>
            </li>
          </ul>
        </div>
        <!-- slider navigation btn -->
        <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
          <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
          <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
        </fieldset>
      </div>
    </div>
  </section>
  <!-- / slider -->
  <!-- Start Promo section -->
  <section id="aa-promo">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-promo-area">
            <div class="row">
              <!-- promo left -->
              <div class="col-md-5 no-padding">
                <div class="aa-promo-left">
                  <div class="aa-promo-banner">
                    <img src="img/slider-2.jpg" alt="img">
                    <div class="aa-prom-content">
                      <h4><a href="#">For Women</a></h4>
                    </div>
                  </div>
                </div>
              </div>
              <!-- promo right -->
              <div class="col-md-7 no-padding">
                <div class="aa-promo-right">
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">
                      <img src="img/forman.jpg" alt="img">
                      <div class="aa-prom-content">
                        <h4><a href="#">For Men</a></h4>
                      </div>
                    </div>
                  </div>
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">
                      <img src="img/slider-3.jpg" alt="img">
                      <div class="aa-prom-content">
                        <h4><a href="#">On Shoes</a></h4>
                      </div>
                    </div>
                  </div>
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">
                      <img src="img/forkids.jpg" alt="img">
                      <div class="aa-prom-content">
                        <h4><a href="#">For Kids</a></h4>
                      </div>
                    </div>
                  </div>
                  <div class="aa-single-promo-right">
                    <div class="aa-promo-banner">
                      <img src="img/women/sarees-1.jpg" alt="img">
                      <div class="aa-prom-content">
                        <h4><a href="#">On Sarees</a></h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Promo section -->
  <!-- Products section -->
  
  
<c:choose>
  <c:when test="${name !=null}">
   <section id="aa-product">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="aa-product-area">
              <div class="aa-product-inner">
                <!-- start prduct navigation -->
                <ul class="nav nav-tabs aa-products-tab">
                  <li class="active"><a href="#men" data-toggle="tab">Men</a></li>
                  <li><a href="#women" data-toggle="tab">Women</a></li>
                  <li><a href="#kid" data-toggle="tab">Kid</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                  <!-- Start men product category -->
                  <div class="tab-pane fade in active" id="men">
                    <ul class="aa-product-catg">  
                    
                    <c:forEach items="${allpmans}" var="man">
                      <!-- start single product item -->
                      <li>
                        <figure>
                          <a class="aa-product-img" href="#"><img src="${man.imgpath}" alt="polo shirt img"></a>
                          <a class="aa-add-card-btn" href="addm?cname=${name}&pid=${man.id}"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                          <figcaption>
                            <h4 class="aa-product-title"><a href="#">${man.name}</a></h4>
                            <span class="aa-product-price"><span>&#8377;</span>${man.amt}</span>
                          </figcaption>
                        </figure>
                        <div class="aa-product-hvr-content">                         
                          <a href="product-detailm?id=${man.id}" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
                            ><span class="fa fa-search"></span></a>
                        </div>                       
                      </li>                                 
                    
                    </c:forEach>                   
                    </ul>        
                  </div>
                  <!-- / men product category -->
                  
                  <!-- start women product category -->
                  <div class="tab-pane fade" id="women">
                    <ul class="aa-product-catg"> 
                    
                    <c:forEach items="${allpwomens}" var="women">
                      <!-- start single product item -->
                      <li>
                        <figure>
                          <a class="aa-product-img" href="#"><img src="${women.imgpath}" alt="polo shirt img"></a>
                          <a class="aa-add-card-btn" href="addw?cname=${name}&pid=${women.id}"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                          <figcaption>
                            <h4 class="aa-product-title"><a href="#">${women.name}</a></h4>
                            <span class="aa-product-price"><span>&#8377;</span>${women.amt}</span>
                          </figcaption>
                        </figure>
                        <div class="aa-product-hvr-content">
                          <a href="product-detailw?id=${women.id}" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
                            ><span class="fa fa-search"></span></a>
                        </div>                        
                      </li>                   
                      </c:forEach>                     
                    </ul>                    
                  </div>
                  <!-- / women product category -->
                  
                  <div class="tab-pane fade" id="kid">
                    <ul class="aa-product-catg"> 
                    
                    <c:forEach items="${allpkids}" var="kid">
                      <!-- start single product item -->
                      <li>
                        <figure>
                          <a class="aa-product-img" href="#"><img src="${kid.imgpath}" alt="polo shirt img"></a>
                          <a class="aa-add-card-btn" href="addk?cname=${name}&pid=${kid.id}"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                          <figcaption>
                            <h4 class="aa-product-title"><a href="#">${kid.name}</a></h4>
                            <span class="aa-product-price"><span>&#8377;</span>${kid.amt}</span>
                          </figcaption>
                        </figure>
                        <div class="aa-product-hvr-content">
                          <a href="product-detailk?id=${kid.id}" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal"
                            ><span class="fa fa-search"></span></a>
                        </div>                       
                      </li>                  
                      </c:forEach>                     
                    </ul>                   
                  </div>      
              </div>      
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>      
      </c:when>
      <c:otherwise>
      <h3 style="text-align:center;">Login to avail functionality</h3>
      </c:otherwise>
  </c:choose>            
  
  <!-- / Products section -->
 
  <!-- Support section -->
  <section id="aa-support">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-support-area">
            <!-- single support -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="aa-support-single">
                <span class="fa fa-truck"></span>
                <h4>FREE SHIPPING</h4>
                <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
              </div>
            </div>
            <!-- single support -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="aa-support-single">
                <span class="fa fa-clock-o"></span>
                <h4>30 DAYS MONEY BACK</h4>
                <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
              </div>
            </div>
            <!-- single support -->
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="aa-support-single">
                <span class="fa fa-phone"></span>
                <h4>SUPPORT 24/7</h4>
                <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Support section -->

  <!-- footer -->
  <footer id="aa-footer"> 
    <div class="aa-footer-bottom">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-footer-bottom-area">
              <p>Designed by <a href="http://www.markups.io/">MarkUps.io</a></p>
              <div class="aa-footer-payment">
                <span class="fa fa-cc-mastercard"></span>
                <span class="fa fa-cc-visa"></span>
                <span class="fa fa-paypal"></span>
                <span class="fa fa-cc-discover"></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!-- / footer -->

  <!-- Login Modal -->
  <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4>Login or Register</h4>
          <form class="aa-login-form" action="login" method="post">
            <label for="">Username<span>*</span></label>
            <input type="text" name="uname" placeholder="Ayush Ashish Patel" required>
            <label for="">Password<span>*</span></label>
            <input type="password" name="pwd" required>
            <button class="aa-browse-btn" type="submit">Login</button>
          </form>
          <div class="aa-register-now">
              Don't have an account?<a href="account">Register</a>
            </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>

 <!--  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!--   Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.js"></script>
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="js/jquery.smartmenus.js"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>
  <!-- To Slider JS -->
  <script src="js/sequence.js"></script>
  <script src="js/sequence-theme.modern-slide-in.js"></script>
  <!-- Product view slider -->
  <script type="text/javascript" src="js/jquery.simpleGallery.js"></script>
  <script type="text/javascript" src="js/jquery.simpleLens.js"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="js/slick.js"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="js/nouislider.js"></script>
  <!-- Custom js -->
  <script src="js/custom.js"></script> 

</body>

</html>