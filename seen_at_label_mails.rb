require 'net/imap'

# Read .config
def read_settings(filename)
	settings = {}
	File.foreach(filename) do |line|
		keyAndValue = line.chomp.split('=')
		if (keyAndValue.length != 2)
			puts "Format Error : Invalid Config Files."
			exit
		end

		settings[keyAndValue[0]] = keyAndValue[1]
	end
	return settings
end

settings = read_settings('.config')
seen_target = ARGV[0]
if seen_target == nil
	puts "please input target label's name"
	exit
end

puts "Connect To IMAP Server ... "
imap = Net::IMAP.new('imap.gmail.com', :port=>993,
					 :ssl => {:verify_mode => OpenSSL::SSL::VERIFY_PEER,
			   			:timeout => 600
					})
puts "Try Login ... "
begin
	imap.login(settings["username"], settings["password"])
rescue => ex
	puts ex
	puts "Login Failed. Check Your User/Pass Settings."
	exit
end
puts "OK."

puts "Select Target Dir. [" << seen_target << "]"
begin
	imap.select(seen_target)
rescue => ex
	puts ex
	puts "Label " << seen_target << " really exist?"
	exit
end

puts "Retrive All Messages From " << seen_target
all_message_uids = imap.uid_search("all")

if (all_message_uids == [])
	puts "Messages already seems to be empty, so stopping scripts..."
	exit
end

puts "Retrive " << all_message_uids.length.to_s << " Mails"

puts "Try To Set Seen Flags."
fetchData = imap.uid_store(all_message_uids, "+FLAGS", [:Seen])

if (fetchData == nil)
	puts "Nothing updated. stopping scripts..."
	exit
end

puts fetchData.length.to_s << " item updated."
imap.check
imap.disconnect
