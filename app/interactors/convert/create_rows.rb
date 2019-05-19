# frozen_string_literal: true

module Convert
  # Create Rows
  class CreateRows
    include Interactor

    def call
      context.rows = rows
      return if rows.any?

      context.fail!(errors: { message: 'Create CSV Rows Fail!' })
    end

    private

    def rows
      rows = []
      context.json_array.each do |json_hash|
        row = []
        context.header_attr.each do |key|
          row << json_hash[key]
        end
        rows << row
      end
      rows
    end
  end
end
