check = 'running.'
online_stat = "Online"
offline_stat = "Offline"

online_color = "teal darken-1"
offline_color = "red darken-3"

ssh_online_color = "indigo darken-3"
ssh_offline_color = "red darken-4"

SCHEDULER.every '5m' do

nginx = `service nginx status | awk \'{printf $3}\'`
sr = `service sickrage status | awk \'{printf $3}\'`
samba = `service samba status | grep "smbd" | awk \'{printf $3}\'`
txr = `service transmission-daemon status | awk \'{printf $3}\'`
ssh = `service ssh status | awk \'{printf $3}\'`



if nginx == check
	nginx_stat = online_stat
	nginx_color = online_color
else
	nginx_stat = offline_stat
	nginx_color = offline_color
end

if sr == check
	sr_stat = online_stat
	sr_color = online_color
else
	sr_stat = offline_stat
	sr_color = offline_color
end

if samba == check
	samba_stat = online_stat
	samba_color = online_color
else
	samba_stat = offline_stat
	samba_color = offline_color
end

if txr == check
	txr_stat = online_stat
	txr_color = online_color
else
	txr_stat = offline_stat
	txr_color = offline_color
end

if ssh == check
	ssh_stat = online_stat
	ssh_color = ssh_online_color
else
	ssh_stat = offline_stat
	ssh_color = ssh_offline_color
end

send_event('nginxstatus', {text: nginx_stat, status: nginx_color} )
send_event('srstatus', {text: sr_stat, status: sr_color} )
send_event('sambastatus', {text: samba_stat, status: samba_color} )
send_event('txrstatus', {text: txr_stat, status: txr_color} )
send_event('pistatus', {text: ssh_stat, status: ssh_color} )

end
