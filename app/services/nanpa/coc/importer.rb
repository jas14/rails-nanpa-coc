# frozen_string_literal: true

module NANPA
  module COC
    class Importer
      FIELDS = %w[
        state
        npa_nxx
        ocn
        company
        rate_center
        effective_date
        use
        assign_date
        initial_growth
        pooled
        in_service
      ].freeze

      def initialize(file_path:, logger: default_logger)
        @file_path = file_path
        @logger = logger
      end

      def run!
        File.foreach(file_path).with_index do |line, line_num|
          next if line_num.zero? # header

          values = line.split("\t").map { |value| value.strip.presence }
          field_hash = FIELDS.zip(values).to_h
          next if field_hash.delete('use') == 'UA'

          normalized = CentralOfficeCode.new(field_hash)

          record = CentralOfficeCode.find_or_initialize_by(npa_nxx: normalized.npa_nxx)
          record.update!(normalized.attributes.slice(*FIELDS))
        rescue StandardError => e
          logger&.error("Issue with COC #{field_hash['npa_nxx']}:")
          logger&.error(e.message)
          break
        end
      end

      private

      def parse_date(str)
        return nil unless str

        Date.strptime(str, '%m/%d/%Y')
      end

      def default_logger
        Logger.new($stdout)
      end

      attr_reader :file_path, :logger
    end
  end
end
