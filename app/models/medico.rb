class Medico < ApplicationRecord
  has_many :consultas
  has_many :pacientes, through: :consultas

  validates :nome, presence: true
  validates :crm, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d+\z/, message: "deve conter apenas números" }
end
