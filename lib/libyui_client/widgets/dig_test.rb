#require "hash_dig_and_collect"


class Array
  def find_all_for(key)
    results = []
    puts ">>>#{results}"
    puts "slef is #{self}"
    self.each do |x|
      puts "x now #{x}"
      #puts "with values #{x.values}"
      next if (!x.is_a? Array) && (!x.is_a? Hash)
      next if x.values.nil?
      
      #next if x
      results += [ x.dig(key) ].flatten 
      puts " show cur  #{results}"
      puts " have values first #{x.values.first}"
      puts (!x.values.first.nil?) && (x.values.first.is_a? Array)
      results += (x.values.first).find_all_for(key) if (!x.values.first.nil?) && (x.values.first.is_a? Array)
    end 
    results.compact
  end
end

items = [
  {
    "children":
     [
       {
         "icon_name": "icon",
        "label": "node1_1"
       },
       {
         "children": [
                       {
                         "label": "node_1_2_1"
                       },
                       {
                         "label": "node_1_2_2",
                        "selected": true
                       }
                     ],
        "icon_name": "icon",
        "label": "node1_2"
       }
     ],
  },
  {
    "icon_name": "icon",
   "label": "node1",
  },
  {
    "icon_name": "icon",
   "label": "node2"
  }
]
items2= [
  {
    "labels": [
                "test.item.1",
                "",
                "",
                ""
              ],
   "selected": true
  },
  {
    "labels": [
                "test.item.2",
                "",
                "",
                ""
              ]
  }
]
items3= [
  {
    "label": "tab1"
  },
  {
    "label": "tab2",
   "selected": true
  },
  {
    "label": "tab3"
  }
]
puts items3.find_all_for(:label).to_s
