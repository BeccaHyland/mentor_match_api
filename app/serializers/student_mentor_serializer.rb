class StudentMentorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :student_id,
             :mentor_id,
             :active
end