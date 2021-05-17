<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Tp"%>
<%@page import="java.util.List"%>
<%@page import="model.Professor"%>
<%@page import="busniss.LoginService"%>
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
    <link
      rel="stylesheet"
      href="assets/vendor/charts/chartist-bundle/chartist.css"
    />
    <link
      rel="stylesheet"
      href="assets/vendor/charts/morris-bundle/morris.css"
    />
    <link
      rel="stylesheet"
      href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css"
    />
    <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css" />
    <link
      rel="stylesheet"
      href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css"
    />
    <title>Gestion Des TPs</title>
  </head>

  <body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <% LoginService i=LoginService.getInstance();
    Professor temp = (Professor) i.getUser(); %>
    <div class="dashboard-main-wrapper">
      <!-- ============================================================== -->
      <!-- navbar -->
      <!-- ============================================================== -->
      <div class="dashboard-header">
        <nav class="navbar navbar-expand-lg bg-white fixed-top">
          <a class="navbar-brand" href="index.html">TP Manager</a>
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
                    <h5 class="mb-0 text-white nav-user-name"><%=temp.getFirstname()%> <%=temp.getLaststname()%></h5>
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
            <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
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
                  <a
                    class="nav-link active"
                 
                   
                    ><i class="fa fa-fw fa-user-circle"></i>Mes TPs
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link"
                    href="ajout_tp.jsp"
                    
                    ><i class="fa fa-fw fa-rocket"></i>Ajouter un Tp</a
                  >
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
                  <h2 class="pageheader-title">
                    Mes TPs
                  </h2>

                  <div class="page-breadcrumb">
                    <nav aria-label="breadcrumb">
                      <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                          <a href="#" class="breadcrumb-link">Menu</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                          Mes Tps
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
            <div class="ecommerce-widget">
              <div class="row">
                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="text-muted">Total des Tp</h5>
                      <div class="metric-value d-inline-block">
                        <h1 class="mb-1"><%=request.getAttribute("num") %> Tp</h1>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="text-muted">Mon Departement</h5>
                      <div class="metric-value d-inline-block">
                        <h1 class="mb-1"><%=temp.getDepartement()%></h1>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <!-- ============================================================== -->

                <!-- ============================================================== -->

                <!-- recent orders  -->
                <!-- ============================================================== -->
                
                <div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <form>
                                        <input class="form-control form-control-lg" type="search" placeholder="chercher votre TP" aria-label="Search">
                                        <button class="btn btn-primary search-btn" type="submit">Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                  <div class="card">
                    <h5 class="card-header">Mes Tp</h5>
                    <div class="card-body p-0">
                      <div class="table-responsive">
                        <table class="table">
                          <thead class="bg-light">
                            <tr class="border-0">
                              
                              <th class="border-0"> </th>
                              <th class="border-0">Nom</th>
                              <th class="border-0">Salle</th>
                              <th class="border-0">Filler</th>
                              <th class="border-0">Matiére</th>
                              <th class="border-0">date de début</th>
                              <th class="border-0">date fin</th>
                            </tr>
                          </thead>
                          <tbody>
                          	<%
							try{
								List<Tp> mytps = (List<Tp>) request.getAttribute("modele");
								if(mytps.equals(null))
									mytps=new ArrayList<Tp>();
								for (Tp c : mytps) {
							%>
                          
                            <tr>
                              
                              <td>
                                <div class="m-r-10">
                                  <img
                                    src="https://i.ibb.co/TB1xc3H/book.jpg"
                                    alt="user"
                                    class="rounded"
                                    width="45"
                                  />
                                </div>
                              </td>
                              <td><%=c.getName()%></td>
                              <td><%=c.getSalle() %></td>
                              <td><%=c.getFillier() %></td>
                              <td><%=c.getMatiere()%></td>
                              <td><%=c.getDatebegin()%></td>
                              <td><%=c.getDateEnd()%></td>
                              <td>
                                <div class="m-r-10">
                                 <form id="edit" action="Operations" method="get">
                         
                                 <input type="hidden" name="id" value=<%=c.getId()%> />
                                     <input type="hidden" name="prof" value=<%=temp.getCin()%> />
                                   
                                      <input type="hidden" name="represent" value="edit"/>
                                  <img
                                    src= "https://i.ibb.co/Z6Ktb5H/edit-24.png"
                                    alt="user"
                                    class="rounded"
                                    width="25"
                                    onclick="calledit()"
                                  />
                                  </form>
                                </div>
                               
                             modifier  </td>
                             
                              <td>
                                <div class="m-r-10">
                                <form id="delete" action="Operations" method="get">
                         
                                 <input type="hidden" name="id" value=<%=c.getId()%> />
                                     <input type="hidden" name="prof" value=<%=temp.getCin()%> />
                                   
                                      <input type="hidden" name="represent" value="delete"/>
                                  <img
                                    src= "https://i.ibb.co/bsGjX5P/delete-24.png"
                                    alt="user"
                                    class="rounded"
                                    width="25"
                                     onclick="calldelete()"
                                  />
                                  </form> 
                                </div>
                               
                              supprimer </td>
                             
                            </tr><%
								}}catch(Exception e){
									e.printStackTrace();
								}
							%>
                           
                           
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- ============================================================== -->
                <!-- end recent orders  -->

                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- customer acquistion  -->
                <!-- ============================================================== -->
           
                <!-- ============================================================== -->
                <!-- end customer acquistion  -->
                <!-- ============================================================== -->
              </div>
            </div>
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
    <script src="assets/libs/js/main-js.js"></script>
    <!-- chart chartist js -->
    <script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <!-- sparkline js -->
    <script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <!-- morris js -->
    <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
    <!-- chart c3 js -->
    <script src="assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script type="text/javascript">
            function calldelete() {
            	 document.getElementById("delete").submit();
			}
            </script>
            <script type="text/javascript">
            function calledit() {
            	 document.getElementById("edit").submit();
			}
            </script>
    <script src="assets/libs/js/dashboard-ecommerce.js"></script>
  </body>
</html>
