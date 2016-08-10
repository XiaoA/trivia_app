class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.text :participants, array: true, default: []
      t.references :user

      t.timestamps
    end
  end
end
