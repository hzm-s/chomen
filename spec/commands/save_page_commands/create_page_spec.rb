require 'rails_helper'

describe SavePageCommands::CreatePage do
  describe '#run' do
    it do
      command = described_class.new('GPID', 'CHUNK')
      command.run
      page = Page.last
      chunk = page.chunks.last

      aggregate_failures do
        expect(page.gpid).to eq('GPID')
        expect(chunk.gcid).to_not be_nil
        expect(chunk.content).to eq('CHUNK')
      end
    end
  end
end
