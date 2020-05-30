module Puppet::Parser::Functions
  newfunction(:randompass, type: :rvalue, doc: <<-EOS
This function returns a random password
EOS
             ) do |_args|
    $length = 10
    $allowed = []
    ('!'..'Z').each { |c| $allowed << c }
    ('a'..'z').each { |c| $allowed << c }
    $allowed.delete('#')
    $allowed.delete(',')
    $allowed.delete('"')
    $allowed.delete('\'')
    value = ''
    $length.times { value << $allowed[rand($allowed.length)] }
    return value
  end
end
