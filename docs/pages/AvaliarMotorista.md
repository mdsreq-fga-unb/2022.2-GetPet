<h2 align="center"><b>Especificão de Caso de Uso: Avaliar corrida do motorista</b></h2>

<br>

Versão 1.1

## Histórico de Revisão
| Data | Versão | Descrição | Autor |
|------| ------ | --------- | ----- |
| 30/01/2023 | 1.0 | Adição da especificação de caso de uso | [Bruna Lima](https://github.com/libruna) |
| 31/01/2023 | 1.1 | Adição de fluxo alternativo e pré condições | [Bruna Lima](https://github.com/libruna) |

<br>

## 1. Descrição
Este caso de uso é utilizado pelos clientes para avaliarem os morotistas que realizaram suas corridas.

- Ator: Cliente.

<br>

## 2. Fluxo Básico de Eventos
- 2.1 O cliente concluiu uma corrida.
- 2.2	O aplicativo solicita a avaliação do cliente sobre a última corrida realizada.
- 2.3	O cliente adiciona uma nota em estrelas (1-5).
- 2.4	O cliente adiciona um comentário.
- 2.5	O cliente decide se deseja tornar a avaliação anônima.
- 2.6	O cliente envia a avaliação.
- 2.7	O aplicativo salva a avaliação.

<br>

## 3. Fluxos Alternativos
- ### 3.1 Pular avaliação
   - 3.1.1 O aplicativo solicita a avaliação do cliente.
   - 3.1.2 O cliente decide pular a avaliação.

<br>

## 4.	Fluxos de Exceção
### 4.1 FE1 – O cliente não preenche todas as informações necessárias.
No passo 2.3 do fluxo básico de eventos, caso o cliente tente enviar a avaliação com a nota em branco, o aplicativo deve exibir a mensagem: “O campo nota não pode ser vazio!”.

<br>

## 5. Pré-Condições
- 5.1 O cliente fez login.
- 5.2	O cliente realizou uma corrida.
- 5.3	A última corrida realizada não foi avaliada.

<br>

## 6. Pós-Condições
Não se aplica.

<br>

## 7. Pontos de Extensão
Não se aplica.

<br> 

## 8. Requisitos Especiais


<br>

## 9.	Informações Adicionais


<br>
