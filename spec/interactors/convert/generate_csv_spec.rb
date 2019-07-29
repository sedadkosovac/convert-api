require 'rails_helper'

describe Convert::GenerateCsv do
  let(:json_array) do
    [
      { 'name' => 'John Snow', 'age' => 29, 'height' => 180 },
      { 'name' => 'Iron Man', 'age' => 39, 'color' => 'green' }
    ]
  end
  let(:csv) { "name,age,height,color\nJohn Snow,29,180,\nIron Man,39,,green\n" }
  let(:rows) { [['John Snow', 29, 180, nil], ['Iron Man', 39, nil, 'green']] }

  describe '.call' do
    context 'when given valid context' do
      before do
        @context = described_class.call(
          json_array: json_array,
          header: %w[name age height color],
          rows: rows
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
        @context = described_class.call(json_array: [])
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
