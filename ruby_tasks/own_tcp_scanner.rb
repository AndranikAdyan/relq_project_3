require 'msf/core'

class MetasploitModule < Msf::Auxiliary
	include Msf::Auxiliary::Scanner

	def initialize(info = {})
		super(update_info(info,
			'Name'			=> 'TCP port scanner',
			'Description'	=> 'Scan port on targer host',
			'Author'		=> 'Andranik Adyan',
			'License'		=> MSF_LICENSE
		))

		register_options(
			[
				Opt::RHOSTS(),
				Opt::RPORT(80, true)
			]
		)

		deregister_options('THREADS')
	end

	def connect_to_host(host, port)
		sock = Rex::Socket::Tcp.create(
			'PeerHost'	=> host,
			'PeerPort'	=> port,
			'Context'	=> {"Msf" => framework}
			)
		print_good("#{host}:#{port} is open!")
		sock.close()
	end

	def run()
		rhost = datastore["RHOSTS"]
		rport = datastore["RPORT"]
		
		print_status("Target host: #{rhost}")
		print_status("Target port: #{rport}")

		begin
			print_status("Try to connect #{rhost}:#{rport}")
			connect_to_host(rhost, rport)
		rescue => e
			print_error("Failed to connect to #{rhost}:#{rport} - #{e}")
		end
	end
end
