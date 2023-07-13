module Custom 
    module Types
        class CustomRegex
            def to_avro(msg)
                puts "Inside of to_avro"
                raise "oh si!"
            end

            def from_avro(msg)
                puts "Inside of from_avro"
                raise "oh si!"
            end
        end 
    end
end