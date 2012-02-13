module CoreExt
  module Array
    module Tail
      def tail
        self[1..-1]
      end

      alias_method :rest, :tail
    end
  end
end