class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :status_type
      t.timestamps
    end
  end
end
