module Email
  class HoldAvailable < Template
    def prebody
      tag.div(class: "whatever") do
        tag.p @items.size
      end
    end
  end
end
