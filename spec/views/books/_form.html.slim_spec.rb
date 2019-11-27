require 'rails_helper'

describe 'form' do
  before { render partial: 'books/form', locals: { book: book } }
  let(:book) { build :ebook }

  describe 'container' do
    it 'renders a container' do
      expect(rendered).to have_css('.form-group .dropzone-container')
    end

    it 'has some bootstrap classes' do
      expect(rendered).to have_css('.dropzone-container.img-thumbnail')
    end
  end

  describe 'overlay' do
    it 'renders an overlay' do
      expect(rendered).to have_css('.dropzone-container .dropzone-overlay')
    end

    it 'has some bootstrap classes' do
      expect(rendered).to have_css('.dropzone-overlay.d-flex.justify-content-center.align-items-center')
    end

    it 'has an `add` button' do
      expect(rendered).to have_css('.dropzone-overlay a.btn-float.btn.btn-sm.shadow-none.uploader-action.text-light')
      expect(rendered).to have_css('.dropzone-overlay a i.material-icons', text: 'add_photo_alternate')
    end

    it 'has an `remove` button' do
      expect(rendered).to have_css('.dropzone-overlay a.btn-float.btn.btn-sm.shadow-none.uploader-action.text-light.ml-3')
      expect(rendered).to have_css('.dropzone-overlay a i.material-icons', text: 'close')
    end

    it 'has a backdrop' do
      expect(rendered).to have_css('.dropzone-overlay .dropzone-backdrop')
    end
  end

  it 'has an image' do
    expect(rendered).to have_css('.dropzone-container img')
  end

  it 'has a file input' do
    expect(rendered).to have_css('.dropzone-container input[accept="image/*"][type="file"][name="book[cover]"]')
  end

  it 'has a remove field' do
    expect(rendered).to have_css('.dropzone-container input[type="hidden"][name="book[remove_cover]"]', visible: false)
  end

  describe 'Stimulus' do
    subject { rendered }

    it { is_expected.to have_css('.dropzone-container[data-controller="dropzone"]') }
    it { is_expected.to have_css('.dropzone-overlay a[data-action="dropzone#browse"]', text: 'add_photo_alternate') }
    it { is_expected.to have_css('.dropzone-overlay a[data-action="dropzone#removeImage"][data-target="dropzone.removeButton"]', text: 'close') }
    it { is_expected.to have_css('.dropzone-container img[data-target="dropzone.previewImage"]') }
    it { is_expected.to have_css('.dropzone-container input[type="file"][data-target="dropzone.fileInput"][data-action="dropzone#handleImage"]') }
    it { is_expected.to have_css('.dropzone-container input[type="hidden"][data-target="dropzone.removeCover"]', visible: false) }
  end
end