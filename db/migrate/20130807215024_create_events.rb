class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :date
      t.datetime :end_date

      t.belongs_to :company
      t.timestamps
    end
  end
end
