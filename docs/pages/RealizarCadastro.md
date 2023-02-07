# Especificação de Caso de Uso: Realizar cadastro

Versão 1.6

### Histórico de Revisão
| Data | Versão | Descrição | Autor |
|------| ------ | --------- | ----- |
| 07/01/2023 | 1.0 | Adição da especificação de caso de uso  final| [Maria Abritta](https://github.com/MariaAbritta)  |

## 1. Breve Descrição
Este caso de uso é utilizado pelos clientes para fazer o seu cadastro dentro da aplicação, bem como nome, sobrenome, e-mail e uma senha. 

## 2. Fluxo Básico de Eventos
Este caso de uso é iniciado quando o agente “Usuário” instala o app, entra no aplicativo e que utilizar os nossos serviços de transporte de pets. Um agente “Usuário” sempre inicia esse caso de uso caso não tenha um cadastro realizado antes para entrar nos serviços do app. O “Usuário” se cadastra inserindo seu nome/sobrenome, um e-mail e senha, fazendo o sistema coletar e armazenar as informações inseridas. Caso o cadastro tenha sido realizado com sucesso, o sistema retornaŕa uma mensagem avisando que o cadastro foi realizado, caso contrário, avisará que não foi realizado, pedindo para tentar novamente. <br>
As informações que são trocadas do agente “Usuário” são: Nome/Sobrenome - Na qual o usuário digitar o seu nome de acordo com seus documentos de identificação, E-mail - Um e-mail válido, isso sendo, um e-mail que o usuário utiliza e que tenha um endereço de e-mail: “@xxx” e Senha- Uma senha que terá autenticação para a validação dela (como uma senha de no mínimo 8 dígitos). <br>
Caso o agente “Usuário” insira um e-mail sem o “@” e/ou uma senha que não está nos padrões definidos (como mencionando o exemplo acima), será notificado com uma mensagem que não será possível realizar o cadastro, pois as informações não estão adicionadas corretamente para que o sistema as armazenem, autenticando o usuário.

### Atores
* Cliente que quer utilizar o serviço de transportar o seu pet.
* Motorista que deseja transportar pets e deseja prestar os nossos serviços.
    * Usuaŕio = Cliente + Motorista	

## 3. Fluxo de Eventos
### 3.1 Fluxo Principal
Este caso de uso é iniciado quando o “Usuário” escolher a opção Realizar Cadastro.

#### 3.1.1 O sistema apresenta as seguintes opções:
* Incluir os dados de usuário;
    * Nome/Sobrenome
    * E-mail
    * Senha
* Cadastrar os dados incluídos no sistema
* Receber notificação se foi cadastrado ou se houve algum impedimento para tal.

#### 3.1.2 O “Usuário” seleciona a opção para a inclusão do seu Nome/Sobrenome.
#### 3.1.3 O “Usuário” seleciona a opção para a inclusão do seu E-mail.
#### 3.1.4 O “Usuário” seleciona a opção para a inclusão da Senha.
#### 3.1.5 O sistema valida as informações preenchidas 
#### 3.1.6 O sistema apresenta mensagem de foi cadastrado com sucesso ou se não foi cadastrado.
#### 3.1.7 O caso de uso é encerrado.

## 4. Fluxos Alternativos
### 4.1 [FEAT03] Autenticação de usuário
No passo 4.1 do fluxo básico o “Usuário” após fazer o cadastro tenta fazer o seu login. 

#### 4.1.1 O sistema solicita que o “Usuário” informe o E-mail e Senha que se foi cadastrado na etapa de “Realizar cadastro”

#### 4.1.2 O “Usuário” informa o E-mail e Senha da conta cadastrada e solicita entrar no sistema do aplicativo

#### 4.1.3 O sistema procura os dados cadastrados para verificar se o “Usuário” é cadastrado no aplicativo

#### 4.1.4 O sistema exibe a tela inicial, significando que o login foi realizado com sucesso.
* Caso não esteja cadastrado, o sistema manda uma mensagem informando que não foi possível realizar o login

#### 4.1.5 O caso de uso é encerrado.

## 5. Fluxos de Exceção
### 5.1 FE1 – Validação de informações
Os passos 3.1.2, 3.1.3 e 3.1.4 o sistema verifica se uma ou mais informações não foram validadas (formato e/ou obrigatoriedade) e exibe mensagem informando o “Usuário”.

## 6. Pré-Condições
* Usuário faz o download do aplicativo.
* Usuário quer se cadastrar no aplicativo.

## 7 Pós-Condições
* Usuário deve entrar na aplicação com os dados que cadastrou, sendo eles E-mail e Senha cadastrados.







