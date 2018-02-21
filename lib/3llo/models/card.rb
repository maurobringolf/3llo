module Tr3llo
  class UserModel
    attr_reader :id, :name

    def initialize(properties)
      @id = properties.fetch("id")
      @name = properties.fetch("name")
      @properties = properties
    end

    def slug
      "C##{id[-6..-1]}"
    end
  end
end
