# ANSIBLE PLAYBOOKS

In this folder there are all the playbooks used to provision the created instances, so all of them has the same packages and software installed on it. 

## Playbooks 

For now, there are only two different playbooks:

* **observed_machine.yaml** - All the steps needed to configure and spin up the containers to be monitorized.
* **observer_machine.yaml** - All the steps needed to configure and spin up prometheus and grafana.

## Requiremets

In order to tun this playbooks you just need to have ansible. All it's dependencies are stored in the [requirements file](./requirements.yaml) and will be installed automatically in case dont have it.