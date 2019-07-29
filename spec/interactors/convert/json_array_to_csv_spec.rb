require 'rails_helper'

describe Convert::JsonArrayToCsv do
  let(:json_array) do
    [
      { 'name' => 'John Snow', 'age' => 29, 'height' => 180 },
      { 'name' => 'Iron Man', 'age' => 39, 'color' => 'green' }
    ]
  end
  let(:csv) { "name,age,height,color\nJohn Snow,29,180,\nIron Man,39,,green\n" }

  describe '.call' do
    context 'when given valid context' do
      before do
        @context = described_class.call(
          json_array: json_array
        )
      end

      it 'succeeds' do
        expect(@context).to be_a_success
      end

      it 'generates csv' do
        expect(@context.csv).to eq(csv)
      end
    end

    context 'when given invalid context' do
      before do
        @context = described_class.call(json_array: nil)
      end

      it 'fails' do
        expect(@context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(@context.errors).to be_present
      end
    end
  end
end
