module Email
  class Field
    attr_reader :name

    def initialize(name:, rich_text:)
      @name = name
      @rich_text = rich_text
    end

    def rich_text?
      @rich_text
    end
  end
end
