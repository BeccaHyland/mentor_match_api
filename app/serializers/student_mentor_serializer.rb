class StudentMentorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :student_id,
             :mentor_id,
             :active

#  has_one :mentor, serializer MentorSerializer
#  has_one :student, serializer StudentSerializer
end