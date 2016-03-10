json.array!(@jobs) do |job|
  json.extract! job, :id, :school, :title, :summary, :compensation_min, :compensation_max, :exipiration
  json.url job_url(job, format: :json)
end
