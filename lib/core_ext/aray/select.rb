module CoreExt
  module Array
    module Select
      extend ActiveSupport::Concern

      def select_qt_than(n, method = :self)
        select_with_sign n, method, :>
      end

      def select_lt_than(n, method = :self)
        select_with_sign n, method, :<
      end


    private

      def select_with_sign(n = 0, method = :self, sign = :==)
        raise 'Incorrect sign. Must be :>, :< or :==' unless [:>, :<, :==].include? sign

        select do |o|
          o = o.send(method) unless method == :self
          o.try sign, n
        end
      end
    end
  end
end