#language: pt
Funcionalidade: Regressivo EmailAge

  Contexto: 
    Dado que adiciono o endpoint "/engine/analyze"
    # Dado que adiciono o endpoint "http://180.125.89.127:8085/engine/analyze"
    E que adiciono o campo "Content-Type" com o valor "application/json" no objeto header
    Quando adiciono o campo "181" com o valor "NOME teste socio" sendo "texto" no objeto dados_do_socio
    E adiciono o campo "182" com o valor "14519258081" sendo "texto" no objeto dados_do_socio
    E adiciono o objeto dados_do_socio na lista list_dados_do_socio
    E adiciono o campo "181" com o valor "Automacao" sendo "texto" no objeto dados_do_socio_dois
    E adiciono o campo "182" com o valor "90689665024" sendo "texto" no objeto dados_do_socio_dois
    E adiciono o objeto dados_do_socio_dois na lista list_dados_do_socio
    E adiciono o campo "180" com a lista list_dados_do_socio no objeto parameters
    E adiciono o campo "370" com o valor "aprova@santander.com.br" sendo "texto" no objeto parameters
    E adiciono o campo "350" com o valor "11" sendo "inteiro" no objeto parameters
    E adiciono o campo "351" com o valor "945421654" sendo "inteiro" no objeto parameters
    E adiciono o campo "1" com o valor "1" sendo "inteiro" no objeto parameters
    E adiciono o campo "2" com o valor "automação_proposta[data]" sendo "texto" no objeto parameters
    E adiciono o campo "3" com o valor "1" sendo "inteiro" no objeto parameters
    E adiciono o campo "102" com o valor "81919831000163" sendo "texto" no objeto parameters
    E adiciono o campo "4" com o valor "52e944f4-17df-4dd0-84fb-4a9a32e95e94" sendo "texto" no objeto parameters
    E adiciono o campo "5" com o valor "3" sendo "inteiro" no objeto parameters
    E adiciono o campo "104" com o valor "J" sendo "texto" no objeto parameters
    E adiciono o campo "9" com o valor "2019-07-16 09:40:22.123" sendo "texto" no objeto parameters
    E adiciono o campo "1707" com o valor "170.150.75.112" sendo "texto" no objeto parameters
    E adiciono o campo "parameters" com o objeto parameters no objeto json

  @validacoesEmailAge, @regressivoEmailAge
  Esquema do Cenario: Emailage Regressivo
    E inicio o cenario "<cenario>" do projeto "OSA" e parceiro "EmailAge"
    E que guardo o json com a biblioteca de codigo
    Quando inicio a execucao do passo "Relizar Request no EmailAge"
    E realizo update no balde para preparacao de massa "<queryUpdate>"
    E adiciono o campo "370" com o valor "<email>" sendo "texto" no objeto parameters
    E coloco em destaque os campos "370,350,351"
    E inicio a execucao do passo "Recebo o Response do EmailAge"
    Entao recebo o objeto json e destaco os campos recebidos "9000,9001"
    E valido que no campo "parameters.9000" recebo o valor "<cod_retorno>"
    E valido que no campo "parameters.9001" recebo o valor "<msg_retorno>"
    E inicio a execucao do passo "Recebo o Response do Kibana"
    Entao recebo o objeto jsonKibana do endpoint "http://srvbdrivlbr05.bs.br.bsch:9200/br_osaconsultabureaus_*/_search" com o campo "parameters#2" e destaco os campos recebidos "indCompra,customerid,phone,ip,email"
    E valido que no campo "hits.hits[0]._source.bean.indCompra" recebo o valor "<ind_compra>" do objeto jsonKibana
    E fecho o arquivo de evidencia do "<cenario>" e envio a execucao para o alm com "<testId>" e "<testCycle>"

    Exemplos: 
      | cenario                                                       | testId | testCycle | retorno | cod_retorno | msg_retorno | email                      | email_tipo | queryUpdate                                                                                | ind_compra |
      | (1.  Regressivo emailage proposta negada, retorna erro.)      |    135 |         2 | erro    |       75500 | null        | reprova@santander.com.br   | texto      | delete from OSA.tb_data_repository where cd_serv = '1' and cd_doc_cli like '%14519258081%' | S          |
      | (2.  Regressivo emailage retentativa, retorna erro.)          |    135 |         2 | erro    |       75550 | null        | emailinvalido@gmail.com.br | texto      | delete from OSA.tb_data_repository where cd_serv = '1' and cd_doc_cli like '%14519258081%' | S          |
      | (3.  Regressivo emailage proposta aprovada, retorna sucesso.) |    135 |         2 | sucesso |           0 | null        | aprova@santander.com.br    | texto      | delete from OSA.tb_data_repository where cd_serv = '1' and cd_doc_cli like '%14519258081%' | S          |

  @validacoesEmailAge, @regressivoEmailAgeServicoFora @ignore
  Esquema do Cenario: Emailage Regressivo Serviço afm fora
    E inicio o cenario "<cenario>" do projeto "OSA" e parceiro "EmailAge"
    E que guardo o json com a biblioteca de codigo
    Quando inicio a execucao do passo "Relizar Request no EmailAge"
    E adiciono o campo "370" com o valor "<email>" sendo "texto" no objeto parameters
    E coloco em destaque os campos "370,350,351"
    E inicio a execucao do passo "Recebo o Response do EmailAge"
    Entao recebo o objeto json e destaco os campos recebidos "9000,9001"
    E valido que no campo "parameters.9000" recebo o valor "<cod_retorno>"
    E valido que no campo "parameters.9001" recebo o valor "<msg_retorno>"
    E inicio a execucao do passo "Recebo o Response do Kibana"
    Entao recebo o objeto jsonKibana do endpoint "http://srvbdrivlbr05.bs.br.bsch:9200/br_osaconsultabureaus_*/_search" com o campo "parameters#2" e destaco os campos recebidos "indCompra,documentNumber"
    E fecho o arquivo de evidencia do "<cenario>" e envio a execucao para o alm com "<testId>" e "<testCycle>"

    Exemplos: 
      | cenario                                    | testId | testCycle | retorno | cod_retorno | msg_retorno                       | email                   | email_tipo |
      | (1.  Regressivo emailage servico afm fora) |    135 |         2 | erro    |       75899 | Erro ao validar serviço AfmClient | aprova@santander.com.br | texto      |
