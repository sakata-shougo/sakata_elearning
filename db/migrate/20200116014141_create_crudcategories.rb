class CreateCrudcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :crudcategories do |t|

      t.timestamps
    end
  end
end
