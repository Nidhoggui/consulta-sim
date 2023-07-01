class Paciente < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco
  has_many :consultas
  has_many :medicos, through: :consultas

  validates :nome, presence: true, length: { minimum: 2 }, format: { without: /\A\d+\z/, message: "Lamentamos, mas não é possível cadastrar nenhum dos 7 monstrinhos no sistema." }
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d+\z/, message: "deve conter apenas números" }, length: { is: 11, message: "O CPF deve conter 11 caracteres." }
  validate :data_nascimento_valida

  private

  def data_nascimento_valida
    if data_nascimento.present? && data_nascimento > Date.current
      errors.add(:data_nascimento, "não aceitamos viajantes do tempo")
    end
  end
end
