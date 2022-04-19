class Tarefa < ApplicationRecord
  validates :description, presence: true

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

  private

  def status
    return "done" if done?

    due_date.past? ? "expired" : "pending"
  end
end
