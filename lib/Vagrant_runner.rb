require "cheetah"

class VagrantRunner
  def initialize(box, vagrant_dir, username)
    @box = box
    @username = username
    @dir = vagrant_dir
puts "Vagrant up"
      Dir.chdir(@dir) do
        #with_env "VAGRANT_DEFAULT_PROVIDER" => "libvirt" do
        puts Dir.pwd
        begin
            Cheetah.run("vagrant", "up", "--provision", stdout: :capture)
        rescue Cheetah::ExecutionFailed => e
          puts "Cheetah Error #{e.message}"
        end
        #Cheetah.run "vagrant", "up", @box
       #end
      end
      puts "Vagrant running"
    end
  end


