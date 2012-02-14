module CoreExt
  module Object
    module NamedAccessor
      extend ActiveSupport::Concern

      module ClassMethods
        def named_accessor(name, options={})
          method_name, variable = options.delete(:as), name

          define_method method_name do
            instance_variable_get :"@#{variable}"
          end
        end
      end
    end
  end
end