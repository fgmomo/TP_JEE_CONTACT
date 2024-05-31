/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.contacts.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myclass.Contact;

/**
 *
 * @author mohamed.kone1
 */
@WebServlet(name = "ContactServlet", urlPatterns = {"/ContactServlet"})
public class ContactServlet extends HttpServlet {
        private List<Contact> contacts= new ArrayList<>();
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String action = request.getParameter("action");
         if("delete".equals(action)){
             String nom = request.getParameter("nom");
             deletecontact(nom);
         }
         request.setAttribute("contacts", contacts);
         request.getRequestDispatcher("contacts.jsp").forward(request, response);
     
    }

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
        
        String prenom = request.getParameter("prenom");
        String nom = request.getParameter("nom");
        String adresse = request.getParameter("adresse");
        String email = request.getParameter("email");
        String competence = request.getParameter("competence");
        
       Contact nouveaucontact = new Contact();
       nouveaucontact.setNom(nom);
       nouveaucontact.setPrenom(prenom);
       nouveaucontact.setEmail(email);
       nouveaucontact.setCompetence(competence);
       nouveaucontact.setAdresse(adresse);
       contacts.add(nouveaucontact);
        
       request.setAttribute("msg","Ajouté avec success");
        request.setAttribute("contacts", contacts);
        request.getRequestDispatcher("contacts.jsp").forward(request, response);
       
    }

    private void deletecontact(String nom){
        for(int i=0; i< contacts.size(); i++){
            if(contacts.get(i).getNom().equals(nom)){
                contacts.remove(i);
                break;
            }
        }
    }
 

}
