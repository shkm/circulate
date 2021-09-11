module Email
  class GlobalSettings < Template
    has_rich_text :banner1
    has_rich_text :banner2
    has_rich_text :closing
    has_rich_text :footer

    def placeholder
      '<em style="color: lightgray;">content from template</em>'.html_safe
    end

    alias_method :prebody, :placeholder
    alias_method :body, :placeholder
    alias_method :postbody, :placeholder
    alias_method :title, :placeholder
  end
end
