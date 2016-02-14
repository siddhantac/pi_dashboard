points_1 = []
points_5 = []
points_15 = []

(1..10).each do |i|
	points_1 << {x: i, y: 0}
	points_5 << {x: i, y: 0}
	points_15 << {x: i, y: 0}
end

last_x_1 = points_1.last[:x]
last_x_5 = points_5.last[:x]
last_x_15 = points_15.last[:x]

SCHEDULER.every '30s' do
	
	serverload_oneMin = `uptime | sed 's|.*load average: ||' | awk -F", " '{print $1}'`
	serverload_fiveMin =  `uptime | sed 's|.*load average: ||' | awk -F", " '{print $2}'`
	serverload_fifteenMin =  `uptime | sed 's|.*load average: ||' | awk -F", " '{print $3}'`
	
	points_1.shift
	points_5.shift
	points_15.shift

	last_x_1 += 1
	last_x_5 += 1
	last_x_15 += 1

	points_1 << {x: last_x_1, y: serverload_oneMin.to_f}
	points_5 << {x: last_x_5, y: serverload_fiveMin.to_f}
	points_15 << {x: last_x_15, y: serverload_fifteenMin.to_f}

	send_event('serverload_oneMin', points: points_1 )
	send_event('serverload_fiveMin', points: points_5 )
	send_event('serverload_fifteenMin', points: points_15 )
end
