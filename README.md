# D3-monolith
The D3-monolith project is here to simplify the D3 project build and run processes.
## Prerequisites
1) Docker is installed
2) Yarn and nodejs are installed
3) You have `sudo` permissions
4) The following routing is written in `etc/hosts`:
```
127.0.0.1 d3-iroha
127.0.0.1 d3-iroha-postgres
127.0.0.1 d3-notary
127.0.0.1 d3-eth-node0
127.0.0.1 d3-btc-node0
127.0.0.1 d3-rmq
127.0.0.1 d3-brvs
127.0.0.1 d3-brvs-mongodb
```
## How to build
Run `sudo sh build.sh` to build the project. This process may take a while (up to 15 minutes).
## How to run
Run `sudo sh run.sh` to run the project. This process is slow as well. Don't hurry and wait a couple of minutes until all the components have started. You can observe the status of the process with `docker ps`. If all containers are running(not in `restart` phase), go to http://localhost:8080.  
It's important to note, that there is no need to build the project every time you want to run it. Build the project if your version of the project is outdated.
## How to stop
Type `Ctrl+c` in the terminal where `sudo sh run.sh` was started. Then run `sudo sh stop.sh`. It stops docker containers.
