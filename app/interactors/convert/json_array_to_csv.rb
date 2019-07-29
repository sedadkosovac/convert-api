# frozen_string_literal: true

module Convert
  # Json Array to Csv
  class JsonArrayToCsv
    include Interactor::Organizer

    organize CreateHeader, CreateRows, GenerateCsv
  end
end
