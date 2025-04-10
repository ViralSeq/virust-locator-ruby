# Module to run the Locator executable
# frozen_string_literal: true

module VirustLocator
  # This module provides a method to run the Locator executable based on the platform
  # and architecture of the system. It determines the appropriate executable file
  # to use and constructs the command to run it with the provided arguments.
  #
  # @example
  #   Locator.exec("GAAAGCATAGTAATATGGGGAAAGACTCCTAAA")
  #   => "3681\t3713\t100\tfalse\tGAAAGCATAGTAATATGGGGAAAGACTCCTAAA\tGAAAGCATAGTAATATGGGGAAAGACTCCTAAA"
  module Locator
    def self.exec(query, type = "nt", algorithm = "1", ref = "HXB2") # rubocop:disable Metrics/MethodLength
      file = case RUBY_PLATFORM
             when /arm64-darwin/
               "virust-locator-aarch64-apple-darwin"
             when /x86.*darwin/
               "virust-locator-x86_64-apple-darwin"
             when /cygwin|mswin|mingw|bccwin|wince|emx/
               "virust-locator-x86_64-pc-windows-gnu.exe"
             when /x86.*linux/
               "virust-locator-x86_64-unknown-linux-gnu"
             when /aarch64.*linux/
               "virust-locator-aarch64-unknown-linux-gnu"
             else
               raise "Unsupported platform: #{RUBY_PLATFORM}"
             end

      file = File.join(File.dirname(__FILE__), "runnable", file)
      safe_file = Shellwords.escape(file)
      raise "Excecutable file not found: #{file}" unless File.exist?(file)

      `#{safe_file} -q #{Shellwords.escape(query)} -t #{Shellwords.escape(type)} -a #{Shellwords.escape(algorithm)} -r #{Shellwords.escape(ref)}`.strip # rubocop:disable Layout/LineLength
    end
  end
end
