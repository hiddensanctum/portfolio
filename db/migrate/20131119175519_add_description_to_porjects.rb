class AddDescriptionToPorjects < ActiveRecord::Migration
  def change
    add_column :projects, :description, :textfield
  end
end
