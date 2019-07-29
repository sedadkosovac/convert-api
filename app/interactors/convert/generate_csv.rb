# frozen_string_literal: true

require 'csv'
module Convert
  # Generate Csv
  class GenerateCsv
    include Interactor

    def call
      context.csv = csv
    rescue NoMethodError
      context.fail!(errors: { message: 'Generate CSV Fail!' })
    end

    private

    def csv
      @csv ||= CSV.generate(headers: true) do |csv|
        csv << context.header
        context.rows.each do |row|
          csv << row
        end
      end
    end
  end
end
