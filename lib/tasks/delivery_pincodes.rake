namespace :delivery_pincodes do
  desc "Imports pincode from csv file."
  task import: :environment do
    require 'csv'
    data = []
	  CSV.foreach(Rails.root.join('public/uploads', 'shipment_pincodes.csv'), :headers => true) do |row|
      data << row.to_hash
    end
    p "Starting import"
    DeliveryPincode.import(data)
    p "Done!!"
  end
end
