module Tr3llo
  class UserModel
    attr_reader :id, :name, :username

    def initialize(properties)
      @id = properties.fetch("id")
      @username = properties.fetch("username")
      @name = properties.fetch("fullName", @username)
    end

    def slug
      "@#{username}"
    end
  end
end
