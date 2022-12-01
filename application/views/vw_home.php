<!--A Design by W3layouts
  Author: W3layout
  Author URL: http://w3layouts.com
  License: Creative Commons Attribution 3.0 Unported
  License URL: http://creativecommons.org/licenses/by/3.0/
  -->
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <title>PEMETAAN K - MEANS CLUSTERING</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="Mulching Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
      Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script>
      addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
      }, false);
      
      function hideURLbar() {
        window.scrollTo(0, 1);
      }
    </script>
    <!--//meta tags ends here-->
    <!--booststrap-->
    <link href="<?php echo base_url() ?>Assets/web/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <!--//booststrap end-->
    <!-- font-awesome icons -->
    <link href="<?php echo base_url() ?>Assets/web/css/font-awesome.min.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!--stylesheets-->
    <link href="<?php echo base_url() ?>Assets/web/css/style.css" rel='stylesheet' type='text/css' media="all">
    <!--//stylesheets-->
   <!-- Web-Fonts -->
  <link href="//fonts.googleapis.com/css?family=Poiret+One&amp;subset=cyrillic,latin-ext" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=Mada:200,300,400,500,600,700,900&amp;subset=arabic" rel="stylesheet">
  <!-- //Web-Fonts -->

  </head>
  <body>
    <div class="main-top" id="home">
      <!-- header -->
      <div class="headder-top">
        <!-- nav -->
        <nav >
          <div id="logo">
            <div class="row">
              <div class="py-md-4">
                <img src="<?php echo base_url();?>Assets/build/images/sragen.png" style="width: 90px;height: 100px;" alt> </img>
                <div class="py-md-4"><h1><a href="#">K-Means</a></h1></div>
              </div>
            </div>
            <!-- <h1><a href="#">K-Means</a></h1> -->
            
          </div>
          <label for="drop" class="toggle">Menu</label>
          <input type="checkbox" id="drop">
          <ul class="menu mt-2">
          <!-- 1 -->  <li class="active"><a href="<?php echo base_url(); ?>Welcome/">Home</a></li>
          <!-- 2 -->  <li class="mx-lg-3 mx-md-2 my-md-0 my-1"><a href="<?php echo base_url(); ?>Welcome/about">About</a></li>
          <!-- 3 -->  <li><a href="<?php echo base_url(); ?>Welcome/tanaman">Data</a></li>
          <!-- 4 -->  <li><a href="<?php echo base_url(); ?>Welcome/lokasi">Hasil Pemetaan</a></li>
          <!-- 5 -->  <li><a href="<?php echo base_url(); ?>Home/Login">Login</a></li>
          </ul>
        </nav>
        <!-- //nav -->
      </div>
      <!-- //header -->
      <!-- banner -->
      <div class="main-banner text-center">
        <div class="container">
          <div class="style-banner">
            <h4 class="mb-2">Welcome to Our Farm</h4>
            <h5>Offering Farming Solutions Worldwide
            </h5>
          </div>
          <div class="two-demo-button mt-md-4 mt-3">
            <p> Untuk mengganti Gambar di bawah tulisan ini silahkan replace file gambar dari "Appfolder/Assets/web/images/b3.jpg" dengan resolusi 1680 x 900</p>
          </div>
          
        </div>
      </div>
    </div>
    <!-- //banner -->
    <!-- about -->
    <section class="about py-lg-4 py-md-3 py-sm-3 py-3" id="about">
      <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <div class="row">
     <div class="col-lg-6 about-imgs-txt">
             <img src="<?php echo base_url() ?>Assets/web/images/1.jpg" alt="news image" class="img-fluid">
          </div>
         <div class="col-lg-6 text-right about-two-grids">
            <h3 class="title  mb-md-4 mb-sm-3 mb-3">About Our Farm </h3>
            <div class="about-para-txt">
              <p>Untuk mengganti Gambar di samping tulisan ini silahkan replace file gambar dari "Appfolder/Assets/web/images/1.jpg" dengan resolusi 640 x 420</p>
            </div>
            <div class="view-buttn mt-lg-5 mt-md-4 mt-3">
              <a href="single.html" class=" scroll">Read More</a>
            </div>
          </div>
      
        </div>
      </div>
    </section>
   
    <!-- footer -->
    <footer class="py-lg-4 py-md-3 py-sm-3 py-3">
      <div class="container py-lg-5 py-md-5 py-sm-4 py-3">
        <div class="footer-w3layouts-head text-center">
          <h2><a href="index.html">AIS System</a></h2>
        </div>
        <div class="social-icons mt-lg-5 mt-md-4 mt-3 text-center">
          <ul>
            <li><a href="mailto:prasetyoajiw@gmail.com"><span class="fa fa-envelope"></span></a></li>
            <li><a href="https://www.instagram.com/aisystem.id/" target="_blank"><span class="fa fa-instagram"></span></a></li>
          </ul>
        </div>
        <div class="bottem-wthree-footer text-center pt-md-4 pt-3">
          <p> 
            © 2021 Mulching. All Rights Reserved | Design by <a href="http://www.W3Layouts.com" target="_blank">W3Layouts</a>
          </p>
        </div>
        <!-- move icon -->
        <div class="text-center">
          <a href="#home" class="move-top text-center mt-3"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>
        </div>
        <!--//move icon -->
      </div>
    </footer>
    <!--//footer -->
  </body>
</html>