#language: pt
Funcionalidade: PI investimentos

  @webPI
    Cenario: Simulação Investimentos
    Dado que acesso o endereco "https://www.invistacompi.com.br/s/"
    E inicio o cenario "Simulação Investimentos" do projeto "PI" e parceiro "PI investimentos"
    Quando inicio a execucao do passo "1. Acesso a página invista com PI"
    E clico em simular investimento
    Entao carrega a pagina pi-simulador
    Quando inicio a execucao do passo "2. Exibe página de seleção de valores e tempo"
    Quando seleciono o valor a investir de "R$ 100.000"
    E seleciono o tempo de "1 ano"
    Quando inicio a execucao do passo "3. Seleciono valores desejados"
    E clico em simular
    Quando inicio a execucao do passo "4. Exibe Sugestões de investimentos"
    Entao exibe investimentos
    E fecho o arquivo de evidencia do "Simulação Investimentos" e envio a execucao para o alm com "271" e "138"
    E finalizo a gravacao
    