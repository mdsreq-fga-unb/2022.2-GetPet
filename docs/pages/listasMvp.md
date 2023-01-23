# Listas MVPs

## Lista do MVP1

| Feature | User Story | Critério de Aceitação |
|---------|------------|-----------------------| 
| <b>[FEAT01]</b> Perfil de usuário <br> | <b>[US01]</b> Como cliente, quero ser capaz de realizar meu cadastro para utilizar os serviços de transporte. | 1. O aplicativo não deve permitir o cadastro de um cliente se o CPF e o Email já estiverem em uso por outro cliente. <br> 2. O cliente pode ter apenas um cadastro. |
|      | <b>[US02]</b> Como motorista, quero ser capaz de realizar meu cadastro para oferecer o meu serviço de transporte. | 1. O aplicativo não deve permitir o cadastro de um motorista se o CPF e o Email já estiverem em uso por outro motorista. <br> 2. O motorista pode ter apenas um cadastro. |
|      | <b>[US03]</b> Como cliente, quero ser capaz de editar o meu perfil para manter os meus dados atualizados. | 1. O cliente deve conseguir visualizar todas as informações atuais contidas em seu perfil antes realizar qualquer edição. <br> 2. Quando o cliente atualiza seu perfil, ele deve conseguir editar todos os campos, exceto o campo de CPF. | 
|      | <b>[US04]</b> Como motorista, quero ser capaz de editar o meu perfil para manter os meus dados atualizados. | 1. O motorista deve conseguir visualizar todas as informações atuais contidas em seu perfil antes realizar qualquer edição. <br> 2. Quando o motorista atualiza seu perfil, ele deve conseguir editar todos os campos, exceto o campo de CPF.|
| <b>[FEAT04]</b> Conectar usuários | <b>[US09]</b> Como cliente, quero ser capaz de agendar uma corrida para transportar o meu pet. | 1. Ao agendar uma corrida, o cliente deve selecionar uma das duas opções de modalidade disponíveis: ida, ida e volta ou ida e volta com espera. <br> 2. A data e o horário do agendamento devem ser posteriores à data e ao horário da solicitação. <br> 3. O cliente só poderá agendar uma nova corrida depois que a corrida agendada anteriormente for concluída. |
|      | <b>[US10]</b> Como motorista, quero ser capaz receber solicitações de corrida para realizar o transporte dos clientes. | 1. As informações da corrida devem ser exibidas para o motorista na solicitação da corrida.
| <b>[FEAT05]</b> Protocolos de viagem | <b>[US11]</b> Como motorista, quero ser capaz de visualizar a distância até o local de embarque do cliente para analisar a viabilidade da corrida. | 1. O motorista deve visualizar a distância até o local de embarque do cliente antes de aceitar a corrida. <br> 2. A unidade de medida utilizada para exibir a distância deve ser quilômetros (km). | 
|      | <b>[US13]</b> Como cliente, quero ser capaz de verificar o valor da corrida para confirmar se tenho o valor necessário disponível. | 1. O card de visualização do valor da corrida deve ser exibido de forma clara, para que o cliente possa o identificar facilmente. <br> 2. O valor da corrida deve ser calculado em reais. |

<br>

## Lista do MVP2

| Feature | User Story | Critério de Aceitação |
| ------- | ---------- | --------------------- |
|[FEAT02] Visualização de dados |[US05] Como motorista, quero ser capaz de visualizar o perfil de quem irei transportar para compreender as necessidades da pessoa e do pet. | 1 - Motorista precisa ter um perfil cadstrado <br> 2 - O Motorista precisa receber chamados |
|         | [US06] Como cliente, quero ser capaz de visualizar o perfil do motorista para conhecer quem irá transportar meu pet.| 1 - Cliente precisa ter um perfil cadastrado <br> 2 - Cliente precisa fazer o chamado do motorista |
| [FEAT03] Autenticação de usuário | [US07] Como usuário, quero ser capaz de realizar login com email e senha para ter privacidade e segurança ao utilizar os serviços do aplicativo. | 1 - Usuário deve adicionar um e-mail válido, caso contrário, o app deve sinalizar que o e-mail é inválido. <br> 2 - Todos os campos devem ser obrigatórios |
|        | [US08] Como usuário, quero ser capaz de recuperar o acesso para me autenticar caso esqueça a senha. | 1 - O usuário precisa possuir um cadastro <br> 2 - O usuário precisa ter um e-mail válido, caso contrário, o app deve sinalizar que o e-mail é inválido. <br> |
| [FEAT06] Feedback de viagem | [US14] Como usuário, eu quero ter um histórico de corridas realizadas para revisar detalhes das corridas que realizei e esclarecer qualquer dúvida que eu possa ter. | 1 - Usuário precisa ter realizado/solicitado corridas <br> 2 - O app precisa mostrar todas as corridas |
|        | [US15] Como cliente, eu quero ser capaz de avaliar o motorista da minha corrida para contribuir com a segurança de outros passageiros, a fim de aumentar a confiabilidade. | 1 - O Cliente precisa completar uma corrida <br> 2 - O app precisa fornecer uma avaliação até 5 estrelas |
| **Débito Técnico** [FEAT05] Protocolos de viagem | [US12] Como motorista, quero ser capaz de confirmar se recebi o pagamento da viagem para efetivar a contratação do serviço. | 1 - O card de confirmação do pagamento deve ser exibido de forma clara, para que o motorista possa o identificar facilmente e confirmar. <br> 2 - O Card deve incluir: Valor, Data e Hora do pagamento |