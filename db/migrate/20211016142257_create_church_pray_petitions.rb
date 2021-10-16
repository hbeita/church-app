class CreateChurchPrayPetitions < ActiveRecord::Migration[6.1]
  def change
    create_table :church_pray_petitions do |t|
      t.string :pray_for
      t.string :pray_from

      t.timestamps
    end
  end
end
