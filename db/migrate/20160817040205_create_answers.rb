class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :answer
      t.boolean :correct?, null: false, default: false

      t.timestamps
    end
  end
end