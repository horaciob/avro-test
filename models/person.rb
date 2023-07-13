# app/models/avro/user.rb
module Avro
  class Person
    include Avromatic::Model.build(schema_name: 'person')
    #include Avromatic::Model.build(schema: 'person')
  end
end
