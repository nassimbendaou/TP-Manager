<!DOCTYPE html>
<%@page import="busniss.LoginService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Tp"%>
<%@page import="java.util.List"%>
<%@page import="model.Professor"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Gestion des Tp</title>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="./assets/vendor/bootstrap/css/bootstrap.min.css"
    />
    <link
      href="./assets/vendor/fonts/circular-std/style.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./assets/libs/css/style.css" />
    <link
      rel="stylesheet"
      href="./assets/vendor/fonts/fontawesome/css/fontawesome-all.css"
    />
    <link
      rel="stylesheet"
      href="./assets/vendor/datepicker/tempusdominus-bootstrap-4.css"
    />
    <link
      rel="stylesheet"
      href="./assets/vendor/inputmask/css/inputmask.css"
    />
  </head>

  <body>
 <% LoginService i=LoginService.getInstance();
    Professor temp = (Professor) i.getUser(); %>
    <div class="dashboard-main-wrapper">
    
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
               <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
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
            <% Tp tp = (Tp)request.getAttribute("tp"); %>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav flex-column">
                <li class="nav-divider">
                  Menu
                </li>
                <li class="nav-item">
                  <form id="myformA" action="Login" method="post" >
                     <input type="hidden" name="id" value=<%=temp.getCin()%> />
                          <input type="hidden" name="represent" value="prof" />
                      <a
                        class="nav-link"
                       
                       onclick="callA()"
                        ><i class="fa fa-fw fa-address-card"></i>Mes TPs </a
                      >
                      </form>
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link"
                    href="./ajout_tp.jsp"
                   
                    ><i class="fa fa-fw fa-rocket"></i>Ajouter un Tp</a
                  >
                </li>
                
              </ul>
            </div>
          </nav>
        </div>
      </div>

      <div class="dashboard-wrapper">
        <div class="container-fluid dashboard-content">
          <div class="row">
            <div class="col-xl-10">
         
              <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                  <div class="page-header" id="top">
                    <h2 class="pageheader-title">Modifier votre TP</h2>
                    
                    <div class="page-breadcrumb">
                      <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                          <li class="breadcrumb-item">
                            <a href="./index.jsp" class="breadcrumb-link">Menu</a>
                          </li>
                          <li class="breadcrumb-item">
                            <a href="#" class="breadcrumb-link">Modifier votre TP</a>
                          </li>
                         
                        </ol>
                      </nav>
                    </div>
                  </div>
                </div>
              </div>
           
              <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                  <div class="section-block" id="basicform">
                  
                  </div>
                  <div class="card">
                    <h5 class="card-header">modifier Votre TP</h5>
                    <div class="card-body">
                    
                      <form action="Operations" method="post" >
                        <div class="form-group">
                          <label for="inputText3" class="col-form-label"
                            >Nom du TP</label
                          >
                          <input
                            id="inputText3"
                            type="text"
                            class="form-control"
                            name="name"
                            value=<%=tp.getName()%>
                          />
                        </div>
                        <div class="form-group">
                            <label for="inputText3" class="col-form-label"
                              >Fillier</label
                            >
                            <input
                              id="inputText3"
                              type="text"
                              class="form-control"
                              name="fillier"
                               value=<%=tp.getFillier()%>
                            />
                          </div>
                          
                          
                        <div class="form-group">
                            <label for="inputText3" class="col-form-label"
                              >Salle</label
                            >
                            <input
                              id="inputText3"
                              type="text"
                              class="form-control"
                              name="salle"
                                  value=<%=tp.getSalle()%>
                            />
                          </div>
                          
                           
                            <input
                              id="inputText3"
                              
                             type="hidden" name="id" value=<%=temp.getCin()%>
                              class="form-control"
                            />
                              <input
                              id="inputText3"
                              
                             type="hidden" name="tpid" value=<%=request.getAttribute("id")%>
                              class="form-control"
                            />
                          <div class="form-group">
                            <label for="inputText3" class="col-form-label"
                              >Matier</label
                            >
                            <input
                              id="inputText3"
                              type="text"
                              class="form-control"
                              name="matier"
                                 value=<%=tp.getMatiere()%>
                            />
                          </div>
                        <div class="form-group">
                            <label for="inputText3" class="col-form-label"
                            >Date de Début</label
                          >
                          <div
                            class="input-group date"
                            id="datetimepicker1"
                            data-target-input="nearest"
                          >
                            <input
                              type="text"
                              class="form-control datetimepicker-input"
                              data-target="#datetimepicker1"
                              name="datebegin"
                                 value=<%=tp.getDatebegin()%>
                            />
                            <div
                              class="input-group-append"
                              data-target="#datetimepicker1"
                              data-toggle="datetimepicker"
                            >
                              <div class="input-group-text">
                                <i class="far fa-calendar-alt"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                            <label for="inputText3" class="col-form-label"
                            >Date fin</label
                          >
                          <div
                            class="input-group date"
                            id="datetimepicker2"
                            data-target-input="nearest"
                          >
                            <input
                              type="text"
                              class="form-control datetimepicker-input"
                              data-target="#datetimepicker2"
                              name="dateEnd"
                                 value=<%=tp.getDateEnd()%>
                            />
                            <div
                              class="input-group-append"
                              data-target="#datetimepicker2"
                              data-toggle="datetimepicker"
                            >
                              <div class="input-group-text">
                                <i class="far fa-calendar-alt"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                        

                        <div class="form-group">
                            <label for="inputText3" class="col-form-label"
                            >Data</label >
                                <div class="custom-file">
                                  <input type="file" class="custom-file-input" id="customFile" name="filepath">
                                  <label class="custom-file-label" for="customFile">Choose file</label>
                                 
                                </div>
                          
                        </div>
                   
                        <button  class="btn btn-primary" type="submit" onclick="" >Submit</button>
                   

                      
                      </form>
                    </div>
                    
                  </div>
                </div>
              </div>
             
            </div>
         
          </div>
        </div>
       
        <div class="footer">
          <div class="container-fluid">
            <div class="row">
              <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                ESTF © 2020 
               
              </div>
              <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
               
              </div>
            </div>
          </div>
        </div>
     
      </div>
    </div>

    <script src="./assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="./assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="./assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="./assets/libs/js/main-js.js"></script>
    <script src="./assets/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>
    <script src="./assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="./assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="./assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="./assets/libs/js/main-js.js"></script>
    <script src="./assets/vendor/datepicker/moment.js"></script>
    <script src="./assets/vendor/datepicker/tempusdominus-bootstrap-4.js"></script>
    <script src="./assets/vendor/datepicker/datepicker.js"></script>
    <script src="./assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="./assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="./assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script type="text/javascript">
            function callA() {
            	 document.getElementById("myformA").submit();
			}
            </script>
    <script src="./assets/vendor/dropzone/dropzone.js"></script>
    <script src="./assets/libs/js/main-js.js"></script>
    <script>
     
        $(".custom-file-input").on("change", function() {
            
          var fileName = "C:/Users/nassi/OneDrive/Desktop/"+$(this).val().split("\\").pop();
          $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });
        </script>
    <script>
      $(function (e) {
        "use strict";
        $(".date-inputmask").inputmask("dd/mm/yyyy"),
          $(".phone-inputmask").inputmask("(999) 999-9999"),
          $(".international-inputmask").inputmask("+9(999)999-9999"),
          $(".xphone-inputmask").inputmask("(999) 999-9999 / x999999"),
          $(".purchase-inputmask").inputmask("aaaa 9999-****"),
          $(".cc-inputmask").inputmask("9999 9999 9999 9999"),
          $(".ssn-inputmask").inputmask("999-99-9999"),
          $(".isbn-inputmask").inputmask("999-99-999-9999-9"),
          $(".currency-inputmask").inputmask("$9999"),
          $(".percentage-inputmask").inputmask("99%"),
          $(".decimal-inputmask").inputmask({
            alias: "decimal",
            radixPoint: ".",
          }),
          $(".email-inputmask").inputmask({
            mask:
              "*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[*{2,6}][*{1,2}].*{1,}[.*{2,6}][.*{1,2}]",
            greedy: !1,
            onBeforePaste: function (n, a) {
              return (e = e.toLowerCase()).replace("mailto:", "");
            },
            definitions: {
              "*": {
                validator: "[0-9A-Za-z!#$%&'*+/=?^_`{|}~/-]",
                cardinality: 1,
                casing: "lower",
              },
            },
          });
      });
    </script>
  </body>
</html>
