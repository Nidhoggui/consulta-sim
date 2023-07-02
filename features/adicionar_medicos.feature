Feature: Adicionar novos médicos

  As a administrador
  I want to adicionar novos médicos no sistema fornecendo suas informações básicas como nome, cpf, crm e especialidade
  So that eles sejam cadastrados e utilizem o sistema

  Scenario: Adicionar novo médico
    Given Estou na página de médicos
    When Clico em "Adicionar Médico"
    Then Sou redirecionado para a página de criação de médico

  Scenario: Preencher informações do novo médico
    Given Estou na página de criação de médico
    When Preencho o nome do médico com "Dr. João"
    And Preencho o CPF do médico com "12345678901"
    And Preencho o CRM do médico com "12345"
    And Seleciono a especialidade do médico como "Cardiologia"
    And Clico em "Salvar"
    Then Vejo a mensagem de sucesso "Médico criado com sucesso"


