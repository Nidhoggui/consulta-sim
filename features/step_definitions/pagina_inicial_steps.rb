require 'capybara/cucumber'
Capybara.default_driver = :selenium

Given("Estou na página inicial") do
  visit 'http://0.0.0.0:3000/'
end

When("Clico no link {string}") do |link_text|
  click_link(link_text)
end

Then('Sou redirecionado para a página de pacientes') do
  expected_path = '/pacientes'
  actual_path = URI.parse(current_url).path

  if actual_path == expected_path
    puts "Passou! Sou redirecionado para a página de pacientes."
  else
    raise "Falhou! Esperava #{expected_path}, mas obtive #{actual_path}."
  end
end

Then('Sou redirecionado para a página de médicos') do
  expected_path = '/medicos'
  actual_path = URI.parse(current_url).path

  if actual_path == expected_path
    puts "Passou! Sou redirecionado para a página de médicos."
  else
    raise "Falhou! Esperava #{expected_path}, mas obtive #{actual_path}."
  end
end

