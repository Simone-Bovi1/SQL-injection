<%
Dim conn, cmd, username, password
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=Database.accdb;"

username = Request.Form("username")
password = Request.Form("password")

Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = conn
cmd.CommandText = "INSERT INTO Users (Username, Password) VALUES (?, ?)"
cmd.Parameters.Append cmd.CreateParameter("", 200, 1, 255, username)
cmd.Parameters.Append cmd.CreateParameter("", 200, 1, 255, password)
cmd.Execute()

Response.Write "Registrazione completata! <a href='index.html'>Torna al login</a>"

conn.Close
Set conn = Nothing
Set cmd = Nothing
%>