class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[show edit update destroy]

  # GET /pacientes or /pacientes.json
  def index
    @pacientes = Paciente.all
  end

  # GET /pacientes/1 or /pacientes/1.json
  def show
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
    @paciente.build_endereco
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes or /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully created." }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1 or /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully updated." }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1 or /pacientes/1.json
  def destroy
    @paciente.destroy

    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: "Paciente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def agendar_consulta
    @paciente = Paciente.find(params[:paciente_id])
    @consulta = @paciente.consultas.build(consulta_params)
    @consulta.medico_id = params[:consult][:medico_id] # Associa o médico selecionado à consulta

    if @consulta.save
      redirect_to @paciente, notice: "Consulta agendada com sucesso."
    else
      render :show, alert: "Não foi possível agendar a consulta."
    end
  end

  private

  def consulta_params
    params.require(:consult).permit(:data, :horario, :medico_id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def paciente_params
    params.require(:paciente).permit(:nome, :data_nascimento, :cpf, :email, endereco_attributes: [:cep, :cidade, :bairro, :logradouro, :complemento])
  end
end
