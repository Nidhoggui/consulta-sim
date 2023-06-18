json.extract! consulta, :id, :paciente_id, :medico_id, :data, :horario, :created_at, :updated_at
json.url consulta_url(consulta, format: :json)
