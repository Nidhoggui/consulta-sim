require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  def setup
    @medico = Medico.new(nome: "Dr. Mario", crm: "123456", cpf: "12345678900")
  end

  test "cpf should only contain numbers" do
    @medico.cpf = "12345abc"
    assert_not @medico.valid?
    assert_includes @medico.errors[:cpf], "deve conter apenas números"
  end

  test "nome should not be a number" do
    @medico.nome = "123"
    assert_not @medico.valid?
    assert_includes @medico.errors[:nome], "Lamentamos, mas não é possível cadastrar nenhum dos 7 monstrinhos no sistema."
  end
end
