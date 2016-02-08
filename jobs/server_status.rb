check = 'running.'
online_stat = "Online"
offline_stat = "Offline"

SCHEDULER.every '1m' do

nginx = `service nginx status | awk \'{printf $3}\'`
sr = `service sickrage status | awk \'{printf $3}\'`
samba = `service samba status | grep "smbd" | awk \'{printf $3}\'`
txr = `service transmission-daemon status | awk \'{printf $3}\'`
ssh = `service ssh status | awk \'{printf $3}\'`



if nginx == check
	nginx_stat = online_stat
else
	nginx_stat = offline_stat
end

if sr == check
	sr_stat = online_stat
else
	sr_stat = offline_stat
end

if samba == check
	samba_stat = online_stat
else
	samba_stat = offline_stat
end

if txr == check
	txr_stat = online_stat
else
	txr_stat = offline_stat
end

if ssh == check
	ssh_stat = online_stat
else
	ssh_stat = offline_stat
end

send_event('nginxstatus', {text: nginx_stat} )
send_event('srstatus', {text: sr_stat} )
send_event('sambastatus', {text: samba_stat} )
send_event('txrstatus', {text: txr_stat} )
send_event('pistatus', {text: ssh_stat} )

end
