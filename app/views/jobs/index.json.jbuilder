json.array!(@jobs) do |job|
  json.extract! job, :id, :school, :title, :job_description, :fte, :compensation_min, :compensation_max, :expiration
  json.url job_url(job, format: :json)
end
