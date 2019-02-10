<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Glassfish Test App</title>
    </head>
    <body>
        <h1>Ciao Sono su Glassfish!</h1>
        <h3> Server Side IP Address </h3><br>
        <%@page import="java.net.InetAddress;" %>
        <%String ip = "";
            InetAddress inetAddress = InetAddress.getLocalHost();
            ip = inetAddress.getHostAddress();
            out.println("Server Host Name : " + inetAddress.getHostName());%><br>
        <%out.println("Server IP Address : " + ip);%>

        <h3> Client Side IP Address </h3><br>
        <%out.print("Client IP Address : " + request.getRemoteAddr()); %><br>
    </body>
</html>
