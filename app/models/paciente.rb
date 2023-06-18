class Paciente < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco
  has_many :consultas

  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d+\z/, message: "deve conter apenas números" }
  validates :data_nascimento, presence: true, date: { before_or_equal_to: -> { Date.current }, message: "não aceitamos viajantes do tempo" }
  validate :data_nascimento_valida

  private

  def data_nascimento_valida
    if data_nascimento.present? && data_nascimento.year > Date.current.year
      errors.add(:data_nascimento, "não aceitamos viajantes do tempo")
    end
  end
end
