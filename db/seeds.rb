# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

front = Category.create!(title: 'Frontend')
back = Category.create!(title: 'Backend')
mach = Category.create!(title: 'MachineLearning')
other = Category.create!(title: 'Others')
tests = Test.create!([
                        { title: 'Ruby', level: 1, category_id: back.id },
                        { title: 'Ruby', level: 2, category_id: back.id },
                        { title: 'JS', level: 1, category_id: front.id },
                        { title: 'JS', level: 2, category_id: front.id },
                        { title: 'Python', level: 1, category_id: mach.id },
                        { title: 'Python', level: 2, category_id: mach.id },
                        { title: 'Common', level: 1, category_id: other.id },
                        { title: 'Common', level: 2, category_id: other.id }
                     ])
user = User.create!({ name: 'User', age: 30, sex: 'male' })
tests.each do |test|
  user.tests << test
  2.times do |i|
    quest = Question.create!(body: "№ #{i + 1}. Вопрос по #{test.title} уровень #{test.level}", test_id: test.id)
    Answer.create!(body: "Ответ на вопрос № #{i + 1} про #{test.title}, уровня #{test.level}", question_id: quest.id)
  end
end
