Feature: Adicionar novos médicos

  As a administrador
  I want to adicionar novos médicos no sistema fornecendo suas informações básicas como nome, cpf, crm e especialidade
  So that eles sejam cadastrados e utilizem o sistema

  Scenario: Adicionar novo médico
    Given Estou na página de médicos
    When Clico em "New medico"
    Then Sou redirecionado para a página de criação de médico

  Scenario: Preencher informações do novo médico
    Given Estou na página de criação de médico
    When Preencho o nome do médico com "Dr. João"
    And Preencho o CPF do médico com "12345678901"
    And Preencho o CRM do médico com "123456"
    And Preencho o email do médico com "medico@example.com"
    And Preencho a especialidade do médico como "Cardiologia"
    And Clico em "Create Medico"



