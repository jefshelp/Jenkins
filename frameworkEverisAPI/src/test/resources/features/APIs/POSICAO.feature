#language: pt

Funcionalidade: Fundos de investimento
@posicao
  Esquema do Cenario: POSICAO_consolidada_CLIENTE 
   Dado que adiciono o endpoint "posicao/consolidada?nrConta=5501535"
  #  E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9Db21lcmNpYWwiLCJpc3MiOiJodHRwczovL2FjZXNzby5leGFtcGxlLmNvbS9HUlBfQW5kYmFua1BsYXRhZm9ybWFfQ29tZXJjaWFsIiwic3ViIjoicmFmYWVsLmFjYXIiLCJqdGkiOiJkMmNiZWUxZi03OGU3LTQ0NjItOGJiNy1iNTVhZjU3NTRhNzciLCJsYWJlbCI6Ik5sTUZBd0FKRVNkT1Zrbz0iLCJyb290IjoiIiwic2VsZiI6IlZRTlhXbFZjQlZVYUFBZz0iLCJ0eXBlIjoiRlVOQ0lPTkFSSU8uQ09NRVJDSUFMIiwibmJmIjoxNTc5NzA0NjY1LCJleHAiOjE1Nzk3OTEwNjUsImlhdCI6MTU3OTcwNDY2NX0.PXRwKoMYxekAJgsgzS_0MLmqhif3r0K-cwNjzPTYXwtsXu6kC3E-Kkcoma9_AmyyuC066CLENauprXlHTdENBCg179H6sE_s_n9wh_liu8F54lld8h7dDAHRtuJBcLFFe9BCXOkWwZiQHBGocQ97sAP6f3zMvuKgdJLtJuxEFxpNmogrhH7AbcNW1ndKwojrZVhzHhhZinGsa9NfzmB1eHI73RzGTe6FQ2i_NhYjVYwd6KIkEAxl8hlc94km_5HKzhrUKjI4VSHp03KbI5Lp0OZtGm4fQ5ix4g3RfZYymCpdjT8fkJQwwORpXrzAIxBy4SMmNET5XVLqirDDDcX7kA" no objeto header
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
      | 1. POSICAO_consolidada_CLIENTE |  OK |    Renda Fixa | Fundos | Produtos Estruturados| Renda Variável| Derivativos| Valores em Trânsito| Saldo|
  

 @posicao
  Esquema do Cenario:  POSICAO_estruturados_por_operacao_CLIENTE 
    Dado que adiciono o endpoint "posicao/estruturados/por/operacao/?nrConta=5501535&nrRegistrosPagina=10&nrPagina=0"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do posicao fundos por operacao"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,valorBruto,valorAplicado,dtOperacao,valorUnitario,valorLiquido,nmProduto,id,conta,nmSegmento,sgIndice"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 2. POSICAO_estruturados_por_operacao_CLIENTE |  OK |  


  @posicao
  Esquema do Cenario: POSICAO_rendafixa_por_operacao_CLIENTE
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
      | 3. POSICAO_rendafixa_por_operacao_CLIENTE |  OK |  
      

  @posicao
  Esquema do Cenario:  POSICAO_rendavariavel_por_operacao_CLIENTE
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
      | 4. POSICAO_rendavariavel_por_operacao_CLIENTE |  OK |  
      

@posicao
  Esquema do Cenario: POSICAO_valoresemtransito_CLIENTE 
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
      | 5. POSICAO_valoresemtransito_CLIENTE |  OK |  
      
         
  @posicao
  Esquema do Cenario: POSICAO_fundos_por_operacao
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
      | 6. POSICAO_fundos_por_operacao_CLIENTE |  OK |
      

    
   