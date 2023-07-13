module Avro
    class Other
      include Avromatic::Model.build(schema_name: 'other')
      #include Avromatic::Model.build(schema: 'person')
    end
  end