class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
