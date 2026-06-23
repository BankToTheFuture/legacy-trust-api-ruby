# frozen_string_literal: true

module LegacyTrust
  # Describes Bank resources
  module Bank
    class << self
      #
      # GET /banks
      #
      # - +opts+: hash that allows to enter :params, :body and :headers
      #
      # Options Hash (opts):
      #  - params: (Hash)
      #   - name (String)
      #   - swift_code (String)
      #
      def fetch_all(opts = {})
        result = LegacyTrust.request(:get, '/banks', opts)
        return result unless result.body.is_a?(Hash) && result.body.key?(:results)

        LegacyTrust::Result.new(status: result.status, body: result.body[:results])
      end
    end
  end
end
