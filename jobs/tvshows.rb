SCHEDULER.every '1m' do

tvshows     = Dir["/mnt/usbstorage/TV_Shows/*"].length
movies      = Dir["/mnt/usbstorage/Movies/*"].length
downloading = Dir["/mnt/usbstorage/downloading/*"].length
completed   = Dir["/mnt/usbstorage/completed/*"].length

	send_event('tvshows', { current: tvshows })
	send_event('movies', {current: movies })
	send_event('downloading', {current: downloading })
	send_event('completed', {current: completed })
end
