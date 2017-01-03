<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Connectez-vous...</title>
</head>
<body>

<H1>LOGIN FORM</H1>
            <form method="get" >
                <table>
                    <tr>
                        <td> Username  : </td><td> <input name="username" size=15 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Password  : </td><td> <input name="password" size=15 type="password" /> </td> 
                    </tr>
                    <tr>
                    <%
                    String connect=request.getParameter("connect");
                    if(connect != null && connect.equals("false")){
                    %>
                    	<td style="color: red">Password incorrect !</td>
                    <%
                    };
                    %>
                    </tr>
                </table>
                <input type="submit" value="login" />
            </form>       
</body>
</html>