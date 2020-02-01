#
# Stack Types
#

StackType.where(name: 'application_and_data').first_or_create
StackType.where(name: 'utilities').first_or_create
StackType.where(name: 'devops').first_or_create
StackType.where(name: 'business_tools').first_or_create

stack_types = StackType.all

#
# Techs
#
tech_stacks = {
  circleci_techs: {
    'application_and_data': [
      'MongoDB',
      'PostgreSQL',
      'Redis',
      'Clojure',
      'R',
      'Pandas',
      'Go'
    ],
    'utilities': [
      'Segment',
      'Looker'
    ],
    'devops': [
      'GitHub',
      'Git',
      'Docker',
      'Helm'
    ],
    'business_tools': [
      'Slack',
      'Jira',
      'Zoom'
    ]
  },
  digital_ocean_techs: {
    'application_and_data': [
      'MySQL',
      'Redis',
      'Ruby',
      'Ruby On Rails',
      'Kafka'
    ],
    'utilities': [
      'Looker',
      'Stripe'
    ],
    'devops': [
      'Github',
      'Docker',
      'Kubernetes',
      'Consul'
    ],
    'business_tools': [
      'Slack',
      'Jira'
    ]
  }
}

tech_stacks.each do |_, techs|
  techs.each do |stack_name, techs|
    stack_type = StackType.where(name: stack_name).first
    techs
      .reject { |name| Tech.exists?(name: name) }
      .each do |name|
        Tech.create(
          name: name,
          description: Faker::Hipster.sentence,
          logo: '',
          stack_type: stack_type
        )
      end
  end
end

#
# Projects
#

#
# Mr Jumbo
#

if(!Project.exists?(name: "Mr Jumbo"))
  mr_jumbo = Project.create(
    name: "Mr Jumbo",
    description: Faker::Hipster.paragraph,
    logo: 'https://camo.githubusercontent.com/7f1361787d02b3421009acde58839761d796449e/68747470733a2f2f6172617361746173617967696e2e6769746875622e696f2f6f70656e6c6f676f732f6c6f676f732f6d722d6a756d626f2e6a7067'
  )

  stack_types.each do |stack_type|
    stack = Stack.create(stack_type: stack_type, project: mr_jumbo)
    stack.techs << stack_type.techs.sample(rand(0..6))
  end
end

#
# Hangry Birds
#

if(!Project.exists?(name: "Hangry Birds"))
  hangry_birds = Project.create(
    name: "Hangry Birds",
    description: Faker::Hipster.paragraph,
    logo: 'https://camo.githubusercontent.com/be1bbc0fb3b494ec8f6338e6969f4ea975eb43b3/68747470733a2f2f6172617361746173617967696e2e6769746875622e696f2f6f70656e6c6f676f732f6c6f676f732f68616e6772792d62697264732e6a7067'
  )

  stack_types.each do |stack_type|
    stack = Stack.create(stack_type: stack_type, project: hangry_birds)
    stack.techs << stack_type.techs.sample(rand(0..6))
  end
end
