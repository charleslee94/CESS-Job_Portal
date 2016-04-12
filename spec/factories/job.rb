# spec/factories/movie.rb

FactoryGirl.define do
  factory :job do
    school 'A Fake Title' # default values
    title 'PG'
    job_description 'not good'
    fte '1'
    compensation_min '0'
    compensation_max '10000'
    expiration DateTime.new(2017,9,1,19)
  end
end