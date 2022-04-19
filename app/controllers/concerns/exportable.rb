require "csv"

module Exportable
  extend ActiveSupport::Concern

  def export_csv
    headers = ["ID", "Descrição", "Finalizada", "ID da tarefa pai", "Criada em", "Atualizada em"]

    csv = CSV.generate(write_headers: true, headers: headers) do |row|
      Tarefa.all.each do |tarefa|
        row << [
          tarefa.id,
          tarefa.description,
          tarefa.done? ? "Sim" : "Não",
          tarefa.parent_id,
          I18n.l(tarefa.created_at, format: "%d/%m/%Y, %Hh%M"),
          I18n.l(tarefa.updated_at, format: "%d/%m%Y, %Hh%M"),
        ]
      end
    end

    send_data csv, type: "text/csv; charset=utf8; header=present",
                   disposition: "attachment; filename=tarefa.csv"
  end
end
