module Email
  class Template < ApplicationRecord
    self.table_name = :email_templates

    def human_name
      type.sub("Email::", "").underscore.humanize
    end

    def fields
      text_attrs = instance_of?(GlobalSettings) ? [] : ["subject", "title"]
      attrs = text_attrs + rich_text_attribute_names
      attrs.map { |name|
        Field.new(
          name: name,
          rich_text: has_rich_text?(name)
        )
      }
    end

    def self.create_records
      [OverdueItems, HoldAvailable, GlobalSettings].each do |klass|
        find_or_create_by(type: klass.to_s)
      end
    end

    def rich_text_attribute_names
      self.class.reflect_on_all_associations(:has_one).collect { |association|
        name = association.name.to_s
        name.sub("rich_text_", "") if name.starts_with?("rich_text_")
      }.compact
    end

    def has_rich_text?(attribute)
      self.class.reflect_on_all_associations(:has_one).collect(&:name).any? { |name| name == :"rich_text_#{attribute}" }
    end
  end
end
