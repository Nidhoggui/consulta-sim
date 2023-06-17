json.extract! consultum, :id, :paciente_id, :medico_id, :data, :horario, :created_at, :updated_at
json.url consultum_url(consultum, format: :json)
