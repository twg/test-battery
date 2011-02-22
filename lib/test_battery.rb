module TestBattery
  
  module TestCase
    
    # Example usage:
    #   assert_has_errors_on( @record, [:field_1, :field_2] )
    #   assert_has_errors_on( @record, {:field_1 => 'Message1', :field_2 => 'Message 2'} )
    def assert_has_errors_on(record, fields)
      fields = [fields].flatten unless fields.is_a?(Hash)
      fields.each do |field, message|
        assert record.errors.has_key?(field.to_sym), "#{record.class.name} should error on invalid #{field}"
        if message && record.errors[field].is_a?(Array) && !message.is_a?(Array)
          assert_not_nil record.errors[field].index(message)
        elsif message
          assert_equal message, record.errors[field]
        end
      end
    end
  
    # Example usage:
    #   assert_exception_raised                                 do ... end
    #   assert_exception_raised ActiveRecord::RecordInvalid     do ... end
    #   assert_exception_raised Plugin::Error, 'error_message'  do ... end
    def assert_exception_raised(exception_class = nil, error_message = nil, &block)
      exception_raised = nil
      yield
    rescue => exception_raised
    ensure
      if exception_raised
        if exception_class
          assert_equal exception_class, exception_raised.class, exception_raised.to_s
        else
          assert true
        end
        assert_equal error_message, exception_raised.to_s if error_message
      else
        flunk 'Exception was not raised'
      end
    end
    
  end
end

ActiveSupport::TestCase.send :include, TestBattery::TestCase
