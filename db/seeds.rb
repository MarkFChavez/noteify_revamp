user = User.new email: "los_populares@yahoo.com"
user.password = "foobar123"
user.save!

user.notes.create! title: "Slow database test fallacy", content: "A good practice is to always isolate tests, do not load rails and other."
