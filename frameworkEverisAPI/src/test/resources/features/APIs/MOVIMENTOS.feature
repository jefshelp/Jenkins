#language: pt
Funcionalidade: Posicao	

  Contexto: 
    Dado que adiciono o endpoint "movimentos/lancamentos-provisionados?nrConta=5501535&nrRegistrosPagina=10&nrPagina=1"
    E que adiciono o campo "Authorization" com o valor "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6IkdSUF9BbmRiYW5rUGxhdGFmb3JtYV9DbGllbnRlIiwiaXNzIjoiaHR0cHM6Ly9hY2Vzc28uZXhhbXBsZS5jb20vR1JQX0FuZGJhbmtQbGF0YWZvcm1hX0NsaWVudGUiLCJzdWIiOiIwNjA0MzQ5Mjg5MFxuXG5cblxuXG5cblxuXG5cbiIsImp0aSI6IjY0YjdkYjE3LTFkOGYtNDc1Ny05NTdhLTVmMDM0ODI3NjQ1ZSIsImxhYmVsIjoiZDNBcmV6Y3RmeGRzZHl0Mk5XSVVZM1JoYkd0d1pBPT0iLCJyb290IjoiIiwic2VsZiI6IkJnSlNBMWRXQ0FVVkNGUT0iLCJ0eXBlIjoiQ0xJRU5URS5QRiIsIm5iZiI6MTU4MDk5Nzc4OCwiZXhwIjoxNTgxMDg0MTg4LCJpYXQiOjE1ODA5OTc3ODh9.wdJ3ejP_LKE-ythAbgNaXl-D5yTpSKRtlRjxlXYt8HzlXm_mj_iDlPapZ_iE525Y5OldRrY3oqXGRAxt7ATpdSX8HCb4lnHr-9hm5AvkdYd_G44eArRb0cj46r6NKeAsWZfkxQaxfD2YXELwbNCqHa-Z7z9nnP_Bpxk35m5uvDCXXAtZQzVTYFv7ydQ8oj32PJgut_yrcWqJSEddF-j73S9V24zbpplrfRXStqrHrbxKl3U8mVfcVRiotAseALGGtISQJPeIfusoMRaXJuaXo1sCGpvg8YZis7zxIqAOFWOa9knd5OWzjct2_UCv9YcRPlWvHcM2HF4gLc_ufiQ84Q" no objeto header

  @movimentos 
  Esquema do Cenario: Posicao por produto e periodo
    Quando inicio o cenario "<cenario>" do projeto "AndBank" e parceiro "API"
    E que guardo o json com a biblioteca de codigo
    E inicio a execucao do passo "Recebo o Response do lancamentos provisionados"
    Entao realizo um get e recebo o objeto json e destaco os campos recebidos "resultado,id,dtLancamento,dsOperacao,valor"
    E valido que no campo "resultado" recebo o valor "<resultado>"
    E fecho o arquivo de evidencia do "<cenario>"

    Exemplos: 
      | cenario                      | resultado |
      | 1. MOVIMENTOS_lancamentos_provicionados_CLIENTE |  OK |  
        
  @movimentos 
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
      | 2. MOVIMENTOS_lancamentos_provicionados_ASSESSOR |  OK |  