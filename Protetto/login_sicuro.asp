<%
Dim conn, cmd, rs, username, password
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=Database.accdb;"

username = Request.Form("username")
password = Request.Form("password")

Set cmd = Server.CreateObject("ADODB.Command")
cmd.ActiveConnection = conn
cmd.CommandText = "SELECT * FROM Users WHERE Username=? AND Password=?"
cmd.Parameters.Append cmd.CreateParameter("", 200, 1, 255, username)
cmd.Parameters.Append cmd.CreateParameter("", 200, 1, 255, password)
Set rs = cmd.Execute()

If Not rs.EOF Then
    Response.Redirect "Benvenuto.asp"
Else
    Response.Write "Credenziali errate. (versione protetta)"
End If

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing
Set cmd = Nothing
%>
