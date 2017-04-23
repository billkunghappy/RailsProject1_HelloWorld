class CreatePersonalInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_infos do |t|
    	t.string :name
    	t.integer :age
    	t.string :description
    	t.timestamps
    end
  end
end
