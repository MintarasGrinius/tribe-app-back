# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || 'is not a valid email') unless
      value =~ /^(([^<>()\[\].,;:\s@"]+(\.[^<>()\[\].,;:\s@"]+)*)|(".+"))@(([^<>()\[\].,;:\s@"]+\.)+[^<>()\[\].,;:\s@"]{2,})$/i
  end
end
