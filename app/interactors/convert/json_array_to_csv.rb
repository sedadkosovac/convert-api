module Convert
  class JsonArrayToCsv
    include Interactor::Organizer

    organize CreateHeader, CreateRows, GenerateCsv
  end
end
