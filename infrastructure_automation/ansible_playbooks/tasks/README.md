# ANSIBLE TASK COLLECTION

This is a taks collection ir order to perform individual, yet configurable (via params), actions. Extracting the task itself into this folder, it allows to keep a readable and manageable playbooks. 

## Collections

- **copy_files** - Copy files from your local to the desired machine. 
- **install_docker** - Install docker, docker compose and all of tis dependencies.
- **update_observer_files** - Update the observer instance files, with the correct values (observed instance address or ip)
- **run_containers** - Runs the given directory and docker compose file. Checks that all the containers are running as expected. 
