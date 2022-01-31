class CreateTwitters < ActiveRecord::Migration[6.1]
  def change
    create_table :twitters do |t|

      t.timestamps
    end
  end
end
