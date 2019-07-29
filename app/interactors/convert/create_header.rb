# frozen_string_literal: true

module Convert
  # Create Header
  class CreateHeader
    include Interactor

    def call
      context.header = header
      raise NoMethodError if header.blank?
    rescue NoMethodError
      context.fail!(errors: { message: 'Create Header Fail!' })
    end

    private

    def header
      @header ||= context.json_array
                         .flat_map(&:keys)
                         .uniq
    end
  end
end
