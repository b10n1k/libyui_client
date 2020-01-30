# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require_relative 'lib/Vagrant_runner'

task :spec => [:vagrant_runner] do
  RSpec::Core::RakeTask.new(:spec)
end

task :vagrant_runner do
  VagrantRunner.new("default", "/home/test/boxes", "root")
end

