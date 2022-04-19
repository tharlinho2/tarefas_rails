class AddParentIdColumnToTarefas < ActiveRecord::Migration[7.0]
  def change
    add_reference :tarefas, :parent, foreign_key: { to_table: :tarefas }
  end
end
