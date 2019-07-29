# frozen_string_literal: true

module Convert
  # Create Rows
  class CreateRows
    include Interactor

    def call
      context.rows = rows
      raise NoMethodError if rows.blank?
    rescue NoMethodError
      context.fail!(errors: { message: 'Create CSV Rows Fail!' })
    end

    private

    def rows
      @rows ||= context.json_array.map do |json_hash|
        context.header.flat_map { |key| json_hash[key] }
      end
    end
  end
end
