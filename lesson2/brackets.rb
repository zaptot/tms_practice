# valid
# ([(asdf)]qwer()()())


# [({[]}){}]
# |
# stack: [

# [({[]}){}]
#  |
# stack: [, (

# [({[]}){}]
#   |
# stack: [, (, {

# [({[]}){}]
#    |
# stack: [, (, {, [

# [({[]}){}]
#     |
# stack: [, (, {

# [({[]}){}]
#      |
# stack: [, (

# [({[]}){}]
#       |
# stack: [

# [({[]}){}]
#        |
# stack: [, {

# [({[]}){}]
#         |
# stack: [

# [({[]}){}]
#          |
# stack:


# )()()()

arr = [1]
arr.push(3) #  => [1, 3]
arr.pop # => [1]

h1 = { 'key1' => 'value1', key2: 'value2' }

h1['key1'] #=> 'value1'
h1[:key1] #=> nil
h1['key2'] #=> nil
h1[:key2] #=> 'value2'

# invalid
# ((aaa)()()()
# asdfasf(eedf))qwer
# s)sd(f

def valid?(str)
  brackets_mapping = { ')' => '(', ']' => '[', '}' => '{' }
  stack = []

  str.each_char do |bracket|
    if ['(', '[', '{'].include?(bracket)
      stack.push(bracket)
    elsif [')', ']', '}'].include?(bracket)
      return false if stack.size == 0
      return false if brackets_mapping[bracket] != stack.last

      stack.pop
    end
  end

  stack.size == 0
end
