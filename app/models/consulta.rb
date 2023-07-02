class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value <= Date.current
      record.errors.add(attribute, "deve ser posterior à data atual")
    end
  end
end

class Consulta < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico

  validates :data, presence: true
  validates :data, date: { after: -> { Date.current }, message: "deve ser posterior à data atual" }
  validates :horario, presence: true
  validates :medico_id, presence: true
  validates :paciente_id, presence: true
end
