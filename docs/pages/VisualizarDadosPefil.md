<h2 align="center"><b>Especificão de Caso de Uso: Visualizar dados do perfil</b></h2>

<br>

Versão 1.0

## Histórico de Revisão
| Data | Versão | Descrição | Autor |
|------| ------ | --------- | ----- |
| 06/02/2023 | 1.0 | Adição da especificação de caso de uso | [Ian da Costa](https://github.com/ian-dcg) |

<br>

## 1. Descrição
Este caso de uso é utilizado pelos clientes para visualizarem informações e dados de seu próprio perfil.

- Ator: Cliente.

<br>

## 2. Fluxo Básico de Eventos
- 2.1 O cliente deseja visualizar o seu perfil (RN01)(RN02).
- 2.2	Algum dado do cliente está incorreto e precisa ser editado. (FA01).

<br>

## 3. Fluxos Alternativos
- ### 3.1 [FA01] Editar Perfil
   - 3.1.1 O cliente não corrige a informação incorreta (FE01).
   - 3.1.2 O cliente envia a edição.
   - 3.1.3 O aplicativo salva a edição.
  
<br>

## 4.	Fluxos de Exceção
### 4.1 FE01 – O cliente não corrige a informação incorreta.
No passo 2.2 do fluxo básico de eventos, caso o cliente tente enviar a edição sem preencher campo algum, o aplicativo deve exibir a mensagem: “Este campo não pode ser vazio!”.

<br>

## 5. Pré-Condições
- 5.1 O cliente cadastrou seus dados.
- 5.2	O cliente fez login.

<br>

## 6. Pós-Condições
Não se aplica.

<br>

## 7. Pontos de Extensão
Não se aplica.

<br>

## 8. Regras de Negócio
- ### 8.1 [RN01] Realizar uma edição
   O aplicativo deve salvar a edição realizada pelo usuário a partir do momento que ele clicar para salvar.
- ### 8.2 [RN02] Visualizar os dados
   O aplicativo deve retornar para página anterior caso o cliente não faça edição de seus dados.

<br> 

## 9. Requisitos Especiais
### 9.1 Dispositivo móvel
Este caso de uso deve ser acessível, via dispositivo móvel, o qual utiliza o sistema operacional Android.

<br>

## 10. Informações Adicionais
[Diagrama geral de casos de uso do projeto](https://mdsreq-fga-unb.github.io/2022.2-GetPet/#/pages/CasosDeUso)
