# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Story.create({ image_url: 'assets/stories/images/helloworld.jpg', body_url: 'assets/stories/text/helloworld.html',
# 				summary: 'This is a mother loving summary with all of you mother loving needs.', 
# 				title: 'HELLO WORLD', source: 'Nick Redmond Enterprises' })

theStory = Story.first
theStory.update_attribute(:image_url, 'stories/helloworld.jpg')