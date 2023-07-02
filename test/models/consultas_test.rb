require "test_helper"

class ConsultasTest < ActiveSupport::TestCase
  setup do
    @consulta = consultas(:one) # Substitua ":one" pelo nome de uma consulta existente nos fixtures
  end

  test "should create consulta" do
    assert_difference("Consulta.count") do
      puts "Valores dos parâmetros:"
      puts "Data: #{consulta_params[:data]}"
      puts "Horário: #{consulta_params[:horario]}"
      puts "ID do Médico: #{consulta_params[:medico_id]}"
      puts "ID do Paciente: #{consulta_params[:paciente_id]}"

      post consultas_path, params: { consulta: consulta_params }
    end

    assert_redirected_to consultas_path(Consulta.last)
  end

  private

  def consulta_params
    {
      data: "2023-06-17",
      horario: "2023-06-17 05:41:40",
      medico_id: medicos(:one).id,
      paciente_id: pacientes(:one).id
    }
  end
end
