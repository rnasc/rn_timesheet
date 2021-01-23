class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :begin
      t.date :end

      t.timestamps
    end
  end
end
