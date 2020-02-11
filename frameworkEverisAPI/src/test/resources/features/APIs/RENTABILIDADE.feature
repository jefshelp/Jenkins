#language: pt
Funcionalidade: Rentabilidade	

  Contexto: 
    Dado que adiciono o endpoint "rentabilidade/carteira/rentabilidade/mensal?nrConta=5501535"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header

  @rentabilidade 
   Esquema do Cenario: RENTABILIDADE_carteira_mensal_CLIENTE 
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response da Rentabilidade Mensal"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,cdi,ibov,valorAplicado"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "tipo" recebo o valor "<tipo>"
    E valido que no campo "conteudo.corHexPatrimonio" recebo o valor "<corHexPatrimonio>"
    E valido que no campo "conteudo.corHexRentabilidade" recebo o valor "<corHexRentabilidade>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | tipo | corHexPatrimonio | corHexRentabilidade |
      | 1. RENTABILIDADE_carteira_mensal_CLIENTE |  OK | CarteiraMensalComCores | #f0ad4e | #2f7eda |
      
     
  @rentabilidade 
  Esquema do Cenario:  RENTABILIDADE_por_produto_periodo
    Dado que adiciono o endpoint "rentabilidade/carteira/rentabilidade/por/produto/periodo?dtFim=2020-01-31&dtInicio=2020-01-01&idSegmento=0&nrConta=5501535&nrPagina=0&nrRegistrosPagina=10"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6ImY0ZDVkYTUyLTQzY2UtNGQ2NC04MTU0LWIxYTVjNWU3MjY2OSIsImxhYmVsIjoiSjNBdGVUY3VleEpzY253dE5tSVVNSGRpYkdwMFpnPT0iLCJyb290IjoiIiwic2VsZiI6IlZnSlVBVmRWREFBVkRRTT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDQ5MzEyNywiZXhwIjoxNTgwNTc5NTI3LCJpYXQiOjE1ODA0OTMxMjd9.LrWO6vPoza3H-T6YxJyftSkw4ZDVWe_35F4ely8mhZx1NLrH9LZJFaukslkm2Q3DLGNl6r8JRWPF8mxjY68d49DRrZgGNpi5Uc_VR1QydzvN4xHVGBOmMb8Kr9xE2iJkSeJCScwZ8i0642CLsI2-nuzQKG306oGzQKu26pHMSsjwJ0-4y2hC46IBU8dkLxKRZmz9YV3kUuZSg8hcA7p030tRvXzIuYfeu_PBTkKLVbUXMtt4bpDqRCWVedvorsw3LLrU-ZrpRF9l7sg7DFnItEkEdOrs3mQPBlwM9188ps70SMPiPEDgnf0KYLZ6QQMzgrlHJtQwwyOa1BvBgxNMKg" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    #E inicio a execucao do passo "Relizar Request no JsonPlaceHolder"
    #E coloco em destaque os campos "userId,number,id"
    E inicio a execucao do passo "Recebo o Response do AndBank"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "cdi,valorEntrada,conta,dtAplicacao"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E valido que no campo "conteudo.ativos.cdi[0]" recebo o valor "<valor_cdi> "
    E valido que no campo "conteudo.ativos.cdi[3]" recebo o valor "<valor_cdi3>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado | valor_cdi | valor_cdi3|
      | 2. RENTABILIDADE_por_produto_periodo |  OK |    0.0034 |  7.0E-4|
      
      @rentabilidade
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
      | 3. RENTABILIDADE_carteira_rentabilidade_acumulativa |  0 |  #f0ad4e  |  #000000 |
      
         @rentabilidade
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
      | 4. RENTABILIDADE_carteira_versus | OK |  3  |  2  |
     