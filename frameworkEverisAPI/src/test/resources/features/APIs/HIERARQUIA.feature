#language: pt
Funcionalidade: Hierarquia

  Contexto: 
    Dado que adiciono o endpoint "hierarquia/cliente/dadoscadastrais"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjYyZDFhNmQ2LTY4NmYtNDBiNi04YmI5LTM2MTI5OTE0MjY5ZCIsImxhYmVsIjoiZDNZdGZUSjVLaFpzY0hkNE5XSVVaQ05nYkdvbk1RPT0iLCJyb290IjoiIiwic2VsZiI6IkJnUlVCVklDWFFRVkR3Zz0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDQxNjkyMiwiZXhwIjoxNTgwNTAzMzIyLCJpYXQiOjE1ODA0MTY5MjJ9.RKNfnjC7URG1kCcaIvC8Ywz_KgyuG9IUgPcqKOtjOEY59VfoTkeUeBt6X3NDDKl2XVBN-CuEiPwXt77IkFWkrZwraLRCGzHSZn65yZYjozjyZW4yAbsV5FebztR7X6cqlaLPJCef3N9BqeuRVRP8PYme1ez5tpt2BpS1VdfF518MEURneO-JIfW5Jurhr4heHbuj2Oa7odhjS4psapY02N39DNyzwLiqgeSYVSUn1Wc_zhVguKbyZ-N0m-6sMT9OE7TRKhVen6A1HQRWNP_lwl1J-5wNE3dgaRc5f5CCJ0OutfUImBd3PYbiEgLaostnByV7O0TW_Vs6T5n5QnAJDA" no objeto header
 #   E adiciono o objeto documents na lista list_documents
   # E adiciono o campo "nmCliente" com o valor "ADILSON AFONSO TAVARES" sendo "texto" no objeto documents
    #E adiciono o campo "nmExibicao" com o valor "Adilson teste 4" sendo "texto" no objeto documents
    #E adiciono o campo "emailCliente" com o valor "TAVARES@PORTONE.COM.BR" sendo "texto" no objeto documents
    #E adiciono o objeto documents_dois na lista list_documents
    #E adiciono o campo "documents" com a lista list_documents no objeto json sendo "lista"
    #E adiciono o campo "tipo" com o valor "DadosCadastrais" sendo "texto" no objeto json
    #E adiciono o campo "Resultado" com o valor "OK" sendo "texto" no objeto json
   
@hierarquia
  Esquema do Cenario: Dados Cadastrais
    E inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #Quando inicio a execucao do passo "Relizar Request no DadosCadastrais"
    #E coloco em destaque os campos "nmCliente,resultado,nmExibicao"
    E inicio a execucao do passo "Recebo o Response do DadosCadastrais"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,nmExibicao"
    E valido que no campo "conteudo.nmExibicao" recebo o valor "<nmExibicao_retorno>"
    E valido que no campo "resultado" recebo o valor "<resultado_retorno>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | nmExibicao_retorno | resultado_retorno |
      | 1. HIERARQUIA_dados_cadastrais_CLIENTE |  Adilson teste 4 |        OK |
      
     
   @hierarquia
  Esquema do Cenario: AssessorCombo
   Dado que adiciono o endpoint "hierarquia/assessor/combo"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoia2FyZW4ucGVyZWlyYVxuIiwianRpIjoiYWYxMTJmOWItNDIwZS00YTI5LWE1ZjYtYmMwMmQxYzg2NmEyIiwibGFiZWwiOiJLaWRqZEh4R2F5ZHFmWHh4UlgxeE0zZHdmeUE9Iiwicm9vdCI6IiIsInNlbGYiOiJVbFVEQWdKZUNWc1ZCQVU9IiwidHlwZSI6IkZVTkNJT05BUklPLkNPTUVSQ0lBTCIsIm5iZiI6MTU4MTEwNDc0NywiZXhwIjoxNTgxMTkxMTQ3LCJpYXQiOjE1ODExMDQ3NDd9.ORAqTX0-xpFFwN41JDHAK1dXL6GZF-tuV5FQPY_EpU2iWWwp4lEuaUbcJNugPuRSUwpdknQTAPKeAYD53rS6muKOr-J6pg1p0fLwHwHMFDS7ekxyWTlkq7LxJq4z4Ia84TKhtjEDbpqrxbQuGwbKW25rOEFgLOybuJdpLZYFv8_qM5iqVeOcla8G1ufL6EZROrF6ZoHaG9HUmIqph9FffG7GJtDmIwflsYFP-EpD91HnwnWBGkDncRN9evNfE16EkJzGDYyQL3jrp75qgpZruBJ5vAPTwUDVtTamkvGr-BxK8hZZ-vftHovfA8nENYYd5BPYSguUZrzaX5lLQkpr-g" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #E inicio a execucao do passo "Relizar Request no JsonPlaceHolder"
    #E coloco em destaque os campos "userId,number,id"
    E inicio a execucao do passo "Recebo o Response do AndBank"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,nmAssessor"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | 
      | 2. HIERARQUIA_assessor_combo |  OK |  
     