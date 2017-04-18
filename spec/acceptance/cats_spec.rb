require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Cats" do
  let(:picture) { Rack::Test::UploadedFile.new("spec/fixtures/cat.png", "image/png") }
  let!(:cat) { Cat.create(name: "Test Cat", picture: picture) }

  get "cats/random" do
    example "Get random cat" do
      do_request
      expect(JSON.parse(response_body)["name"]).to eq "Test Cat"
    end
  end

  post "cats" do
    parameter :name, "Name of cat", required: true
    parameter :picture, "Picture of cat", required: true

    example "Post a new cat" do
      do_request(
        "cat[picture]" => Rack::Test::UploadedFile.new("spec/fixtures/cat.png", "image/png"),
        "cat[name]" => "Opomuc"
      )
    end
  end
end
