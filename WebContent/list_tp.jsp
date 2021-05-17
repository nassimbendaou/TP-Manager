<!doctype html>
<%@page import="model.Professor"%>
<%@page import="model.Student"%>
<html lang="en">
 <%@page import="busniss.LoginService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Tp"%>
<%@page import="java.util.List"%>
<%@page import="busniss.ProfessorService"%>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/libs/css/style.css">
    <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <title>Gestion des Tps</title>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
     <% LoginService i=LoginService.getInstance();
     Professor pr=null;
     ProfessorService prof = ProfessorService.getInstance();
     Student temp = (Student) i.getUser(); %>
        <!-- ============================================================== -->
        <!-- navbar -->
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
                        <h5 class="mb-0 text-white nav-user-name"><%=temp.getFirstanme()%> <%=temp.getLastname()%></h5>
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
                <a class="d-xl-none d-lg-none" href="#">Menu</a>
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
            <div class="influence-finder">
                <div class="container-fluid dashboard-content">
                    <!-- ============================================================== -->
                    <!-- pageheader -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h3 class="mb-2"> Tp De <%=temp.getFirstanme()%> <%=temp.getLastname()%> </h3>
                               
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Menu</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Mes Tps</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- content -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <!-- ============================================================== -->
                        <!-- search bar  -->
                        <!-- ============================================================== -->
                      
                        <!-- ============================================================== -->
                        <!-- end search bar  -->
                        <!-- ============================================================== -->
                        <div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
                            <!-- ============================================================== -->
                            <!-- card influencer one -->
                            
                            <!-- ============================================================== -->
                           <%try{
								List<Tp> mytps = (List<Tp>) request.getAttribute("modele");
								if(mytps.equals(null))
									mytps=new ArrayList<Tp>();
								for (Tp c : mytps) { %>
                            <div class="card">
                               
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="user-avatar float-xl-left pr-4 float-none">
                                                <img src="https://i.ibb.co/TB1xc3H/book.jpg" alt="User Avatar" class="rounded-circle user-avatar-xl">
                                                    </div>
                                                <div class="pl-xl-3">
                                                    <div class="m-b-0">
                                                        <div class="user-avatar-name d-inline-block">
                                                            <h2 class="font-24 m-b-10"><%=c.getName()%></h2>
                                                        </div>
                                                        <div class="rating-star d-inline-block pl-xl-2 mb-2 mb-xl-0">
                                                        
                                                        </div>
                                                    </div>
                                                    <div class="user-avatar-address">
                                                    <%pr=prof.getProf(c.getProf());%>
                                                        <p class="mb-2"><i class="fa fa-fw fa-address-card"></i><%=pr.getFirstname()%> <%=pr.getLaststname()%></span>
                                                        </p>
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="float-xl-right float-none mt-xl-0 mt-4">
                                                    <form method="get" action="TpInfo">
                                                        <input type="hidden" name="id" value=<%=c.getId()%> />
                                                    <button  class="btn btn-primary">Détails</button>
                                                </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                                </div>
                              
                              <%
								}}catch(Exception e){
									e.printStackTrace();
								}
							%>  <!-- ============================================================== -->
                                <!-- end card influencer one -->
                                <!-- ============================================================== -->


                            <!-- ============================================================== -->
                            <!-- card influencer one -->
                            <!-- ============================================================== -->
                         
                                <!-- ============================================================== -->
                                <!-- end card influencer one -->
                                <!-- ============================================================== -->
                                

                                <!-- ============================================================== -->
                                <!-- end content -->
                                <!-- ============================================================== -->
                            </div>
                            <!-- ============================================================== -->
                            <!-- influencer sidebar  -->
                            <!-- ============================================================== -->
                            
                            <!-- ============================================================== -->
                            <!-- end influencer sidebar  -->
                            <!-- ============================================================== -->
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- footer -->
                    <!-- ============================================================== -->
                    <div class="footer" style="position: fixed; bottom: 0;">
                        <div class="container-fluid">
                          <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                              ESTF © 2020
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
            <script type="text/javascript">
            function callA() {
            	 document.getElementById("myformA").submit();
			}
            </script>
            <script type="text/javascript">
            function call() {
            	 document.getElementById("myform").submit();
			}
            </script>
            <script src="assets/libs/js/main-js.js"></script>
</body>
 
</html>