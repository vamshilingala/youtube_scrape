class CreateYoutubes < ActiveRecord::Migration[6.1]
  def change
    create_table :youtubes do |t|

      t.timestamps
    end
  end
end
