require 'serverspec'

set :backend, :exec

describe command("git lfs") do
  its(:exit_status) { should eq 0 }
end
