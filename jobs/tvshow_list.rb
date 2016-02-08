
   list1 = ['a', 'aa', 'bb']
   list3 = [3,1,2]
   list2 = {}

mydir = '/mnt/usbstorage/TV_Shows'
alu= Dir.entries(mydir).select {|entry| File.directory? File.join(mydir,entry) and !(entry =='.' || entry == '..') }

SCHEDULER.every '2s' do   

  # list3 = Hash.new({ value: 0 })
#r = list1.sample
 #  list2[r] = { label: r, value: list2[r][:value] }

  alu.each_with_index do |val, index| 
	list2[val] = { label: val, value: index}
  end

   send_event('tvshow_list', { items: list2.values })
end

