class CreateMemes < ActiveRecord::Migration[6.1]
  def change
    create_table :memes do |t|
      t.string :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
