<h2 align="center"><b>Especificão de Caso de Uso: Avaliar corrida do motorista</b></h2>

<br>

Versão 1.2

## Histórico de Revisão
| Data | Versão | Descrição | Autor |
|------| ------ | --------- | ----- |
| 30/01/2023 | 1.0 | Adição da especificação de caso de uso | [Bruna Lima](https://github.com/libruna) |
| 31/01/2023 | 1.1 | Adição de fluxo alternativo e pré condições | [Bruna Lima](https://github.com/libruna) |
| 06/02/2023 | 1.2 | Ajustes no fluxo básico e alternativo | [Bruna Lima](https://github.com/libruna) |

<br>

## 1. Descrição
Este caso de uso é utilizado pelos clientes para avaliarem os motoristas que realizaram suas corridas.

- Ator: Cliente.

<br>

## 2. Fluxo Básico de Eventos
- 2.1 O cliente concluiu uma corrida (RN01)(RN02)(RN03).
- 2.2	O aplicativo solicita a avaliação do cliente sobre a última corrida realizada (FA01)(FA02).

<br>

## 3. Fluxos Alternativos
- ### 3.1 [FA01] Avalia o motorista
   - 3.1.1 O cliente adiciona uma nota em estrelas de 1-3 (FE01).
   - 3.1.2 O cliente adiciona um comentário.
   - 3.1.3 O cliente decide se deseja tornar a avaliação anônima.
   - 3.1.4 O cliente envia a avaliação.
   - 3.1.5 O aplicativo salva a avaliação.
- ### 3.2 [FA02] Pular avaliação
   - 3.2.1 O cliente decide pular a avaliação.
   - 3.2.2 O aplicativo não disponibiliza a corrida para avaliação novamente.
  
<br>

## 4.	Fluxos de Exceção
### 4.1 FE01 – O cliente não preenche todas as informações necessárias.
No passo 2.3 do fluxo básico de eventos, caso o cliente tente enviar a avaliação com a nota em branco, o aplicativo deve exibir a mensagem: “O campo nota não pode ser vazio!”.

<br>

## 5. Pré-Condições
- 5.1 O cliente fez login.
- 5.2	O cliente realizou uma corrida.

<br>

## 6. Pós-Condições
Não se aplica.

<br>

## 7. Pontos de Extensão
Não se aplica.

<br>

## 8. Regras de Negócio
- ### 8.1 [RN01] Realizou uma corrida
   O aplicativo deve solicitar a avaliação da corrida do motorista para o cliente a partir do primeiro acesso do cliente após realizar a corrida.
- ### 8.2 [RN02] Corrida mais recente
   O aplicativo deve solicitar apenas a avaliação da corrida mais recente.
- ### 8.3 [RN03] Não pulou a avaliação
   O aplicativo não deve solicitar a avaliação da corrida do motorista se o cliente optou por pular a avaliação da última corrida realizada.

<br> 

## 9. Requisitos Especiais
### 9.1 Dispositivo móvel
Este caso de uso deve ser acessível, via dispositivo móvel, o qual utiliza o sistema operacional Android.

<br>

## 10. Informações Adicionais
[Diagrama geral de casos de uso do projeto](https://mdsreq-fga-unb.github.io/2022.2-GetPet/#/pages/CasosDeUso)
