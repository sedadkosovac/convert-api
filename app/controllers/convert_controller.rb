# frozen_string_literal: true

# Convert Controller
class ConvertController < ApplicationController
  def create
    @result = Convert::JsonArrayToCsv.call(json_array: json_array)
    raise JSON::ParserError if @result.failure?

    send_data(
      @result.csv,
      type: 'text/csv; header=present',
      disposition: 'attachment; filename=data.csv'
    )
  rescue JSON::ParserError
    render json: { errors: { message: 'Bad Request' } }, status: :bad_request
  end

  private

  def json_array
    @json_array ||= JSON.parse(request.raw_post)
  end
end
