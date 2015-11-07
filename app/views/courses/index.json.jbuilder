json.array!(@courses) do |course|
  json.extract! course, :id, :subject, :course_number, :title
  json.url course_url(course, format: :json)
end
