<h2 align="center"><b>Visualizar dados da corrida
</b></h2>

<br>

Versão 1.1

## Histórico de Revisão
| Data | Versão | Descrição | Autor |
|------| ------ | --------- | ----- |
| 26/01/2023 | 1.0 | Adição da especificação de caso de uso | [Pedro Jesus](https://github.com/Peedrooo) |
| 06/01/2023 | 1.1 | Correção de tópicos da especificação, tendo em vista a rediagramação dos casos de uso | [Pedro Jesus](https://github.com/Peedrooo) |

<br>

## 1. Descrição
Caso de uso voltado para ator usuário ( generalização entre cliente e motorista ) que busca permitir a visualialização dos dados da corrida, tais como distância do motorista ao pet, distância do pet ao destino, valor proposto e observações do cliente.

- Ator: Usuário.

<br>

## 2. Fluxo Básico de Eventos
- 2.1 O cliente solicita uma corrida (RN01)(FA01)(FE01).
- 2.2 O motorista recebe a solicitação de corrida (RN02)(FA02).

<br>

## 3. Fluxos Alternativos
- ### 3.1 [FA01] Cliente visualiza dados da corrida
   - 3.1.1 O cliente visualiza os dados da corrida, tais como distância do motorista até o pet, distância do ponto de partida ao ponto final, horário de busca, valor da corrida(FE01).
- ### 3.2 [FA02] Motorista visualiza dados da corrida
   - 3.2.1 O motorista visualiza os dados da corrida, tais como distância do motorista até o pet, distância do ponto de partida ao ponto final, horário de busca, valor da corrida(FE01).
  
<br>

## 4. Fluxos de Exceção
### 4.1 FE01 – O cliente não preenche todas as informações necessárias.
No passo 2.1 do fluxo básico de eventos, caso o cliente não preencha todas as informações necessárias, o sistema não permite que o cliente solicite uma corrida.

<br>

## 5. Pré-Condições
- 5.1 O usuário realiza a autenticação.

<br>

## 6. Pós-Condições
- 6.1 O motorista pode escolher aceitar ou recusar a corrida.

<br>

## 7. Pontos de Extensão
Não se aplica.

<br>

## 8. Regras de Negócio
- ### 8.1 [RN01] Agendou uma corrida
   O cliente deve agendar uma corrida para que o motorista possa receber a notificação.
- ### 8.2 [RN02] Recebeu a notificação
   O motorista deve receber a noticação para que possa visualizar os dados da corrida.

<br> 

## 9. Requisitos Especiais
### 9.1 Dispositivo móvel
- O aplicativo deve ser desenvolvido para dispositivos móveis com sistema operacional Android.
- O dispositivo móvel deve possuir uma conexão com a internet para que o aplicativo possa ser utilizado.
- O dispositivo móvel deve possuir gps para que o usuário possa ser localizado.


<br>

## 10. Informações Adicionais
[Diagrama geral de casos de uso do projeto](https://mdsreq-fga-unb.github.io/2022.2-GetPet/#/pages/CasosDeUso)
