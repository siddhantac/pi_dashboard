
SCHEDULER.every '5s' do
	
	temp = `/home/pi/Desktop/dashing/proj2/jobs/temperature.sh`
	mem_full = `free -om | grep "Mem:" | awk \'{print $2}'`
	mem_used = `free -m | awk 'NR==3' | awk \'{print $3}'`

	#Use free from cached
	mem_free = `free -m | awk 'NR==3' | awk \'{print $4}'`

	send_event('temperature', value: temp)
	send_event('memory', value: mem_used) 
end
