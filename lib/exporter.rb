# frozen_string_literal: true

require 'forwardable'
require_relative './exporters/file'

class Exporter
  extend Forwardable

  DEFAULT_EXPORTER = Exporters::File

  def_delegators :@exporter, :export

  def initialize(path, exporter = DEFAULT_EXPORTER)
    @exporter = exporter.new(path)
  end
end
