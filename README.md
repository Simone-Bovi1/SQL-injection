# Progetto Esempio Login ASP: Vulnerabile vs Sicuro

## Introduzione

Questo progetto dimostra la differenza fondamentale tra un sistema di login **vulnerabile** all'SQL Injection e uno **protetto** tramite l'uso di query parametrizzate, utilizzando **HTML** per il frontend e **ASP** per il backend, con connessione a un database tramite **ADO**.

L'obiettivo è puramente didattico: evidenziare i rischi della costruzione dinamica di query SQL con input utente non validato e mostrare la tecnica corretta (query parametrizzate) per prevenire attacchi di tipo SQL Injection.

## Tecnologie Utilizzate

* HTML
* ASP Classico (Active Server Pages)
* ADO (ActiveX Data Objects) per la connessione al database
* Database Access

## Struttura dei File

├── Protetto                     
│   └── Login_Protetto.html
│   └──	Login_Protetto.asp 
│   └──	Registrazione_Protetto.html 
│   └──	Registrazione_Protetto.asp
│   └──	Utenti.accdb
│   
├── Vulnerabile  
│   └── Login_Vulnerabile.html 
│   └──	Login_Vulnerabile.asp
│   └──	Registrazione_Vulnerabile.html
│   └──	Registrazione_Vulnerabile.asp 
│   └──	Utenti.accdb
│   
└── README.md               

