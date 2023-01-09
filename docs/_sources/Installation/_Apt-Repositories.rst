Vous devez ajouter le dépôt aps de ROS 2 à votre système:

Il faut d'abordd s'assurer que `Ubuntu Universe repository <https://help.ubuntu.com/community/Repositories/Ubuntu>`_ est activé.

.. code-block:: bash

   sudo apt install software-properties-common
   sudo add-apt-repository universe

Il faut ensuite ajouter la clef GPG de ROS 2 GPG avec apt.

.. code-block:: bash

   sudo apt update && sudo apt install curl
   sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

Il faut ensuite ajouter le dépôt à la liste des sources acceptées.

.. code-block:: bash

   echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
