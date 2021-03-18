# Client ( parent )
client_01 = User.create(
  name: 'client 01',
  email: 'client01@gmail.com',
  password: '12345678'
)
client_01.device_tokens.create(
  token: 'token 001'
)

client_02 = User.create(
  name: 'client 02',
  email: 'client02@gmail.com',
  password: '12345678'
)

client_02.device_tokens.create(
  token: 'token 002'
)


# Teacher
teacher = User.create(
  name: 'teacher 01',
  email: 'teacher01@gmail.com',
  password: '12345678'
)
school_class = teacher.school_classes.create(
  name: 'Math for beginner'
)

# Client join school classes
UserSchoolClass.create(
  user_id: client_01.id,
  school_class_id: school_class.id,
  role: 'parent'
)

UserSchoolClass.create(
  user_id: client_02.id,
  school_class_id: school_class.id,
  role: 'parent'
)

# Activity
Activity.create(
  name: 'Camping for kids',
  school_class_id: school_class.id,
  user_id: teacher.id
)