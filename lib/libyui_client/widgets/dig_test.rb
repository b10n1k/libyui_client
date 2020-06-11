require "hash_dig_and_collect"

client_with_many_addresses = {
  details: {
    first_name: "Florentino",
    last_name: "Perez"
  },
  addresses: [
    {
      type: "home",
      postcode: "SE1 9SG",
      street: "London Bridge St",
      number: 32,
      city: "London",
      location: {
        latitude: 51.504382,
        longitude: -0.086279
      }
    },
    {
      type: "office",
      postcode: "SW1A 1AA",
      street: "Buckingham Palace Road",
      number: nil,
      city: "London",
      location: {
        latitude: 51.5013673,
        longitude: -0.1440787
      }
    }
  ]
}
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
line_items = {
  item_a: {
    name: "Cookie",
    total: 13
  },
  department_x: {
    item_b: {
      name: "s",
      total: 7
    }
  },
  items: [
    {
      name: "H",
      total: 8
    },
    {
      name: "Q",
      total: 9
    }
  ]
}
#puts line_items.find_all_for(:total)
items = [
           {
             "children": [
               {
                 "icon_name": "icon",
                 "label": "node1_1"
               },
               {
                 "children": [
                   {
                     "label": "node1_2_1"
                   },
                   {
                     "label": "node1_2_2",
                     "selected": true
                   }
                 ],
                 "icon_name": "icon",
                 "label": "node1_2"
               }
             ],
             "icon_name": "icon",
             "label": "node1",
           },
           {
             "icon_name": "icon",
             "label": "node2"
           }
         ]
#puts items.map { |d| d.find_all_for(:label) }
