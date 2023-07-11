namespace :redshift do
  task etl: :environment do
    data = DataExtractionService.new.extract_data
    DataLoadService.new.load_data(data)
    puts "ETL process finished"
  end
end