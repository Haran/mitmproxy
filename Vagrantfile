# -*- mode: ruby -*-
# vi: set ft=ruby :
$vm_memory     = 4096
$vm_cpus       = 2
$mitm_verison  = "5.3.0"

Vagrant.configure("2") do |config|

    # CentOS 7.8.2003
    config.vm.box = "centos/7"
    config.vm.box_version = '2004.01'
    config.vm.hostname = 'mitm.vagrant.local'

    config.trigger.before [:provision, :up], type: :action do |trigger|
        trigger.info = "Ensuring directory for binaries exist"
        trigger.run = {
            path: "trigger_before.sh",
            :args => [ $mitm_verison ]
        }
    end

    config.trigger.after [:provision, :up], type: :action do |trigger|
        trigger.info = "Fetching compiled binaries from guest"
        trigger.run = {
            path: "trigger_after.sh",
            :args => [ $mitm_verison ]
        }
    end

    config.vm.provision "ansible_local" do |ansible|
        ansible.become = true
        ansible.verbose = true
        ansible.playbook = "provision.yaml"
        ansible.compatibility_mode = "2.0"
        ansible.extra_vars = {
            mitm_version: "#{$mitm_verison}",
            mitm_src_url: "https://github.com/mitmproxy/mitmproxy/archive/v#{$mitm_verison}.tar.gz"
        }
    end

    config.vm.provider :virtualbox do |v|
        v.linked_clone = true
        v.customize [
            'modifyvm', :id,
            '--natdnshostresolver1', 'on',
            '--natdnsproxy1', 'on',
            '--memory', $vm_memory,
            '--cpus', $vm_cpus
        ]
    end

end
