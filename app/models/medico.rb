class Medico < ApplicationRecord
  has_many :consultas
  has_many :pacientes, through: :consultas

  validates :nome, presence: true, length: { minimum: 2 }, format: { without: /\A\d+\z/, message: "Lamentamos, mas não é possível cadastrar nenhum dos 7 monstrinhos no sistema (deve conter letras no nome)." }
  validates :crm, presence: true, uniqueness: true, length: { is: 6, message: "O CRM deve conter 6 caracteres." }
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d+\z/, message: "deve conter apenas números" }, length: { is: 11, message: "O CPF deve conter 11 caracteres." }
end
