class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :crest
      t.string :abbreviation
      t.string :slug
      t.string :crest
      t.timestamps
    end
  end
end
