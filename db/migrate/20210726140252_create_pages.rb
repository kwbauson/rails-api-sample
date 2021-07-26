class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.belongs_to :post

      t.timestamps
    end
  end
end
