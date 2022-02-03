module NANPA
  module COC
    class CentralOfficeCode < ApplicationRecord
      def npa_nxx=(val)
        super(val.gsub(/[^\d]/, ''))
      end

      def company=(val)
        super(val.gsub(/(^"|"\s*$)/, ''))
      end

      def effective_date=(val)
        super(parse_date(val))
      end

      def assign_date=(val)
        super(parse_date(val))
      end

      private

      def parse_date(str)
        return unless str.is_a?(String)

        Date.strptime(str, '%m/%d/%Y')
      end
    end
  end
end
