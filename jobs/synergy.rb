SCHEDULER.every '2s' do

  temp = `/home/pi/Desktop/dashing/proj2/jobs/temperature.sh`

   send_event('synergy', { value: temp })
end

