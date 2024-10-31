module UtilsFunctionsConcern
  extend ActiveSupport::Concern
  def convert_to_symbol_keys(hash)
    hash.transform_keys(&:to_sym).transform_values do |value|
      if value.is_a?(Hash)
        convert_to_symbol_keys(value)
      else
        value
      end
    end
  end
end
