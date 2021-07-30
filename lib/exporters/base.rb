module Exporters
  class Base
    def initialize(path)
      @path = path
    end

    def export(_songs)
      raise NotImplementedError
    end

    protected

    attr_reader :path
  end
end
