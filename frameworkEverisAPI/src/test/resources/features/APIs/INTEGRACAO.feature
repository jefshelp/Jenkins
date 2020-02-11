#language: pt
Funcionalidade: Integracao	

  Contexto: 
    Dado que adiciono o endpoint "integracao/assessor/topsaldo"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiI2ZWZmYzFkOC1lYTA5LTRiYWEtOWFlNi04NmU1Y2UzZmU2ZDkiLCJsYWJlbCI6IlpBUUFCd1pkUkhsT0JCTT0iLCJyb290IjoiIiwic2VsZiI6IkIxUlNYbE1JVUFzYVVsRT0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTgwOTI4OTAxLCJleHAiOjE1ODEwMTUzMDEsImlhdCI6MTU4MDkyODkwMX0.ie_9iyjTe9IcnScUBN03ORh_qEAZtJTiPeCKYSZQdaOeHAQL_W01wGcr2vkbK_gdAAowFfMbSdz3pRRZ8k8vIfs9zn6YEREaYQmMX92Dz9AP5U-EnLLMlP2Hupv6uBQtn7hmdPAXRkR3JZbV0vZnOlUWeW_bAZqhyXJMj0r_u_HnaGXLde6IJPpBFeV3oU_zpqNia6XETOmdzthHSmkRkSh5Hr4mDdVh-AHkNS7qSd8UbceEKrFkzVfuIGzkxsSKYS-p-s2WIhV496l7xVk3ejAvaps6FtLCY4YBKrA4cHEDi8rBx2yQN5taRa96syNt-I3CRnWt_uMUTyboz2Y4FA" no objeto header

 @integracao 
  Esquema do Cenario:  INTEGRACAO_assessor_topSaldo
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do integracao assessor topSaldo"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,nmCliente,nmAssessor,valorSaldo"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | 
      | 1. INTEGRACAO_assessor_topSaldo_ASSESSOR |  2 |  
   
 @integracao
  Esquema do Cenario: INTEGRACAO_evolucaoaum_ASSESSOR
    
     Dado que adiciono o endpoint "integracao/assessor/evolucaoaum"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiJkMmNiZWUxZi03OGU3LTQ0NjItOGJiNy1iNTVhZjU3NTRhNzciLCJsYWJlbCI6Ik5sTUZBd0FKRVNkT1Zrbz0iLCJyb290IjoiIiwic2VsZiI6IlZRTlhXbFZjQlZVYUFBZz0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTc5NzA0NjY1LCJleHAiOjE1Nzk3OTEwNjUsImlhdCI6MTU3OTcwNDY2NX0.PXRwKoMYxekAJgsgzS_0MLmqhif3r0K-cwNjzPTYXwtsXu6kC3E-Kkcoma9_AmyyuC066CLENauprXlHTdENBCg179H6sE_s_n9wh_liu8F54lld8h7dDAHRtuJBcLFFe9BCXOkWwZiQHBGocQ97sAP6f3zMvuKgdJLtJuxEFxpNmogrhH7AbcNW1ndKwojrZVhzHhhZinGsa9NfzmB1eHI73RzGTe6FQ2i_NhYjVYwd6KIkEAxl8hlc94km_5HKzhrUKjI4VSHp03KbI5Lp0OZtGm4fQ5ix4g3RfZYymCpdjT8fkJQwwORpXrzAIxBy4SMmNET5XVLqirDDDcX7kA" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #E inicio a execucao do passo "Relizar Request no JsonPlaceHolder"
    #E coloco em destaque os campos "userId,number,id"
    E inicio a execucao do passo "Recebo o Response do AndBank"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,valoresDiariosAum"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "conteudo.corHexAUMDia" recebo o valor "<corHex>"
    E valido que no campo "conteudo.corHexAUMMes" recebo o valor "<corHex1>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | corHex | corHex1|
      | 2. INTEGRACAO_evolucaoaum_ASSESSOR |  OK |    #6ACADC | #2f7eda|
  
  @integracao 
  Esquema do Cenario: INTEGRACAO_evolucaocaptacao 
    Dado que adiciono o endpoint "integracao/assessor/evolucaocaptacao"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiJkMmNiZWUxZi03OGU3LTQ0NjItOGJiNy1iNTVhZjU3NTRhNzciLCJsYWJlbCI6Ik5sTUZBd0FKRVNkT1Zrbz0iLCJyb290IjoiIiwic2VsZiI6IlZRTlhXbFZjQlZVYUFBZz0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTc5NzA0NjY1LCJleHAiOjE1Nzk3OTEwNjUsImlhdCI6MTU3OTcwNDY2NX0.PXRwKoMYxekAJgsgzS_0MLmqhif3r0K-cwNjzPTYXwtsXu6kC3E-Kkcoma9_AmyyuC066CLENauprXlHTdENBCg179H6sE_s_n9wh_liu8F54lld8h7dDAHRtuJBcLFFe9BCXOkWwZiQHBGocQ97sAP6f3zMvuKgdJLtJuxEFxpNmogrhH7AbcNW1ndKwojrZVhzHhhZinGsa9NfzmB1eHI73RzGTe6FQ2i_NhYjVYwd6KIkEAxl8hlc94km_5HKzhrUKjI4VSHp03KbI5Lp0OZtGm4fQ5ix4g3RfZYymCpdjT8fkJQwwORpXrzAIxBy4SMmNET5XVLqirDDDcX7kA" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #E inicio a execucao do passo "Relizar Request no JsonPlaceHolder"
    #E coloco em destaque os campos "userId,number,id"
    E inicio a execucao do passo "Recebo o Response do AndBank"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,dtCaptacao"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "conteudo.corHexCaptacaoDia" recebo o valor "<corHex>"
    E valido que no campo "conteudo.corHexCaptacaoMes" recebo o valor "<corHex1>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | corHex | corHex1|
      | 3. INTEGRACAO_evolucaocaptacao_ASSESSOR  |  OK |    #2F7EDA | #F0AD4E|
      
 
 @integracao 
  Esquema do Cenario: INTEGRACAO_assessor_cardsIniciais
    Dado que adiciono o endpoint "integracao/assessor/cardsIniciais"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiI2ZWZmYzFkOC1lYTA5LTRiYWEtOWFlNi04NmU1Y2UzZmU2ZDkiLCJsYWJlbCI6IlpBUUFCd1pkUkhsT0JCTT0iLCJyb290IjoiIiwic2VsZiI6IkIxUlNYbE1JVUFzYVVsRT0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTgwOTI4OTAxLCJleHAiOjE1ODEwMTUzMDEsImlhdCI6MTU4MDkyODkwMX0.ie_9iyjTe9IcnScUBN03ORh_qEAZtJTiPeCKYSZQdaOeHAQL_W01wGcr2vkbK_gdAAowFfMbSdz3pRRZ8k8vIfs9zn6YEREaYQmMX92Dz9AP5U-EnLLMlP2Hupv6uBQtn7hmdPAXRkR3JZbV0vZnOlUWeW_bAZqhyXJMj0r_u_HnaGXLde6IJPpBFeV3oU_zpqNia6XETOmdzthHSmkRkSh5Hr4mDdVh-AHkNS7qSd8UbceEKrFkzVfuIGzkxsSKYS-p-s2WIhV496l7xVk3ejAvaps6FtLCY4YBKrA4cHEDi8rBx2yQN5taRa96syNt-I3CRnWt_uMUTyboz2Y4FA" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do integracao assessor cardsiniciais	"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,nmCliente,nmAssessor,valorSaldo"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | 
      | 4. INTEGRACAO_assessor_cardsIniciais |  OK |  
      
   
  @integracao 
  Esquema do Cenario: INTEGRACAO_assessor_topRentabilidade
    Dado que adiciono o endpoint "integracao/assessor/topRentabilidade"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiI2ZWZmYzFkOC1lYTA5LTRiYWEtOWFlNi04NmU1Y2UzZmU2ZDkiLCJsYWJlbCI6IlpBUUFCd1pkUkhsT0JCTT0iLCJyb290IjoiIiwic2VsZiI6IkIxUlNYbE1JVUFzYVVsRT0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTgwOTI4OTAxLCJleHAiOjE1ODEwMTUzMDEsImlhdCI6MTU4MDkyODkwMX0.ie_9iyjTe9IcnScUBN03ORh_qEAZtJTiPeCKYSZQdaOeHAQL_W01wGcr2vkbK_gdAAowFfMbSdz3pRRZ8k8vIfs9zn6YEREaYQmMX92Dz9AP5U-EnLLMlP2Hupv6uBQtn7hmdPAXRkR3JZbV0vZnOlUWeW_bAZqhyXJMj0r_u_HnaGXLde6IJPpBFeV3oU_zpqNia6XETOmdzthHSmkRkSh5Hr4mDdVh-AHkNS7qSd8UbceEKrFkzVfuIGzkxsSKYS-p-s2WIhV496l7xVk3ejAvaps6FtLCY4YBKrA4cHEDi8rBx2yQN5taRa96syNt-I3CRnWt_uMUTyboz2Y4FA" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #E inicio a execucao do passo "Relizar Request no JsonPlaceHolder"
    #E coloco em destaque os campos "userId,number,id"
    E inicio a execucao do passo "Recebo o Response do integracao assessor topRentabilidade"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "cdi,valorEntrada,conta,dtAplicacao"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | 
      | 5. INTEGRACAO_assessor_topRentabilidade |  OK |   
     
      
      