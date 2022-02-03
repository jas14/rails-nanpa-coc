module NANPA
  module COC
    class CentralOfficeCode < ApplicationRecord
      def npa_nxx=(val)
        super(val.gsub(/[^\d]/, ''))
      end
    end
  end
end
