class CreateSocialnetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :socialnetworks do |t|
      t.string :data_collected

      t.timestamps
    end
  end
end
