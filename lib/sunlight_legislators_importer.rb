require_relative '../app/models/politician'
require 'csv'

class SunlightLegislatorsImporter
  def self.import(filename)
    atrribute_array = Politician.columns.map(&:name)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      attribute_hash = Hash.new
      row.each do |field, value|
         attribute_hash[field.to_sym]= value  if atrribute_array.include?(field)
      end
      Politician.create!(attribute_hash)
    end
  end
end
