require 'rails/generators'

class CrudControllerGenerator < Rails::Generators::Base
  
  source_root File.expand_path('../templates', __FILE__)
  argument :controller_name, :type => :string
  
  def generate_controller
    template 'crud_controller.rb',      "app/controllers/#{models}_controller.rb"
    template 'crud_controller_test.rb', "test/functional/#{models}_controller_test.rb"
  end
  
private
  
  def model
    @model ||= models.singularize
  end
  
  def models
    @models ||= controller_name.underscore
  end
  
  def model_class_name
    @model_class_name ||= model.camelize
  end
  
  def controller_class_name
    @controller_class_name ||= models.camelize
  end
end