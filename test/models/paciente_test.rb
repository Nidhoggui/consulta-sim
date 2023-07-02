require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  def setup
    @paciente = pacientes(:one)
  end

  test "should not be valid with a future data_nascimento" do
    @paciente.data_nascimento = Date.tomorrow
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:data_nascimento], "não aceitamos viajantes do tempo"
  end

  test "should not be valid with a duplicate cpf" do
    other_paciente = pacientes(:two)
    @paciente.cpf = other_paciente.cpf
    assert_not @paciente.valid?
    assert_includes @paciente.errors[:cpf], "já está em uso"
  end
end
