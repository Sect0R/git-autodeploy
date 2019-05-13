**Based on [https://github.com/logsol/Github-Auto-Deploy](https://github.com/logsol/Github-Auto-Deploy)**

### This is a small HTTP server written in python.
It allows you to have a version of your project installed, that will be updated automatically on each Github push/merge.

#### Setup on server
 1. install python
 2. Edit config file "gitdeploy.conf.json" - you can add unlimited repositories for one daemon
 3. start the server by typing "python gitdeploy.py"
 4. to run it as a daemon add **--daemon-mode** (Example: `python gitdeploy.py --daemon-mode`)

#### Setup on GitHub
 1. Go to a repository
 2. Open "Settings", "Webhooks"
 3. Click "Add webhook"
 4. Payload URL: the url of your machine + port (e.g. http://example.com:8001)
 5. Content type: application/json

#### How this works
When someone pushes changes into Github, it sends a json file to the service hook url.
It contains information about the repository that was updated.
All it really does is match the repository urls to your local repository paths in the config file,
Additionally it runs a deploy bash command that you can add to the config file optionally.
Make sure that you start the server as the user that is allowed to pull from the github repository.

#### Bash deploy examples
 1. Yii2 deployment script - autodeploy_yii2.sh
 2. Laravel 5 deployment script - autodeploy_laravel5.sh
 3. Deployment script for FE (Vue.js, AngularJS) - autodeploy_frontend.sh
