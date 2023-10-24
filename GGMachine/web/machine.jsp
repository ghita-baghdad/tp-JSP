<%-- 
    Document   : machine
    Created on : 24 oct. 2023, 18:50:52
    Author     : Lenovo
--%>

<%@page import="entities.Machine"%>
<%@page import="services.MachineService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <form action="MachineController" method="GET">
            <fieldset>
                <legend> Informations machine</legend>
                <table border="0">

                    <tr>
                        <td>Reference :</td>
                        <td><input type="text" name="ref" value="" /></td>
                    </tr>
                    <tr>
                        <td>Marque :</td>
                        <td><input type="text" name="marque" value="" /></td>
                    </tr>
                    <tr>
                        <td>Prix : </td>
                        <td><input type="text" name="prix" value="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Ajouter" /><input type="reset" value="Annuler" /></td>
                    </tr>

                </table>


            </fieldset>
        </form>

        <fieldset>
            <legend> Liste de toutes les Machines </legend>
            <table border="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Reference</th>
                        <th>Marque</th>
                        <th>Prix</th>
                        <th>Supprimer</th>
                        <th>Modifier</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        MachineService ms = new MachineService();
                        for (Machine m : ms.findAll()) {

                    %>
                    <tr>
                        <td><%= m.getId()%></td>
                        <td><%= m.getRef()%></td>
                        <td><%= m.getMarque()%></td>
                        <td><%= m.getPrix()%></td>
                        <td><a href="MachineController?op=delete&id=<%= m.getId()%>">Supprimer</a></td>
                        <td>
                            <form action="MachineController" method="POST">
                                <input type="hidden" name="op" value="update">
                                <input type="hidden" name="id" value="<%= m.getId()%>">
                                <input type="text" name="ref" value="<%= m.getRef()%>">
                                <input type="text" name="marque" value="<%= m.getMarque()%>">
                                <input type="text" name="prix" value="<%= m.getPrix()%>">
                                <button type="submit">Modifier</button>
                              
                            </form>
                        </td>


                    </tr>
                    <% }%>
                </tbody>
            </table>


        </fieldset> 

    </body>
</html>
