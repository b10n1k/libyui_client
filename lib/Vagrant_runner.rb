require "cheetah"

=begin
Module with vagrant helping functions 
=end
module VagrantRunner
  class << self; attr_accessor :dir end
  #get it from conf?
  self.dir = '/home/test/libyui_client/boxes'

  # Run vagrant up from the vagrantfile directory
  def start_vm(box)
    @box = box
    #@dir = vagrant_dir
    puts "Vagrant up"
    Dir.chdir(self.dir) do
      puts Dir.pwd
      begin
        #TODO need to destroy the vm if it is up!
        Cheetah.run("vagrant", "halt", stdout: :capture)
        Cheetah.run("vagrant", "up", "--provision", stdout: :capture)
      rescue Cheetah::ExecutionFailed => e
        puts "Cheetah Error #{e.message}"
      end
    end
    puts "Vagrant running"
  end

  # Try to run a command in the vagrant box
  def run(cmd)
    puts "Vagrant run #{cmd}"
    Dir.chdir(self.dir) do
        puts Dir.pwd
        begin
          Cheetah.run("vagrant", "ssh", "default", "-c", "'"+cmd.to_s+"'", stdout: :capture)
        rescue Cheetah::ExecutionFailed => e
          puts "Cheetah Error #{e.message}"
        end
    end
  end
end

