# Técnicas de Programação 2 - 2/2017

## Membros
* Eduardo Araújo Cunha - 15/0033699
* Gabriel de Sousa Vieira - 16/0006350
* Lucas Mafra Chagas - 12/0126443


## Introdução

Implementação do jogo Desert Falcon em sua versão para o Atari 2600. Ele é feito na linguagem de programação [Ruby](https://www.ruby-lang.org/pt/) 2.4.1, utilizando as gemas [Gosu](https://github.com/gosu/gosu) como ferramenta gráfica e [Rspec](https://github.com/rspec/rspec) para estruturação e execução de testes. Para a realização dos testes de cobertura, foi usado o [SimpleCov](https://github.com/colszowka/simplecov). A documentação e gráficos foram gerados usando [Yard](https://yardoc.org/).

## Funcionamento

#### Projeto

Para a execução do projeto, é necessário entrar na pasta ../Desert_Falcon/lib e executar no terminal o seguinte comando:

```bash
  ruby main.rb
```

#### Teste

Para a execução dos testes, é necessário entrar na pasta ../Desert_Falcon/spec executar no terminal o seguinte comando:

```bash
  rspec *_spec.rb --format d
```

Onde é executado todos os testes. Para a execução dos testes de maneira separada, é necessário executar o seguinte comando:

```bash
  rspec [modulo]_spec.rb --format d
```

Onde o [modulo] é o modulo a ser testado.

Os testes de cobertura são gerados automaticamente após gerar os testes pelo rspec, gerando os seguintes dados:

Descrição dos testes de cobertura: (Desert_Falcon/spec/coverage/index.html)


## Documentação

Grafo do Código: (Documentacao/Grafo_Modulo.pdf)

link github: https://github.com/eduardoaraujocunhaa/tp2
