module DeepDup
  def deep_dup(value)
    if value.is_a?(Array)
      value.map { |element| deep_dup(element) }
    elsif value.is_a?(Hash)
      value.transform_values { |value| deep_dup(value) }
    elsif value.respond_to?(:dup)
      value.dup
    else
      value
    end
  end
end