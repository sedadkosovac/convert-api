require 'rails_helper'

RSpec.describe 'Convert API', type: :request  do
  let(:json_array) do
    {
      '_json' => [
        { 'name' => 'John Snow', 'age' => 29, 'height' => 180 },
        { 'name' => 'Iron Man', 'age' => 39, 'color' => 'green' }
      ]
    }
  end
  let(:csv) { "name,age,height,color\nJohn Snow,29,180,\nIron Man,39,,green\n" }

  describe 'POST /convert' do
    context 'when request attributes are valid' do
      before { post '/convert', params: json_array }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the data.csv' do
        expect(response.headers['Content-Type']).to eq('text/csv')
        expect(response.headers['Content-Disposition']).to eq('attachment; filename=data.csv')
        expect(response.body).to eq(csv)
      end
    end

    context 'when an invalid request' do
      before do
        post '/convert'
      end

      it 'returns json with error message' do
        expect(response.headers['Content-Type']).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)['errors']['message']).to eq('Bad Request')
      end

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end
end
