class Tarefa < ApplicationRecord
  validates :description, presence: true
  validates :done, inclusion: { in: [true, false] }

  belongs_to :parent, class_name: "Tarefa", optional: true
  has_many :sub_tarefas, class_name: "Tarefa", foreign_key: :parent_id, dependent: :destroy

  scope :only_parents, -> { where(parent_id: nil) }

  def symbol
    case status
    when "pending" then "»"
    when "done" then "✓"
    when "expired" then "x"
    end
  end

  def css_color
    case status
    when "pending" then "primary"
    when "done" then "success"
    when "expired" then "danger"
    end
  end

  def parent?
    parent_id.nil?
  end

  def sub_tarefas?
    !parent?
  end

  private

  def status
    return "done" if done?

    due_date.past? ? "expired" : "pending"
  end
end
