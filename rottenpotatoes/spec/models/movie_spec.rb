require 'rails_helper'

RSpec.describe Movie, type: :model do
    describe 'Check data consistency for director field' do
        it 'If there is a director return movies with that director' do
            movie1 = Movie.create({:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas'})
            movie2 = Movie.create({:title => 'THX-1138', :rating => 'R', :director => 'George Lucas'})
            directors = Movie.with_director(movie1.director)
            expect(directors).not_to be_empty
            expect(directors.size()).to be 2
        end
        it 'If there is no director return nil' do
            movie1 = Movie.create({:title => 'Alien', :rating => 'R'})
            directors = Movie.with_director(movie1.director)
            expect(directors).to be nil
        end
    end
end