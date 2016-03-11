# spec/factories/movie.rb

FactoryGirl.define do
  factory :job do
    school 'A Fake Title' # default values
    title 'PG'
    summary 'not good'
    compensation_min '0'
    compensation_max '10000'
    expiration '2016'
  end
end