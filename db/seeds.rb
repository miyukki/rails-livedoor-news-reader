categories = YAML.load(File.open(Rails.root.join('config', 'categories.yml')))
Category.create(categories)
