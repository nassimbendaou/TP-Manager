<!DOCTYPE html>
<%@page import="model.Student"%>
<%@page import="busniss.LoginService"%>
<%@page import="model.Professor"%>
<%@page import="model.Tp"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="assets/vendor/bootstrap/css/bootstrap.min.css"
    />
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/libs/css/style.css" />
    <link
      rel="stylesheet"
      href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css"
    />
    <title>Gestion des Tp</title>
  </head>

  <body>
  <% Tp tp = (Tp)  request.getAttribute("TP");
  Professor pr = (Professor)  request.getAttribute("prof");
  LoginService i=LoginService.getInstance();
   Student temp = (Student) i.getUser();%>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
      <!-- ============================================================== -->
      <!-- navbar -->
      <!-- ============================================================== -->
      <div class="dashboard-header">
        <nav class="navbar navbar-expand-lg bg-white fixed-top">
          <a class="navbar-brand" href="#">TP Manager</a>
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto navbar-right-top">
              <li class="nav-item dropdown nav-user">
                <a
                  class="nav-link nav-user-img"
                  href="#"
                  id="navbarDropdownMenuLink2"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                  ><img
                    src="https://i.ibb.co/gmCFmPY/Laptop-User.png"
                    alt="Laptop-User"
                    class="user-avatar-md rounded-circle"
                /></a>
                <div
                  class="dropdown-menu dropdown-menu-right nav-user-dropdown"
                  aria-labelledby="navbarDropdownMenuLink2"
                >
                  <div class="nav-user-info">
                    <h3 class="mb-2"> <%=temp.getFirstanme()%> <%=temp.getLastname()%> </h3>
                  </div>
                  <a class="dropdown-item" href="#"
                    ><i class="fas fa-power-off mr-2"></i>Logout</a
                  >
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </div>
      <!-- ============================================================== -->
      <!-- end navbar -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- left sidebar -->
      <!-- ============================================================== -->
      <div class="nav-left-sidebar sidebar-dark">
        <div class="menu-list">
          <nav class="navbar navbar-expand-lg navbar-light">
            <a class="d-xl-none d-lg-none" href="#">MENU</a>
            <button
              class="navbar-toggler"
              type="button"
              data-toggle="collapse"
              data-target="#navbarNav"
              aria-controls="navbarNav"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav flex-column">
                <li class="nav-divider">
                  Menu
                </li>
                <li class="nav-item">
                   <form id="myformA" action="Login" method="post" >
                    <input type="hidden" name="id" value=<%=temp.getCin()%> />
                          <input type="hidden" name="represent" value="student" />
                      <a
                        class="nav-link"
                       
                       onclick="callA()"
                        ><i class="fa fa-fw fa-address-card"></i>Mes TPs </a
                      >
                      </form>
                </li>
                <li class="nav-item">
                <form id="myform" method="get" action="CreateProf">
                                                        <input type="hidden" name="id" value=<%=temp.getFillier()%> />
                                                    
                                               
                      <a
                        class="nav-link"
                       
                       onclick="call()"
                        ><i class="fa fa-fw fa-address-card"></i>Mes Prof </a
                      >
                      </form>
                </li>
              </ul>
            </div>
          </nav>
        </div>
      </div>
      <!-- ============================================================== -->
      <!-- end left sidebar -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- wrapper  -->
      <!-- ============================================================== -->
      <div class="dashboard-wrapper">
        <div class="dashboard-ecommerce">
          <div class="container-fluid dashboard-content">
            <!-- ============================================================== -->
            <!-- pageheader  -->
            <!-- ============================================================== -->
            
            <div class="row">
              <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="page-header">
                  <h2 class="pageheader-title">Détails de TP</h2>

                  <div class="page-breadcrumb">
                    <nav aria-label="breadcrumb">
                      <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                          <a href="#" class="breadcrumb-link">Mes TP </a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                          TP
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                          Détails
                        </li>
                      </ol>
                    </nav>
                  </div>
                </div>
              </div>
            </div>
            <!-- ============================================================== -->
            <!-- end pageheader  -->
            <!-- ============================================================== -->
            <div class="row">
              <div
                class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12"
              >
                <div class="row">
                  <div
                    class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pr-xl-0 pr-lg-0 pr-md-0 m-b-30"
                  >
                    <div class="product-slider">
                      <div
                        id="productslider-1"
                        class="product-carousel carousel slide"
                        data-ride="carousel"
                      >
                        <ul class="carousel-indicators">
                          <li
                            data-target="#carouselExampleIndicators"
                            data-slide-to="0"
                            class="active"
                          ></li>
                        </ul>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img
                              class="d-block"
                              src="https://i.ibb.co/TB1xc3H/book.jpg"
                              alt="First slide"
                            />
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div
                    class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pl-xl-0 pl-lg-0 pl-md-0 border-left m-b-30"
                  >
                    <div
                      class="product-details"
                      style="padding-bottom: 137px; padding-top: 123px;"
                    >
                      <div class="border-bottom pb-3 mb-3">
                        <h2 class="mb-3"><%=tp.getName()%></h2>
                        <div
                          class="product-rating d-inline-block float-right"
                        ></div>
                        <h3 class="mb-0 text-primary"><%=pr.getFirstname()%> <%=pr.getLaststname()%></h3>
                      </div>
                      <div class="product-colors border-bottom"></div>
                      <div class="product-size border-bottom">
                        <h4>Date</h4>
                        <div
                          class="btn-group"
                          role="group"
                          aria-label="First group"
                        >
                          <p><%=tp.getDatebegin()%> </br> <%=tp.getDateEnd()%></p>
                        </div>
                        <div class="product-qty">
                          <h4>Salle</h4>
                          <div class="quantity">
                            <p><%=tp.getSalle()%></p>
                          </div>
                        </div>
                      </div>
                      <div class="product-description">
                        <h4 class="mb-1">Matiére</h4>
                        <p>
                         <%=tp.getMatiere()%>
                        </p>
                      </div>
                      <div class="media media-attachment">
                        <div class="avatar bg-primary">
                          <i class="fas fa-file"></i>
                        </div>
                        <div class="media-body">
                          <a href="#" class="">questionnaire-draft.doc</a>
                          <span>24kb Document</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div
                    class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-60"
                  ></div>
                </div>
              </div>
            </div>
          </div>
          <!-- ============================================================== -->
          <!-- footer -->
          <!-- ============================================================== -->
          <div class="footer">
            <div class="container-fluid">
              <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                  EST Â© 2020 
                
                </div>
               
              </div>
            </div>
          </div>
          <!-- ============================================================== -->
          <!-- end footer -->
          <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
      </div>
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="assets/libs/js/main-js.js"></script>
      <script type="text/javascript">
            function call() {
            	 document.getElementById("myform").submit();
			}
            </script>
             <script type="text/javascript">
            function callA() {
            	 document.getElementById("myformA").submit();
			}
            </script>
    <script>
      jQuery(
        '<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>'
      ).insertAfter(".quantity input");
      jQuery(".quantity").each(function () {
        var spinner = jQuery(this),
          input = spinner.find('input[type="number"]'),
          btnUp = spinner.find(".quantity-up"),
          btnDown = spinner.find(".quantity-down"),
          min = input.attr("min"),
          max = input.attr("max");

        btnUp.click(function () {
          var oldValue = parseFloat(input.val());
          if (oldValue >= max) {
            var newVal = oldValue;
          } else {
            var newVal = oldValue + 1;
          }
          spinner.find("input").val(newVal);
          spinner.find("input").trigger("change");
        });

        btnDown.click(function () {
          var oldValue = parseFloat(input.val());
          if (oldValue <= min) {
            var newVal = oldValue;
          } else {
            var newVal = oldValue - 1;
          }
          spinner.find("input").val(newVal);
          spinner.find("input").trigger("change");
        });
      });
    </script>
  </body>
</html>
