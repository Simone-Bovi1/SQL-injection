<%
Dim username, password, rsUtente, sql
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("database.accdb")

username = Trim(Request.Form("username"))
password = Trim(Request.Form("password"))

If Len(username) > 0 And Len(password) > 0 Then
    sql = "SELECT * FROM utenti WHERE username = ? AND password = ?"

    Set cmd = Server.CreateObject("ADODB.Command")
    With cmd
        .ActiveConnection = conn
        .CommandText = sql
        .CommandType = 1 'adCmdText
        .Parameters.Append .CreateParameter(, 200, 1, 50, username)
        .Parameters.Append .CreateParameter(, 200, 1, 50, password)
        Set rsUtente = .Execute
    End With

    If Not rsUtente.EOF Then
        Session("username") = rs("username") ' Dove rs è il Recordset con i dati dell'utente
        Response.Redirect "welcome.asp"
    Else
        Response.Write "Nome utente o password errati."
    End If

    rsUtente.Close
    Set rsUtente = Nothing
    Set cmd = Nothing

Else
    Response.Write "Inserisci username e password correttamente."
End If

conn.Close
Set conn = Nothing
%>
