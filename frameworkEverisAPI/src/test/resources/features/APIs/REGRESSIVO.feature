#language: pt
Funcionalidade: Regressivo

  Contexto: 
    Dado que adiciono o endpoint "conta-corrente/extratoagregado?dtInicio=2020-02-06&dtFim=2020-02-06&nrConta=5501535"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header

 @regressao
  Esquema do Cenario: Posicao por produto e periodo
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response da conta corrente"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,agencia,nrConta,saldoInicial,saldoFinal"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "tipo" recebo o valor "<tipo>"
    E valido que no campo "conteudo.agencia" recebo o valor "<agencia>"
    E valido que no campo "conteudo.nrConta" recebo o valor "<nrConta>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | tipo | agencia | nrConta |
      | 1. CONTACORRENTE_extrato_gerado_CLIENTE |  OK | ExtratoAgregado | 1 | 5501535 |
   
  @regressao 
  Esquema do Cenario: Dados Cadastrais
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
      | 2. HIERARQUIA_dados_cadastrais_CLIENTE |  Adilson teste 4 |        OK |
     
  @regressao
  Esquema do Cenario: EvolucaoAUM
     Dado que adiciono o endpoint "integracao/assessor/evolucaoaum"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiJkMmNiZWUxZi03OGU3LTQ0NjItOGJiNy1iNTVhZjU3NTRhNzciLCJsYWJlbCI6Ik5sTUZBd0FKRVNkT1Zrbz0iLCJyb290IjoiIiwic2VsZiI6IlZRTlhXbFZjQlZVYUFBZz0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTc5NzA0NjY1LCJleHAiOjE1Nzk3OTEwNjUsImlhdCI6MTU3OTcwNDY2NX0.PXRwKoMYxekAJgsgzS_0MLmqhif3r0K-cwNjzPTYXwtsXu6kC3E-Kkcoma9_AmyyuC066CLENauprXlHTdENBCg179H6sE_s_n9wh_liu8F54lld8h7dDAHRtuJBcLFFe9BCXOkWwZiQHBGocQ97sAP6f3zMvuKgdJLtJuxEFxpNmogrhH7AbcNW1ndKwojrZVhzHhhZinGsa9NfzmB1eHI73RzGTe6FQ2i_NhYjVYwd6KIkEAxl8hlc94km_5HKzhrUKjI4VSHp03KbI5Lp0OZtGm4fQ5ix4g3RfZYymCpdjT8fkJQwwORpXrzAIxBy4SMmNET5XVLqirDDDcX7kA" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #E inicio a execucao do passo "Relizar Request no JsonPlaceHolder"
    #E coloco em destaque os campos "userId,number,id"
    E inicio a execucao do passo "Recebo o Response do integracao assessor evolucaoaum"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,valoresDiariosAum"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "conteudo.corHexAUMDia" recebo o valor "<corHex>"
    E valido que no campo "conteudo.corHexAUMMes" recebo o valor "<corHex1>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | corHex | corHex1|
      | 3. INTEGRACAO_evolucaoaum_ASSESSOR |  OK |    #6ACADC | #2f7eda|
  
 @regressao
  Esquema do Cenario: EvolucaoCaptacao
    Dado que adiciono o endpoint "integracao/assessor/evolucaocaptacao"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiJkMmNiZWUxZi03OGU3LTQ0NjItOGJiNy1iNTVhZjU3NTRhNzciLCJsYWJlbCI6Ik5sTUZBd0FKRVNkT1Zrbz0iLCJyb290IjoiIiwic2VsZiI6IlZRTlhXbFZjQlZVYUFBZz0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTc5NzA0NjY1LCJleHAiOjE1Nzk3OTEwNjUsImlhdCI6MTU3OTcwNDY2NX0.PXRwKoMYxekAJgsgzS_0MLmqhif3r0K-cwNjzPTYXwtsXu6kC3E-Kkcoma9_AmyyuC066CLENauprXlHTdENBCg179H6sE_s_n9wh_liu8F54lld8h7dDAHRtuJBcLFFe9BCXOkWwZiQHBGocQ97sAP6f3zMvuKgdJLtJuxEFxpNmogrhH7AbcNW1ndKwojrZVhzHhhZinGsa9NfzmB1eHI73RzGTe6FQ2i_NhYjVYwd6KIkEAxl8hlc94km_5HKzhrUKjI4VSHp03KbI5Lp0OZtGm4fQ5ix4g3RfZYymCpdjT8fkJQwwORpXrzAIxBy4SMmNET5XVLqirDDDcX7kA" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #E inicio a execucao do passo "Relizar Request no JsonPlaceHolder"
    #E coloco em destaque os campos "userId,number,id"
    E inicio a execucao do passo "Recebo o Response do integracao assessor evolucaocaptacao"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,dtCaptacao"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "conteudo.corHexCaptacaoDia" recebo o valor "<corHex>"
    E valido que no campo "conteudo.corHexCaptacaoMes" recebo o valor "<corHex1>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | corHex | corHex1|
      | 4. INTEGRACAO_evolucaocaptacao_ASSESSOR  |  OK |    #2F7EDA | #F0AD4E|
      
 @regressao
  Esquema do Cenario: Movimentos lancamentos_provisionados
   Dado que adiciono o endpoint "movimentos/lancamentos-provisionados?nrConta=5501535&nrRegistrosPagina=10&nrPagina=1"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do lancamentos provisionados"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,id,dtLancamento,dsOperacao,valor"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 5. MOVIMENTOS_lancamentos_provicionados_CLIENTE |  OK |       
    
 @regressao 
  Esquema do Cenario: POSICAO_consolidada_CLIENTE
  
     Dado que adiciono o endpoint "posicao/consolidada?nrConta=5501535"
   #E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiJkMmNiZWUxZi03OGU3LTQ0NjItOGJiNy1iNTVhZjU3NTRhNzciLCJsYWJlbCI6Ik5sTUZBd0FKRVNkT1Zrbz0iLCJyb290IjoiIiwic2VsZiI6IlZRTlhXbFZjQlZVYUFBZz0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTc5NzA0NjY1LCJleHAiOjE1Nzk3OTEwNjUsImlhdCI6MTU3OTcwNDY2NX0.PXRwKoMYxekAJgsgzS_0MLmqhif3r0K-cwNjzPTYXwtsXu6kC3E-Kkcoma9_AmyyuC066CLENauprXlHTdENBCg179H6sE_s_n9wh_liu8F54lld8h7dDAHRtuJBcLFFe9BCXOkWwZiQHBGocQ97sAP6f3zMvuKgdJLtJuxEFxpNmogrhH7AbcNW1ndKwojrZVhzHhhZinGsa9NfzmB1eHI73RzGTe6FQ2i_NhYjVYwd6KIkEAxl8hlc94km_5HKzhrUKjI4VSHp03KbI5Lp0OZtGm4fQ5ix4g3RfZYymCpdjT8fkJQwwORpXrzAIxBy4SMmNET5XVLqirDDDcX7kA" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #E inicio a execucao do passo "Relizar Request no JsonPlaceHolder"
    #E coloco em destaque os campos "userId,number,id"
    E inicio a execucao do passo "Recebo o Response do posicao consolidada"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,nmSegmento,dataSegmento"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "conteudo.segmentos.nmSegmento[0]" recebo o valor "<Valida_Segmento>"
    E valido que no campo "conteudo.segmentos.nmSegmento[1]" recebo o valor "<Valida_Segmento1>"
    E valido que no campo "conteudo.segmentos.nmSegmento[2]" recebo o valor "<Valida_Segmento2>"
    E valido que no campo "conteudo.segmentos.nmSegmento[3]" recebo o valor "<Valida_Segmento3>"
     E valido que no campo "conteudo.segmentos.nmSegmento[4]" recebo o valor "<Valida_Segmento4>"
     E valido que no campo "conteudo.segmentos.nmSegmento[5]" recebo o valor "<Valida_Segmento5>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | Valida_Segmento | Valida_Segmento1|Valida_Segmento2| Valida_Segmento3|Valida_Segmento4| Valida_Segmento5| Valida_Segmento6|
      | 6. POSICAO_consolidada_CLIENTE |  OK |    Renda Fixa | Fundos | Produtos Estruturados| Renda Variável| Derivativos| Valores em Trânsito| Saldo|
  
 @regressao  
  Esquema do Cenario: Estruturado por operacao
   Dado que adiciono o endpoint "posicao/estruturados/por/operacao/?nrConta=5501535&nrRegistrosPagina=10&nrPagina=0"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do posicao estruturado por operacao"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,valorBruto,valorAplicado,dtOperacao,valorUnitario,valorLiquido,nmProduto,id,conta,nmSegmento,sgIndice"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 7. POSICAO_estruturados_por_operacao_CLIENTE |  OK |  
  
 @regressao
  Esquema do Cenario: Fundos por produto
    Dado que adiciono o endpoint "posicao/fundos/por/produto/com/operacoes?nrConta=5501535"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do posicao fundos por operacao"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,valorBruto,provisaoIrIof,dtAplicacao,valorUnitario,valorLiquido,nmProduto,id,conta,nmSegmento"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 8. POSICAO_fundos_por_operacao_CLIENTE |  OK |  
     
  @regressao
   Esquema do Cenario: RendaFixa por operacao
     Dado que adiciono o endpoint "posicao/rendafixa/por/operacao/?nrConta=5501535"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do posicao rendafixa por operacao"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,valorBruto,valorAplicado,dtAplicacao,sgIndice,nmProduto,id,conta,nmSegmento"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 9. POSICAO_rendafixa_por_operacao_CLIENTE |  OK |  
      
 @regressao
  Esquema do Cenario: POSICAO_rendavariavel_por_operacao
   Dado que adiciono o endpoint "posicao/rendavariavel/por/produto/?nrConta=5501535&nrRegistrosPagina=10&nrPagina=0"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do Posicao RendaVariavel por Operacao"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,valorBruto,valorAplicado,dtOperacao,valorUnitario,valorLiquido,nmProduto,id,conta,nmSegmento,sgIndice"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 10. POSICAO_rendavariavel_por_operacao_CLIENTE |  OK |  
      
 @regressao
  Esquema do Cenario:  POSICAO_valoresemtransito_CLIENTE
    Dado que adiciono o endpoint "posicao/valoresemtransito?nrConta=5501535&nrRegistrosPagina=10&nrPagina=0"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do posicao valores em transito"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 11. POSICAO_valoresemtransito_CLIENTE |  OK |  
       
 @regressao 
  Esquema do Cenario: RENTABILIDADE_carteira_rentabilidade_acumulativa 
    Dado que adiciono o endpoint "rentabilidade/carteira/rentabilidade/acumulativa?nrConta=5501535&dtInicio=2020-01-02&dtFim=2020-01-30"
   E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiJkMmNiZWUxZi03OGU3LTQ0NjItOGJiNy1iNTVhZjU3NTRhNzciLCJsYWJlbCI6Ik5sTUZBd0FKRVNkT1Zrbz0iLCJyb290IjoiIiwic2VsZiI6IlZRTlhXbFZjQlZVYUFBZz0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTc5NzA0NjY1LCJleHAiOjE1Nzk3OTEwNjUsImlhdCI6MTU3OTcwNDY2NX0.PXRwKoMYxekAJgsgzS_0MLmqhif3r0K-cwNjzPTYXwtsXu6kC3E-Kkcoma9_AmyyuC066CLENauprXlHTdENBCg179H6sE_s_n9wh_liu8F54lld8h7dDAHRtuJBcLFFe9BCXOkWwZiQHBGocQ97sAP6f3zMvuKgdJLtJuxEFxpNmogrhH7AbcNW1ndKwojrZVhzHhhZinGsa9NfzmB1eHI73RzGTe6FQ2i_NhYjVYwd6KIkEAxl8hlc94km_5HKzhrUKjI4VSHp03KbI5Lp0OZtGm4fQ5ix4g3RfZYymCpdjT8fkJQwwORpXrzAIxBy4SMmNET5XVLqirDDDcX7kA" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o response do rentabilidade carteira"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,dadosRentabilidade,valorPatrimonio"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "conteudo.corHexCDI" recebo o valor "<corHexCDI>"
    E valido que no campo "conteudo.corHexIbov" recebo o valor "<corHexIbov>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | corHexCDI| corHexIbov |
      | 12. RENTABILIDADE_carteira_rentabilidade_acumulativa_CLIENTE |  0 |  #f0ad4e  |  #000000 |
         
  @regressao
  Esquema do Cenario: RENTABILIDADE_por_produto_periodo
      Dado que adiciono o endpoint "rentabilidade/carteira/rentabilidade/por/produto/periodo?dtFim=2020-01-31&dtInicio=2020-01-01&idSegmento=0&nrConta=5501535&nrPagina=0&nrRegistrosPagina=10"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6ImY0ZDVkYTUyLTQzY2UtNGQ2NC04MTU0LWIxYTVjNWU3MjY2OSIsImxhYmVsIjoiSjNBdGVUY3VleEpzY253dE5tSVVNSGRpYkdwMFpnPT0iLCJyb290IjoiIiwic2VsZiI6IlZnSlVBVmRWREFBVkRRTT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDQ5MzEyNywiZXhwIjoxNTgwNTc5NTI3LCJpYXQiOjE1ODA0OTMxMjd9.LrWO6vPoza3H-T6YxJyftSkw4ZDVWe_35F4ely8mhZx1NLrH9LZJFaukslkm2Q3DLGNl6r8JRWPF8mxjY68d49DRrZgGNpi5Uc_VR1QydzvN4xHVGBOmMb8Kr9xE2iJkSeJCScwZ8i0642CLsI2-nuzQKG306oGzQKu26pHMSsjwJ0-4y2hC46IBU8dkLxKRZmz9YV3kUuZSg8hcA7p030tRvXzIuYfeu_PBTkKLVbUXMtt4bpDqRCWVedvorsw3LLrU-ZrpRF9l7sg7DFnItEkEdOrs3mQPBlwM9188ps70SMPiPEDgnf0KYLZ6QQMzgrlHJtQwwyOa1BvBgxNMKg" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #E inicio a execucao do passo "Relizar Request no JsonPlaceHolder"
    #E coloco em destaque os campos "userId,number,id"
    E inicio a execucao do passo "Recebo o Response do rentabilidade por produto periodo"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "cdi,valorEntrada,conta,dtAplicacao"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "conteudo.ativos.cdi[0]" recebo o valor "<valor_cdi> "
    E valido que no campo "conteudo.ativos.cdi[3]" recebo o valor "<valor_cdi3>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | valor_cdi | valor_cdi3|
      | 13. RENTABILIDADE_por_produto_periodo_CLIENTE |  OK |    0.0034 |  7.0E-4|
      
  @regressao
  Esquema do Cenario: Posicao por produto e periodo
    Dado que adiciono o endpoint "posicao/fundos/por/produto/com/operacoes?nrConta=5501535"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do posicao fundos por operacao"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,valorBruto,provisaoIrIof,dtAplicacao,valorUnitario,valorLiquido,nmProduto,id,conta,nmSegmento"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 14. POSICAO_fundos_por_operacao_CLIENTE |  OK |  
      
     @regressao 
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
      | 15. INTEGRACAO_assessor_cardsIniciais_ASSESSOR |  OK |  
      
      @regressao
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
      | 16. INTEGRACAO_assessor_topRentabilidade_ASSESSOR |  OK |   
      
       @regressao
     Esquema do Cenario:  INTEGRACAO_assessor_topSaldo
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do integracao assessor topSaldo"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,nmCliente,nmAssessor,valorSaldo"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | 
      | 17. INTEGRACAO_assessor_topSaldo_ASSESSOR |  2 |  
     
      @regressao
  Esquema do Cenario: RENTABILIDADE_carteira_versus
    Dado que adiciono o endpoint "rentabilidade/carteira/versus/indices?dtFim=2020-01-31&dtInicio=2020-01-02&indice=33&nrConta=5501535"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjZiZDhiZTFjLWM1YmQtNDBkOC1iODdjLWI3OTA5OGJmNmJmMiIsImxhYmVsIjoiZHlZdGRERXFmME5zSlhvc04ySVVaQ1Z1YkRCOVpBPT0iLCJyb290IjoiIiwic2VsZiI6IkJsUlVERkZSQ0ZFVldnVT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MTM0NTc3MSwiZXhwIjoxNTgxNDMyMTcxLCJpYXQiOjE1ODEzNDU3NzF9.UcpQ0uNG7UCkX9nCBL7sfIis6ECBfK0Qfbt4R4Fn5RZDj4UlyxTe8LYrPOru10RnhQIwAJYzvyTgBtHy4txlwyqIOdirxgPCvL37L4rEPVJ8DyqROXyTYuFgQsGij_B8XvCHIH5flXLu-OZsoWBJFTmz-UbUFTK6TMfyLylI_nP7TL2KQWyKUYrjEJJaIbfrzlQVMqkyNJ1DYWAL8lKRYP0BIBOi9V2oerYagulxzg1n_laXeYSal6Dm_6fg6LeBOYx4WV3Fm6E7j6TESE-vmtUx4QxobvpgNsHbGdJfEWwlgpFHHVP-EcD9HGmU3LAtyH32Sl6gTXu69u6XSxFXZw" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o response do rentabilidade carteira"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,nmProduto,rentabilidade6meses,rentabilidade12meses,rentabilidade36meses,rentabilidade24meses"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "conteudo.produtosNoPeriodo.idProduto[0]" recebo o valor "<idproduto>"
    E valido que no campo "conteudo.produtosNoPeriodo.idProduto[1]" recebo o valor "<idproduto1>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | idproduto | idproduto1 |
      | 18. RENTABILIDADE_carteira_versus_CLIENTE | OK |  3  |  2  |
      
       @regressao 
  Esquema do Cenario: Posicao por produto e periodo
    Dado que adiciono o endpoint "movimentos/lancamentos-provisionados?nrConta=5501535&nrRegistrosPagina=10&nrPagina=1"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoia2FyZW4ucGVyZWlyYSIsImp0aSI6IjNkNDk4MDMyLTUxZjMtNDk2My1hYzhiLTEzZmY4NTQ4MzljMCIsImxhYmVsIjoiZUNWbWZIWVFZWGRxZkg4bkUzMXhhM042ZnlBPSIsInJvb3QiOiIiLCJzZWxmIjoiQUZjR0NnZ0lBd3NWQlFZPSIsInR5cGUiOiJGVU5DSU9OQVJJTy5DT01FUkNJQUwiLCJuYmYiOjE1ODEzNTY5MTcsImV4cCI6MTU4MTQ0MzMxNywiaWF0IjoxNTgxMzU2OTE3fQ.WYU1npNMFvBQWqYebD3lNuUS-YGxnMxI6g6wKOi70vdDobJ06OuwQjBWVN3aBsKHHquQeYbEDxAXQCAdwNGSWC87fol7_9u26MkxojnoRsA1i7Xcz2rj8DS7NwKMhiXMO_PLZD7D_307uzhRGHTSaW5Bl60FGCcGKrE7eKnp1P0nTcGPUc2spQlPtGnT0FRy4d0bTPWfCbxTi5YTM5p2TIR5zQIpcmAc259_nxns7EeKLWQ6WH8IMAN28CRj4mjnGj2itw2lRZaTXKSTTVVGPlgoejSXSbDNPfs0YcmFVZL24v0JhiOe466gOQsGoPvnC42EliG2Kijw46U6Lh-WLA" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do lancamentos provisionados"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,id,dtLancamento,dsOperacao,valor"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 19. MOVIMENTOS_lancamentos_provicionados_ASSESSOR |  OK |  