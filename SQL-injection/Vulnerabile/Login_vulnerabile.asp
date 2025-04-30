<%
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("Database.accdb")
Dim username, password, rsUtente, sql

username = Request.Form("username")
password = Request.Form("password")

If username <> "" And password <> "" Then
    ' Query costruita direttamente con input utente - VULNERABILE
    sql = "SELECT * FROM utenti WHERE username = '" & username & "' AND password = '" & password & "'"

    Set rsUtente = conn.Execute(sql)

    If Not rs.EOF Then
        Session("username") = rs("username")
        Response.Redirect("welcome.asp")
    Else
        Response.Write("Username o password errati")
    End If

    rsUtente.Close
    Set rsUtente = Nothing
Else
    Response.Write "Inserisci username e password."
End If

conn.Close
Set conn = Nothing
%>
