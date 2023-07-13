require 'bundler/setup'
require_relative './custom/types/custom_regex'

Bundler.require

registry_url = 'http://localhost:8081'

Avromatic.configure do |avro|
  avro.schema_store = AvroTurf::SchemaStore.new(path: './contracts')
  avro.registry_url = registry_url
  
  avro.build_messaging!
end