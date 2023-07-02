Feature: Selecionar usuário através da página inicial

  As a usuário
  I want to ter uma página inicial com acesso às principais funcionalidades do sistema
  So that posso navegar facilmente e selecionar o tipo de usuário que desejo ser

  Scenario: Acessar a página inicial e selecionar o perfil de paciente
    Given Estou na página inicial
    When Clico no link "Paciente"
    Then Sou redirecionado para a página de pacientes

  Scenario: Acessar a página inicial e selecionar o perfil de médico
    Given Estou na página inicial
    When Clico no link "Médico"
    Then Sou redirecionado para a página de médicos