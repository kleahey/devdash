FactoryGirl.define do
  factory :meme do
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/meme.png', 'image/png')
  end
end
