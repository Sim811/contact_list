@contacts = [
  { name: "Sam", phone: "801-222-4444" },
  { name: "Milo", phone: "801-666-1212" }
]



def main_menu
  puts "-- Ruby Contact List --"
  puts "1) View Contacts"
  puts "2) Add Contact"
  puts "3) Edit Contact"
  puts "4) Delete Contact"
  puts "5) Exit"
  input = gets.to_i
  
  case input
  when 1
    show_contacts
  when 2
    add_contact
  when 3
    edit_contact
  when 4
    delete_contact
  when 5
    exit 
  else
    puts "Invalid Function"
    main_menu
  end
  end

def show_contacts
  puts "--My Contacts--"
  @contacts.each_with_index do |contact, phone|
  puts "#{contact} #{phone}"
  end
  
end

def add_contact
  puts "--Add Contact--"
  puts "Name"
  print ">"
  userhash=Hash.new()
puts "Enter first number"
userhash[:name]=gets.chomp.to_f
puts "Enter 2nd number"
userhash[:phone]=gets.chomp.to_f
puts "The New Contact "
userhash.each_value {|value| puts value}
puts " #{userhash.each_value.inject(:+)}"

  main_menu
end

def edit_contact
  show_contacts
  puts
  puts "Which contact do you wish to update?"
  puts
  print "> "
  contact = @contacts[gets.to_i - 1]  
  
  puts "Update Contact: #{contact[:name]} - #{contact[:phone]}"
  puts
  print "What do you want to update the name to? (Hit ENTER to keep original name)"
  print "> "
  input = gets.strip
  input == "" ? nil : contact[:name] = input  

  puts "Update Contact: #{contact[:name]} - #{contact[:phone]}"
  puts 
  print "What do you want to update the phone number to? (Hit ENTER to keep original phone number)"
  print "> "
  input = gets.strip
  input == "" ? nil : contact[:phone] = input  
  puts "Contact #{contact[:name]} has been updated. "
  main_menu

end

def delete_contact
  show_contacts
  puts
  puts "Which contact do you wish to delete?"
  puts
  print "> "
  index = gets.to_i - 1
  contact = @contacts[index]  
  print "Are you sure you want to delete #{contact[:name]}? "
  puts "(y / n)"
  puts
  print "> "
  gets.strip == "y" ? nil : main_menu
  @contacts.delete_at(index)  
  puts "#{contact[:name]} has been deleted. "
  main_menu
  
end

main_menu