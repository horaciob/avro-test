require 'bundler/setup'
require_relative './custom/types/custom_regex'

Bundler.require

registry_url = 'http://localhost:8081'

Avromatic.configure do |avro|
  avro.schema_store = AvroTurf::SchemaStore.new(path: './contracts')
  avro.registry_url = registry_url

  avro.register_type('foobar', String) do |type|
    type.from_avro = ->(value) do 
      raise "oh no!"
      puts "value"
      value.upcase 
    end
    type.to_avro = ->(value) { value.downcase }
  end
  
  avro.build_messaging!
end