require 'bundler/setup'
Bundler.require
require_all './custom/types'

registry_url = 'http://localhost:8081'

Avromatic.configure do |avro|
  avro.schema_store = AvroTurf::SchemaStore.new(path: './contracts')
  avro.registry_url = registry_url

  avro.register_type('handshake') do |type|
    type.from_avro = ->(value) { value.downcase }
    type.to_avro = ->(value) { value.downcase }
  end
  
  avro.build_messaging!
end

require_all 'models'