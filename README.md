Menu.sh:

To test on chromebook:
bash menu.sh

To test on linux/macOS:
docker build -t bash . 
docker run -it bash bash
then bash /menu.sh
because running 'docker run bash' often don't work.

