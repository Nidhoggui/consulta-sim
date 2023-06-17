class Paciente < ApplicationRecord
  has_one :endereco, :dependent => :destroy
  accepts_nested_attributes_for :endereco
  has_many :consultas
end
