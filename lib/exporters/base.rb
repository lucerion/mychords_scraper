# frozen_string_literal: true

module Exporters
  class Base
    def initialize(file_path)
      @file_path = file_path
    end

    def export(_songs)
      raise NotImplementedError
    end

    protected

    attr_reader :file_path
  end
end
