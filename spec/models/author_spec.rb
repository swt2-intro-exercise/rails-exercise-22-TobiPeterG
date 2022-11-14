require 'rails_helper'

RSpec.describe Author, type: :model do
  it "should have first name, last name and homepage vars" do
    first_name = "Alan"
    last_name = "Turing"
    homepage = "http://wikipedia.org/Alan_Turing"
  author = Author.new(first_name: first_name,last_name: last_name,homepage: homepage)
  expect(author.first_name).to eq(first_name)
  expect(author.last_name).to eq(last_name)
  expect(author.homepage).to eq(homepage)
  expect(author.name).to eq("Alan Turing")
  end
  it "should be invalid without last name" do
    author = Author.new(first_name: 'Alan', last_name: '', homepage: 'http://wikipedia.org/Alan_Turing')
        expect(author).to_not be_valid
  end
end
