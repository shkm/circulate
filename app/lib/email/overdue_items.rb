module Email
  class OverdueItems < Template
    has_rich_text :prebody
    has_rich_text :body
    has_rich_text :postbody
  end
end
