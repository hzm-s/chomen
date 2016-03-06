require 'rails_helper'

describe 'Home' do
  let(:content) { chunk_form(1).first('textarea').text }

  context 'no pages' do
    it do
      visit root_path
      expect(content).to eq('')
    end
  end

  context 'page exists' do
    it do
      page1 = create_page('PAGE1', 1, 'CHUNK')
      page2 = create_page('PAGE2', 1, 'CHUNK')

      update_chunk(page1.chunk(1).gcid, 'LAST UPDATE')

      visit root_path
      expect(content).to have_content('LAST UPDATE')
    end
  end
end
