
#########################################################
Vagrant.configure(2) do |config|
    config.vm.box = "./focal.box"
    config.vm.boot_timeout = 700
    config.vm.box_check_update = false
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "all.yml"
    end

    config.vm.define "domain" do |domain|
        domain.vm.network "forwarded_port", guest: 80, host: 8080
        domain.vm.network "forwarded_port", guest: 22, host: 2220, id: "ssh"
        domain.vm.hostname = "domain"  
        domain.vm.provider "virtualbox" do |vb|
            vb.name = "domain"
            vb.memory = 1200
            vb.cpus = 1
        end
    end

  
    config.vm.define "web" do |web|
        web.vm.network "forwarded_port", guest: 80, host: 8081
        web.vm.network "forwarded_port", guest: 22, host: 2221, id: "ssh"
        web.vm.hostname = "web"  
        web.vm.provider "virtualbox" do |vb|
            vb.name = "web"
            vb.memory = 1100
            vb.cpus = 1
        end
    end

    config.vm.define "zabbix" do |zabbix|
        zabbix.vm.network "forwarded_port", guest: 80, host: 8082
        zabbix.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"
        zabbix.vm.hostname = "zabbix"  
        zabbix.vm.provider "virtualbox" do |vb|
            vb.name = "zabbix"
            vb.memory = 1000
            vb.cpus = 1
        end
    end
end