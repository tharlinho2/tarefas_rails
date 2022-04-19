class TarefasController < ApplicationController
  include Exportable

  before_action :set_tarefa, only: %i[ edit update destroy ]

  # GET /tarefas or /tarefas.json
  def index
    @tarefas = Tarefa.only_parents.order(:due_date)
  end

  # GET /tarefas/new
  def new
    @tarefa = Tarefa.new
  end

  # GET /tarefas/1/edit
  def edit
  end

  # POST /tarefas or /tarefas.json
  def create
    @tarefa = Tarefa.new(tarefa_params)

    if @tarefa.save
      redirect_to tarefas_path, notice: "Tarefa foi criada com sucesso."
    else
      flash.now[:alert] = @tarefa.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tarefas/1 or /tarefas/1.json
  def update
    if @tarefa.update(tarefa_params)
      redirect_to tarefas_path, notice: "Tarefa foi atualizada com sucesso."
    else
      flash.now[:alert] = @tarefa.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tarefas/1 or /tarefas/1.json
  def destroy
    @tarefa.destroy

    redirect_to tarefas_url, notice: "Tarefa deletada com sucesso."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tarefa
    @tarefa = Tarefa.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tarefa_params
    params.require(:tarefa).permit(:description, :due_date, :done, :parent_id)
  end
end
