class DataLoadService
  def load_data(data)
    transformed_data = DataTransformationService.new.transform_data(data)

    values = transformed_data.map { |record| "('#{record[:fullname].gsub("'", "''")}', '#{record[:email_address]}')" }.join(', ')

    create_table_if_not_exists('redshift_table')

    sql = "INSERT INTO redshift_table (fullname, email_address) VALUES #{values}"

    ActiveRecord::Base.connection.execute(sql)
  end

  private
  
  def create_table_if_not_exists(table_name)
    unless ActiveRecord::Base.connection.table_exists?(table_name)
      ActiveRecord::Migration.create_table(table_name) do |t|
        t.string :fullname
        t.string :email_address
      end
    end
  end

end
