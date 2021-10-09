require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    render_views
    
    describe 'Index Page' do
        it 'Data populates properly in the index page' do
            Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'})
            get :index
            expect(response).to be_successful
            expect(response.body).to include("Aladdin")
        end
    end
    
    describe 'Sorting' do
        it 'Should sort the movies alphabetically' do
            Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'})
            Movie.create({:title => 'The Incredibles', :rating => 'PG', :release_date => '05-Nov-2004'})
            get :index, :sort => 'title'
            expect(response).to be_successful
            expect(response.body).to include("Aladdin")
            expect(response.body).to include("The Incredibles")
            expect(response.body.index("Aladdin") < response.body.index("The Incredibles"))
        end
    end
end
