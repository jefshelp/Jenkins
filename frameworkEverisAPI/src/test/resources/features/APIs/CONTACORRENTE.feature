#language: pt
Funcionalidade: Conta Corrente	

  Contexto: 
    Dado que adiciono o endpoint "conta-corrente/extratoagregado?dtInicio=2020-02-06&dtFim=2020-02-06&nrConta=5501535"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header

   @contacorrente 
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