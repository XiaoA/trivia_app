# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.create!(team_name: 'Dubs', participants: ['Curry', 'Thomspson', 'Bogut', 'Green', 'Iggy'])
Team.create!(team_name: 'Shield', participants: ['Mackey', 'Shane', 'Lem', 'Ronnie'])
Team.create!(team_name: 'Fractured', participants: ['Rocky', 'Bullwinkle', 'Boris', 'Natasha', 'Sherman', 'Peabody' ])

# First Sample Question
Question.create!(id: 100, category: "history", question: "The longest war in history was between the Netherlands and the Isles of Scilly, which lasted from 1651 to 1986. How many people died in the war?", points: 1)

Answer.create!(answer: "none", correct: true, question_id: 100)
Answer.create!(answer: "10,000", correct: false, question_id: 100)
Answer.create!(answer: "400,000", correct: false, question_id: 100)
Answer.create!(answer: "1,000,000", correct: false, question_id: 100)

# Second Sample Question
Question.create!(id: 101, category: "history", question: "On what date did the US join World War 2?", points: 1)

Answer.create!(answer: "December 2, 1941", correct: true, question_id: 101)
Answer.create!(answer: "December 7, 1939", correct: false, question_id: 101)
Answer.create!(answer: "December 7, 1941", correct: true, question_id: 101)
Answer.create!(answer: "August 15, 1945", correct: false, question_id: 101)

# Third Sample Question

Question.create!(id: 102, category: "history", question: "Name the date Benjamin Franklin was born", points: 1)

Answer.create!(answer: "January 20, 1704", correct: false, question_id: 102)
Answer.create!(answer: "February 22, 1711", correct: false, question_id: 102)
Answer.create!(answer: "June 2, 1698", correct: false, question_id: 102)
Answer.create!(answer: "January, 17, 1706", correct: true, question_id: 102)

# Fourth Sample Question

Question.create!(id: 103, category: "sports", question: "Who holds the record for most home runs hit?", points: 1)

Answer.create!(answer: "Barry bonds, with 762", correct: true, question_id: 103)
Answer.create!(answer: "Hank Aaron, with 755", correct: false, question_id: 103)
Answer.create!(answer: "Babe Ruth, with 714", correct: false, question_id: 103)
Answer.create!(answer: "Willie Mays, with 660", correct: false, question_id: 103)

# Fifth Sample Question

Question.create!(id: 104, category: "sports", question: "Which of the following sports was *not* added to the 1964 Olympics?", points: 1)

Answer.create!(answer: "Men's Judo", correct: false, question_id: 104)
Answer.create!(answer: "Women's volleyball", correct: false, question_id: 104)
Answer.create!(answer: "Men's Kendo", correct: false, question_id: 104)
