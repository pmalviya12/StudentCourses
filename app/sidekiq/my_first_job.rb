class MyFirstJob
  include Sidekiq::Job

  def perform(name, grade)
    puts "Hi My name is #{name}, and my grade is #{grade}"
  end
end
