class CreateTarefas < ActiveRecord::Migration[7.0]
  def change
    create_table :tarefas do |t|
      t.string :description, null: false
      t.date :due_date
      t.boolean :done, default: false, null: false

      t.timestamps
    end
  end
end