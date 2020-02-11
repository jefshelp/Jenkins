Automação API OSA
A execução da automação deve ser realizada pelo eclipse no arquivo runner.RunnerTest(executar por Junit) ou por comando maven: mvn test.
Configurações sobre a execução deve ser alterada no arquivo runner.RunnerTest, como a feature que serão executadas, url de execução e as tags selecionadas.
Caso o projeto seja alterado por mais de uma pessoa é aconselhado acrescentar o arquivo de execução(runner.RunnerTest) no arquivo .gitignore.
Após a execução da automação, a evidência é gravada em formato word e adicionada no diretório evidencia.