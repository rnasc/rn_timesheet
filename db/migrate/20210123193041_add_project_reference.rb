class AddProjectReference < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :project, index: true, foreign_key: true
  end
end
