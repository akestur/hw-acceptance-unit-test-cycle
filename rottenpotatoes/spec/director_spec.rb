require 'rails_helper'
require 'factory_girl_rails'

describe Movie do
    describe 'find similar movies' do
        let! (:m1) {FactoryGirl.create(:movie, title: "first movie", director: "first director")}
        let! (:m2) {FactoryGirl.create(:movie, title: "second movie", director: "second director")}
        let! (:m3) {FactoryGirl.create(:movie, title: "third movie", director: "first director")}
        it "filters similar movies correctly" do
            expect(Movie.similar_movies(m1.title)).to eql(["first movie", "third movie"])
            expect(Movie.similar_movies(m3.title)).to eql(["first movie", "third movie"])
            expect(Movie.similar_movies(m2.title)).to_not include(['first movie'])
        end
    end
end