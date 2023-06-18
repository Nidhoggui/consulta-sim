class Endereco < ApplicationRecord
  belongs_to :paciente

  validates :logradouro, presence: true
  validates :cidade, presence: true
  validates :cep, presence: true
end
