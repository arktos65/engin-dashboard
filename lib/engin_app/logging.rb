require 'active_support/core_ext/string'
require 'set'
require 'http_logger'

module EnginApp
  class Logging
    attr_accessor :debug_mode, :http_logging, :output_file
    attr_reader :options

    DEFINED_OPTIONS = [
      :debug_mode,
      :http_logging,
      :log_file
    ].freeze

    DEFAULT_OPTIONS = {
      http_logging: true,
      log_file: '/tmp/engin-http.log'
    }.freeze

    # This method is called when instantiating the ProductBoard::Logging object.
    def initialize(options = {})
      options = DEFAULT_OPTIONS.merge(options)
      @options = options

      unknown_options = options.keys.reject { |o| DEFINED_OPTIONS.include?(o) }
      raise ArgumentError, "Unknown option(s) given: #{unknown_options}" unless unknown_options.empty?

      self.start if options[:http_logging]
    end

    protected

    # This method enables the HTTP logging to the location specified in :log_file option.
    def start
      HttpLogger.logger = Logger.new(@options[:log_file])
      HttpLogger.log_headers = true
    end
  end
end
