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

          field_hash = extract_fields(line)
          next if field_hash.delete('use') == 'UA'

          upsert_from_hash(field_hash)
        rescue StandardError => e
          logger&.error("Issue with COC #{field_hash['npa_nxx']}:")
          logger&.error(e.message)
          break
        end
      end

      private

      def extract_fields(line)
        values = line.split("\t").map { |value| value.strip.presence }
        FIELDS.zip(values).to_h
      end

      def upsert_from_hash(field_hash)
        normalized = CentralOfficeCode.new(field_hash)

        record = CentralOfficeCode.find_or_initialize_by(npa_nxx: normalized.npa_nxx)
        record.update!(normalized.attributes.slice(*FIELDS))
      end

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
