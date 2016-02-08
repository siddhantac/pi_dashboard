points = []
(1..10).each do |i|
	points << {x: i, y: 0}
end

last_x = points.last[:x]

SCHEDULER.every '1m' do
	
	serverload = `uptime | awk '{print $8}'`
	points.shift
	last_x += 1
	points << {x: last_x, y: serverload.to_f}

	send_event('serverload', points: points )
end
