produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  selected_fruit = {}
  produce_items = produce.keys
  counter = 0

  loop do
    break if counter == produce_items.size

    item = produce_items[counter]
    category = produce[item]

    if category == 'Fruit'
      selected_fruit[item] = category
    end

    counter += 1
  end
  selected_fruit
end

p select_fruit(produce)
