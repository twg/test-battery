Test Battery
============

Collection of generators and help methods 

Install
-------

In your Gemfile:
    
    group :development, :test do
      gem 'test_battery'
    end
    
Generators
----------

Controller Crud Generator:
    
    rails g battery_controller kittens
    
Test Helpers
------------

### assert\_has\_errors_on
    assert_has_errors_on( @record, [:field_1, :field_2] )
    assert_has_errors_on( @record, {:field_1 => 'Message1', :field_2 => 'Message 2'} )
    
### assert\_exception\_raised
    assert_exception_raised                                 do ... end
    assert_exception_raised ActiveRecord::RecordInvalid     do ... end
    assert_exception_raised Plugin::Error, 'error_message'  do ... end
    