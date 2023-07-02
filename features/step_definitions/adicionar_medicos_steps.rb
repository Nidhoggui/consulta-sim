require 'capybara/cucumber'
Capybara.default_driver = :selenium

Given('Estou na página de médicos') do
  visit 'http://0.0.0.0:3000/medicos'
end

When('Clico em {string}') do |string|
  click_on string
end

Given('Estou na página de criação de médico') do
  visit 'http://0.0.0.0:3000/medicos/new'
end

Then('Sou redirecionado para a página de criação de médico') do
  expected_path = '/medicos/new'
  actual_path = URI.parse(current_url).path

  if actual_path == expected_path
    puts "Passou! Sou redirecionado para a página de criação de médico."
  else
    raise "Falhou! Esperava #{expected_path}, mas obtive #{actual_path}."
  end
end

When('Preencho o nome do médico com {string}') do |name|
  fill_in 'medico_nome', with: name
end

And('Preencho o CPF do médico com {string}') do |cpf|
  fill_in 'medico_cpf', with: cpf
end

And('Preencho o CRM do médico com {string}') do |crm|
  fill_in 'medico_crm', with: crm
end

And('Preencho o email do médico com {string}') do |email|
  fill_in 'medico_email', with: email
end

And('Preencho a especialidade do médico como {string}') do |especialidade|
  fill_in 'medico_especialidade', with: especialidade
end

