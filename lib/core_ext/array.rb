require 'core_ext/aray/tail'
require 'core_ext/aray/select'

class Array
  include CoreExt::Array::Tail
  include CoreExt::Array::Select
end