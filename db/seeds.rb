PROJECT_TITLES = 10.times.map { Faker::Internet.domain_word}

SPLIT = 0.4
OFFSET = PROJECT_TITLES.length * SPLIT

PROJECT_USERS = {
  'small@taco.com' => PROJECT_TITLES[0, OFFSET],
  'big@burrito.com' => PROJECT_TITLES[OFFSET..-1]
}

PROJECT_USERS.each do |email, projects|
  user = User.new(email: email, password: 'secret')
  projects.each { |title| user.projects.build(title:title)}
  user.save
end
