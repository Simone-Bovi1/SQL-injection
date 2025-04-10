<%
On Error Resume Next

Dim username, password
username = Request.Form("username")
password = Request.Form("password")
If username <> "" And password <> "" Then

    ' Connessione al database Access
    Dim conn, cmd, connectionString
    Set conn = Server.CreateObject("ADODB.Connection")
    Set cmd = Server.CreateObject("ADODB.Command")

    connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("Database.accdb") & ";Persist Security Info=False;"

    conn.Open connectionString
    cmd.ActiveConnection = conn
    cmd.CommandText = "INSERT INTO Utenti (Username, [Password]) VALUES (?, ?)"
    cmd.CommandType = 1 
    cmd.Parameters.Append cmd.CreateParameter("Username", 200, 1, 255, username)
    cmd.Parameters.Append cmd.CreateParameter("Password", 200, 1, 255, password)
    cmd.Execute
	
    conn.Close
    Set cmd = Nothing
    Set conn = Nothing

Else
    Response.Write "<p>Per favore compila tutti i campi.</p>"
End If

If Err.Number <> 0 Then
    Response.Write "<p>Errore durante la registrazione: " & Err.Description & "</p>"
Else 
	Response.Write "<p>Registrazione avvenuta con successo. <a href='Login.html'>Accedi</a></p>"
End If
%>
