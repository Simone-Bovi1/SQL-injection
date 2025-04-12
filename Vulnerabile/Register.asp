<%
On Error Resume Next

Dim username, password
username = Request.Form("username")
password = Request.Form("password")
If username <> "" And password <> "" Then
	
    ' Connessione al database Access
    Dim connectionString
    Set objconn = Server.CreateObject("ADODB.Connection")
	Set objrs = Server.CreateObject("ADODB.Recordset")
	SQL = "INSERT INTO utenti (Username, Password) VALUES ('"+username+"','"+password+"')"
    connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.mappath("Database.accdb")
	
	objconn.Open connectionString
    objrs.Open SQL, objconn, 3, 3
	if ((objrs.BOF = TRUE) and (objrs.EOF = TRUE)) Then
		objrs.addNew
		objrs("Username") = username
		objrs("Password") = password
	End If
	
    objrs.update
	objrs.Close
	Set objrs = Nothing
	objconn.Close
	Set objconn = Nothing

Else
    Response.Write "<p>Per favore compila tutti i campi.</p>"
End If

If Err.Number <> 0 Then
    Response.Write "<p>Errore durante la registrazione: " & Err.Description & "</p>"
Else 
	Response.Write "<p>Registrazione avvenuta con successo. <a href='Login.html'>Accedi</a></p>"
End If
%>
