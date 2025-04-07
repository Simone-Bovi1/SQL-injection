<%
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("Database.accdb")

user = Request.QueryString("user")

sql = "SELECT * FROM utenti WHERE username = '" & user & "'"

Set rs = conn.Execute(sql)

If Not rs.EOF Then
    Response.Write("Benvenuto, " & rs("username"))
Else
    Response.Write("Utente non trovato.")
End If

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing
%>
