class Rule < ApplicationRecord
    belongs_to :ruling, polymorphic: true, dependent: :destroy

    def discount_show_path
        "rules_#{discount_type_string}discount_path"
    end

    private

    def discount_type_string
        ruling_type.partition('::').last.downcase.gsub!('discount', '_')
    end
end
