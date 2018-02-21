module Tr3llo
  class BoardModel
    attr_reader :id, :name

    def initialize(properties)
      @id = properties.fetch("id")
      @name = properties.fetch("name")
    end

    def slug
      "B##{id[-6..-1]}"
    end
  end
end
