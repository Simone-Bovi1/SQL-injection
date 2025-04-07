<%
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("Database.accdb")

username = Request.Form("username")
password = Request.Form("password")

sql = "INSERT INTO utenti (username, password) VALUES ('" & username & "', '" & password & "')"

On Error Resume Next
conn.Execute(sql)
If Err.Number = 0 Then
    Response.Write("Registrazione completata!")
Else
    Response.Write("Errore: " & Err.Description)
End If
On Error GoTo 0

conn.Close
Set conn = Nothing
%>
