Soyez sûr que vous avez installé les ressources permettant de supporter le mode ``UTF-8``.
Si vous êtes dans un environnement minimal (comme un conteneur docker), l'environnement locale peut-être quelque chose d'aussi minimal que ``POSIX``.
ROS est testé avec les paramètres suivants. Toutefois, le système devrait fonctionner avec d'autres choix de langues UTF-8.

.. code-block:: bash

   locale  # check for UTF-8

   sudo apt update && sudo apt install locales
   sudo locale-gen en_US en_US.UTF-8
   sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
   export LANG=en_US.UTF-8

   locale  # verify settings
