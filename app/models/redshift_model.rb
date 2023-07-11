class RedshiftModel < ApplicationRecord
  self.table_name = 'redshift_table'

  establish_connection :redshift_development
end
