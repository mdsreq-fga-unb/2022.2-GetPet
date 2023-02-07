<h2 align="center"><b>Especificação de Caso de Uso: Atualizar Perfil</b></h2>

<br>

Versão 1.2

## Histórico de Revisão
| Data | Versão | Descrição | Autor |
|------| ------ | --------- | ----- |
| 20/01/2023 | 1.0 | Adição da especificação de caso de uso | [Guilherme Vilela](https://github.com/guivilela7) |

<br>

## 1. Descrição
A função de atualizar perfil consiste em editar informações do perfil do usuário que se vejam necessárias, tem o objetivo de permitir alterar as informações do usuário, mas sem poder alterar informações sensíveis.


<br>

## 2. Fluxo Básico de Eventos

- 2.1 Usuário pressiona o ícone de perfil.
- 2.2 Sistema carrega perfil do usuário com suas informações.
- 2.3 Usuário pressiona o botão de editar.
- 2.4 Sistema redireciona o usuário à página de edição do perfil.
- 2.5 Usuário altera celular e/ou email e/ou senha.
- 2.6 Usuário clica em salvar.
- 2.7 Sistema salva as informações alteradas.
- fim do fluxo.


<br>

## 3. Fluxos Alternativos
Não se aplica.
  
<br>

## 4.	Fluxos de Exceção
### 4.1 FE01 – Editar campo não editável
- 4.1.1 Usuário pressiona o ícone de perfil.
- 4.1.2 Sistema carrega perfil do usuário com suas informações.
- 4.1.3 Usuário pressiona o botão de editar.
- 4.1.4 Sistema redireciona o usuário à página de edição do perfil.
- 4.1.5 Usuário tenta alterar CPF e/ou Nome Completo.
- 4.1.6 Sistema impede o usuário de alterar por meio de um pop-up.
- fim do fluxo.

<br>

## 5. Pré-Condições
- 5.1 O cliente fez login.

<br>

## 6. Pós-Condições
- Retornar a visualização do perfil do usuário

<br>

## 7. Pontos de Extensão
Não se aplica.

<br>


## 8. Requisitos Especiais
### 8.1 Dispositivo móvel
- CPF único
- Este caso de uso deve ser acessível, via dispositivo móvel, o qual utiliza o sistema operacional Android]
<br>

## 9. Informações Adicionais
[Diagrama geral de casos de uso do projeto](https://mdsreq-fga-unb.github.io/2022.2-GetPet/#/pages/CasosDeUso)
