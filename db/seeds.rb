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
user = User.create!({ name: 'Tom', email: 'tom@email.com', age: 36, sex: 'male' })
user2 = User.create!({ name: 'Jeary', email: 'jeary@email.com', age: 30, sex: 'male' })
tests = Test.create!([
                        { title: 'Ruby beginer', level: 0, category_id: back.id, author_id: user.id },
                        { title: 'Ruby beginer plus', level: 1, category_id: back.id, author_id: user2.id },
                        { title: 'Ruby intermediate', level: 2, category_id: back.id, author_id: user.id },
                        { title: 'Ruby intermediate plus', level: 3, category_id: back.id, author_id: user2.id },
                        { title: 'Ruby pro', level: 5, category_id: back.id, author_id: user.id },
                        { title: 'Ruby pro plus', level: 10, category_id: back.id, author_id: user2.id },
                        { title: 'JS for dummy', level: 0, category_id: front.id, author_id: user.id },
                        { title: 'JS beginer', level: 1, category_id: front.id, author_id: user2.id },
                        { title: 'JS', level: 2, category_id: front.id, author_id: user2.id },
                        { title: 'JS', level: 4, category_id: front.id, author_id: user.id },
                        { title: 'JS', level: 7, category_id: front.id, author_id: user.id },
                        { title: 'JS', level: 9, category_id: front.id, author_id: user2.id },
                        { title: 'Python', level: 1, category_id: mach.id, author_id: user.id },
                        { title: 'Python', level: 2, category_id: mach.id, author_id: user.id },
                        { title: 'Common', level: 1, category_id: other.id, author_id: user2.id },
                        { title: 'Common', level: 2, category_id: other.id, author_id: user.id }
                     ])
tests.each do |test|
  user.tests << test if test.level.even?
  user2.tests << test if test.level.odd?
  2.times do |i|
    quest = Question.create!(body: "№ #{i + 1}. Вопрос по #{test.title} уровень #{test.level}", test_id: test.id)
    Answer.create!(body: "Ответ на вопрос № #{i + 1} про #{test.title}, уровня #{test.level}", question_id: quest.id)
  end
end
