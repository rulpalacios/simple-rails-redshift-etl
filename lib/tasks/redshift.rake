namespace :redshift do
  task test_connection: :environment do
    require 'pg'
    
    puts "Testing Redshift connection..."

    redshift_config = {
      
      host: Rails.application.credentials.redshift.host,
      port: 5439,
      dbname: Rails.application.credentials.redshift.database,
      user: Rails.application.credentials.redshift.username,
      password: Rails.application.credentials.redshift.password
    }

    begin
      connection = PG.connect(redshift_config)

      if connection.status == PG::CONNECTION_OK
        puts "Redshift connection successful"
      else
        puts "Redshift connection failed"
      end
    rescue PG::Error => e
      puts "An error occurred while trying to connect to Redshift: #{e.message}"
    ensure
      connection&.close
    end
  end
end
