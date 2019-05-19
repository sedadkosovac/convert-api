# frozen_string_literal: true

module Convert
  # Create Header
  class CreateHeader
    include Interactor

    def call
      context.header = header
      context.header_attr = header_attr
      return if header_attr.any?

      context.fail!(errors: { message: 'Create Header Fail!' })
    end

    private

    def header
      @header ||= header_attr.join(',')
    end

    def header_attr
      @header_attr ||= context.json_array
                              .flat_map(&:keys)
                              .uniq
    end
  end
end
