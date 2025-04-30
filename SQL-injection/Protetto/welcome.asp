<%
Dim username
username = Session("username")

If username = "" Then
    Response.Redirect("index.asp") ' Torna al login se non c'è username
End If
%>

<html>
<head>
    <title>Benvenuto</title>
    <link rel="stylesheet" type="text/css" href="StileW.css">
</head>
<body>
    <h1>Benvenuto, <%= Server.HTMLEncode(username) %>!</h1>
    <p>Hai effettuato correttamente il login.</p>
</body>
</html>
