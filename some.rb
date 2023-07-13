require 'bundler/setup'
require_relative './custom/types/custom_regex'
Bundler.require

registry_url = 'http://localhost:8081'
#messaging = AvroTurf::Messaging.new(registry_url: registry_url)

Avromatic.configure do |avro|
  avro.schema_store = AvroTurf::SchemaStore.new(path: './contracts')
  #avro.schema_store = AvroTurf::Messaging.new(registry_url: "http://localhost:8081/")
  avro.registry_url = registry_url
  #avro.register_type('com.example.regexp', Custom::Types::CustomRegex)
  
  avro.register_type('foobar', String) do |type|
    type.from_avro = ->(value) do 
      raise "oh no!"
      puts "value"
      value.upcase 
    end
    type.to_avro = ->(value) { value.downcase }
  end

  Avromatic.register_type('handshake', String) do |type|
    type.from_avro = ->(value) { value.downcase }
    type.to_avro = ->(value) { value.downcase }
  end
  
  avro.build_messaging!
end