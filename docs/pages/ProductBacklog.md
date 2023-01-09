<h1 align="center"><b>Requisitos do Produto</b></h1>
Versão 1.4

<br>

### **Histórico de Revisão**

| Data | Versão | Descrição | Autor |
|------| ------ | --------- | ----- |
| 30/11/2022 | 1.0 | Primeira versão do backlog do produto | [Bruna Lima](https://github.com/libruna) |
| 30/11/2022 | 1.1 | Adicionando os requisitos não funcionais | [Murilo Perazzo](https://github.com/murilopbs) |
| 06/12/2022 | 1.2 | Adicionada nova feature ao backlog do produto e ajustes | [Maria Abritta](https://github.com/MariaAbritta) e [Bruna Lima](https://github.com/libruna) |
| 20/12/2022 | 1.3 | Ajuste FEAT01 do backlog do produto | [Bruna Lima](https://github.com/libruna) |
| 09/01/2023 | 1.4 | Atualização das FEAT05 e FEAT06 do backlog do produto | [Bruna Lima](https://github.com/libruna) |

### Sumário
- Backlog do Produto
- Requisitos não funcionais
- MVP1
- MVP2
- Referências

## Backlog do Produto 
O Backkog do Produto é um artefato da metodologia ágil SCRUM, que consiste em uma lista dos requisitos funcionais emergentes para o desenvolvimento do produto. A estrutura SAFe foi utilizada para auxiliar o planejamento e desenvolvimento desse artefato.

### User Roles
É o personagem fictício da user story que representa o consumidor ideal do produto, no caso do GetPet o cliente, o motorista e o usuário que é uma generalização dos dois anteriores. Todas as histórias são escritas a partir da perspectiva de um tipo de consumidor.

- **Cliente:** Pessoa que tem a necessidade de se transportar com um pet ou de transportar somente o pet. A frequência de uso do aplicativo vai depender das necessidades de cada cliente, mas a experiência deve ser ágil, confortável e segura. <br>
- **Motorista:** Pessoa que deseja ganhar uma fonte de renda realizando corridas pet friendly. A frequência de uso do aplicativo vai depender da demanda por transporte e disposição do motorista, mas a experiência deve ser prática e fácil. <br>
- **Usuário:** Refere-se tanto ao cliente quanto ao motorista. <br>
<br>

| Épico | Feature | User Story |
|-------|---------|------------|
| <b>[EP01]</b> Gerenciamento de usuários | <b>[FEAT01]</b> Perfil de usuário <br> | <b>[US01]</b> Como cliente, quero ser capaz de realizar meu cadastro para utilizar os serviços de viagem do aplicativo. <br> <b>[US02]</b> Como motorista, quero ser capaz de realizar meu cadastro para oferecer o meu serviço de viagem no aplicativo. <br> <b>[US03]</b> Como cliente, quero ser capaz de editar o meu perfil para manter os meus dados atualizados. <br> <b>[US04]</b> Como motorista, quero ser capaz de editar o meu perfil para manter os meus dados atualizados.| 
| <b>[EP01]</b> Gerenciamento de usuários | <b>[FEAT02]</b> Visualização de dados  <br> | <b>[US05]</b> Como motorista, quero ser capaz de visualizar o perfil de quem irei transportar para compreender as necessidades da pessoa e do pet. <br> <b>[US06]</b> Como cliente, quero ser capaz de visualizar o perfil do motorista para conhecer quem irá transportar meu pet.| 
| <b>[EP01]</b> Gerenciamento de usuários | <b>[FEAT03]</b> Autenticação de usuário | <b>[US07]</b> Como usuário, quero ser capaz de realizar login com email e senha para acessar as funcionalidades do aplicativo. <br> <b>[US08]</b> Como usuário, quero ser capaz de recuperar o acesso para me autenticar caso esqueça a senha.|
| <b>[EP02]</b> Gerenciamento de corridas | <b>[FEAT04]</b> Conectar usuários | <b>[US09]</b> Como cliente, quero ser capaz de me conectar com um motorista parceiro para agendar o transporte do meu pet. <br> <b>[US10]</b> Como motorista, quero ser capaz de me conectar com um cliente para transportar seu pet.| 
| <b>[EP02]</b> Gerenciamento de corridas | <b>[FEAT05]</b> Protocolos de viagem | <b>[US11]</b> Como motorista, quero ser capaz de visualizar a distância até o local de embarque do cliente para analisar a viabilidade da corrida. <br> <b>[US12]</b> Como motorista, quero ser notificado do pagamento da viagem para confirmar que receberei pelo serviço. <br> <b>[US13]</b> Como cliente, quero ser notificado do valor da corrida para verificar se possuo valor da viagem. |
| <b>[EP02]</b> Gerenciamento de corridas | <b>[FEAT06]</b> Feedback de viagem | <b>[US14]</b> Como usuário, quero ser capaz de visualizar o meu histórico de viagens para verificar as corridas realizadas e esclarecer eventuais dúvidas. <br> <b>[US15]</b> Como cliente, quero ser capaz de avaliar o motorista que fez a corrida para contribuir com a minha segurança e de outros pets, aumentando a confiabilidade. |

<br>

## Requisitos não funcionais

<br>

Os requisitos não funcionais (RNFs) definem os atributos do sistema, como segurança, confiabilidade, desempenho, capacidade de manutenção, usabilidade. Eles servem como restrições ou constrangimentos no design do sistema em diferentes pendências.

<br>

N° | Classificação | Requisitos Não Funcionais
:---------: |  :-------: |  :-------:
RNF01 | Requisitos de Implementação | A parte do Back-End do sistema deve ser desenvolvido em Dart/Flutter
RNF02 | Requisitos de Implementação | A parte do Front-End do sistema deve ser desenvolvido em Dart/Flutter
RNF03 | Requisitos de Implementação | O sistema deve ser desenvolvido em orientação a objetos
RNF04 | Requisitos de Portabilidade | A aplicação deve ser android mobile 
RFN05 | Requisitos de Usabilidade | A aplicação deve ser responsiva
RFN06 | Requisitos de Confiabilidade | O sistema deve funcionar 24/7
RFN07 | Requisitos Éticos | A aplicação deve ser segura em se tratando dos dados do usuário
RFN08 | Requisitos de Usabilidade | A interface da aplicação deve ser de fácil manipulação
RFN09 | Requisitos de Suportabilidade | O sistema deve ser testável em Dart/Flutter
RFN10 | Requisitos Legais | O produto final deve se adequar à Lei geral de proteção de dados (LGPD)

<br>

## MVP1

 - **Objetivo:** Oferecer as funcionalidades necessárias para conectar os usuários da plataforma promovendo o serviço de transporte.

  | Feature | Estimativa (Sprints) |
  |---------|----------------------|
  | [FEAT01] Perfil de usuário | 1 |
  | [FEAT04] Conectar usuários | 2 |
  | [FEAT05] Protocolos de viagem | 2 |

<br>

## MVP2

  - **Objetivo:** Prover as funcionalidades necessárias para os usuários gerenciarem o próprio perfil, viagens e acesso ao sistema, além da avaliação do motorista.

  | Feature | Estimativa (Sprints) |
  |---------|----------------------|
  | [FEAT02] Visualização de dados  | 1 |
  | [FEAT03] Autenticação de usuário  | 1 |
  | [FEAT06] Feedback de viagem | 1 |
  
<br>

## Referências 
- Material do moodle da disciplina
- [SAFe](https://www.scaledagileframework.com/#)
