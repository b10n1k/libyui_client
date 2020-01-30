module Vagrant_runner
  class VagrantRunner
    def initialize(box, vagrant_dir, username)
      @box = box
      @username = username
      @dir = vagrant_dir
puts "Vagrant up"
     # Dir.chdir(@dir) do
     #   with_env "VAGRANT_DEFAULT_PROVIDER" => "libvirt" do
     #     Cheetah.run "vagrant up", @box
     #   end
     # end
    end
  end
end


