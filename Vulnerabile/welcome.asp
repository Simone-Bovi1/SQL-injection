<%
If Session("username") <> "" Then
    Response.Write("Benvenuto, " & Session("username") & "!")
Else
    Response.Write("Accesso non autorizzato.")
End If
%>


<html>
<head>
    <title>Benvenuto</title>
</head>
<body>
    <h1>Benvenuto, <%= Server.HTMLEncode(username) %>!</h1>
    <p>Hai effettuato correttamente il login.</p>
</body>
</html>
