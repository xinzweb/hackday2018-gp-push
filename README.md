# Setup

Make sure you have minikube installed.

We also need `pwgen` to generate some random sha. 

On Ubuntu:
```
sudo apt install pwgen
```

On MacOS:
```
brew install pwgen
```

# Initialize

This will build first image used to be pushed by `./gp.sh`.

```
./init_gp.sh master
```

You have to provide a branch name to tell it which branch to build. It's always
good to start with `master` branch.

# Copy an updated file under `build/src/`

Just any file you want to change and make it into same directory structure as
the original `src/` directory.

# Push your patch to minikube

```
./gp.sh master
```

# To Push Binaries from different Repo

```
./init_gp.sh my_branch https://github.com/xinzweb/gpdb.git
./gp.sh my_branch
```
