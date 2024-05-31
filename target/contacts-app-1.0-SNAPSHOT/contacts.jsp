<%-- 
    Document   : contacts
    Created on : 27 mai 2024, 15:55:34
    Author     : mohamed.kone1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <title>JSP Page</title>
    </head>
<body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Gestionnaire de Contact</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
       
      </div>
    </nav>
        <br>
     <div class="container-fluid">
        <div class="row">
         
  
            <!-- Formulaire d'ajout -->
            <div class="col-md-3">
                <%if(request.getAttribute("msg")!=null){ %>
                <h6 style="width:250px" class="alert alert-success"><%=request.getAttribute("msg")%> </h6>
                  <%}%>
                  
                <h4>Add New</h4>
                <form action="ContactServlet" method="post">
                    <div class="mb-3">
                   
                        <input  <input placeholder="Prenom" style="width: 250px" type="text" class="form-control form-control-sm" name="prenom">
                    </div>
                    <div class="mb-3">
                        
                        <input placeholder="Nom" style="width: 250px" type="text" class="form-control form-control-sm" name="nom">
                    </div>
                    <div class="mb-3">
                       
                        <input placeholder="Adresse" style="width: 250px" type="text" class="form-control form-control-sm" name="adresse">
                    </div>
                    <div class="mb-3">
                       
                        <input placeholder="Email" style="width: 250px" type="email" class="form-control form-control-sm" name="email">
                    </div>
                    <div class="mb-3">
                      
                        <textarea placeholder="Competence" style="width: 250px"class="form-control form-control-sm" name="competence" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm">Ajouter</button>
                </form>
            </div>
            <!-- Liste des apprenants -->
            <div class="col-md-8">
                <h4>Listes des apprenants </h4>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered custom-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Prenom</th>
                                <th>Nom</th>
                                <th>Adresse</th>
                                <th>Email</th>
                                <th>Competences</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="contact" items="${contacts}">
                                <tr>
                                     <td>1</td>
                                    <td>${contact.prenom}</td>
                                    <td>${contact.nom}</td>
                                    <td>${contact.adresse}</td>
                                    <td>${contact.email}</td>
                                    <td>${contact.competence}</td>
                                    <td>
                                        <form action="ContactServlet" method="get">
                                            <input type="hidden" name="action" value="delete"> 
                    
                                            <input type="hidden" name="nom" value="${contact.nom}">
                                            <input type="submit" value="Supprimer" class="btn btn-danger"> 
                                        </form>

                                    </td>
                                </tr>
                            </c:forEach>
                           
                        </tbody>
                         
                    </table>
                </div>
            </div>

            
        </div>
    </div>
    </body>
    
</html>
