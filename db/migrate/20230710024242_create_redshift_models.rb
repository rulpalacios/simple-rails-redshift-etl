class CreateRedshiftModels < ActiveRecord::Migration[7.0]
  def change
    create_table :redshift_models do |t|

      t.timestamps
    end
  end
end
