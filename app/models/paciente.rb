class Paciente < ApplicationRecord
  has_one :endereco
  has_many :consultas
end
