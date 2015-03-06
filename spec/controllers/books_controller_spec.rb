require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  render_views

  context "Index" do
    it 'should respond to index' do
      get :index
      expect(response.status).to eql(200)
    end

    it 'should display a book name' do
      #setup
      book = Book.create!(name:'Test Book')
      #action
      get :index
      #verify
      expect(response.body).to include(book.name)
    end
  end
end
