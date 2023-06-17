class AddPacienteToEndereco < ActiveRecord::Migration[7.0]
  def change
    add_reference :enderecos, :paciente, foreign_key: true
  end
end
