<%-- 
    Document   : AddUser
    Created on : Jun 27, 2021, 1:36:21 AM
    Author     : ADMIN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Admin</title>
    </head>
    <body>
        <form action="ManageAccount" method="POST">
            <table border="0">
                <caption><h1>Add User</h1></caption>
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" value="" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="text" name="password" value="" required/></td>
                    </tr>
                    <tr>
                        <td>isSell</td>
                        <td> <input name="gioitinh1" type="radio" value="1" />Enable

                       
                       <input name="gioitinh1" type="radio" value="0" />Disable
                        </td>
                   <tr>
                        <td>isAdmin</td>
                        <td> <input name="gioitinh" type="radio" value="1" />Enbale

                       
                       <input name="gioitinh" type="radio" value="0" />Disable
                        </td>
                    </tr>
                </tbody>
            </table>
            <p><input type="submit" value="Add" name="submit"/>  
               <input type="reset" value="Reset"/></p>
            <input type="hidden" value="add" name="service"/>
        </form>
    </body>
</html>
