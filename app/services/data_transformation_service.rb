class DataTransformationService
  def transform_data(data)
    transformed_data = []

    data.each do |user|
      transformed_record = {
        fullname: "#{user.name} #{user.last_name}",
        email_address: user.email,
      }

      transformed_data << transformed_record
    end

    transformed_data
  end
end