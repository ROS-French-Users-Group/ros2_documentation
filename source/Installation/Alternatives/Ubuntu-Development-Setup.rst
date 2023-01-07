.. _linux-latest:

.. redirect-from::

   Installation/Linux-Development-Setup
   Installation/Ubuntu-Development-Setup

Ubuntu (source)
===============

.. contents:: Table des matières
   :depth: 2
   :local:


Configuration requise
---------------------
Les plateformes cibles basées sur Debian pour  {DISTRO_TITLE_FULL} sont:

- Niveau 1: Ubuntu Linux - Jammy (22.04) 64-bit
- Niveau 3: Ubuntu Linux - Focal (20.04) 64-bit
- Niveau 3: Debian Linux - Bullseye (11) 64-bit


Les autres plateformes Linux supportées avec différents niveaux sont:

- Arch Linux, voir `instructions alternatives <https://wiki.archlinux.org/index.php/ROS#ROS_2>`__
- Fedora Linux, voir :doc:`instructions alternatives <Fedora-Development-Setup>`
- OpenEmbedded / webOS OSE, voir `instructions alternatives <https://github.com/ros/meta-ros/wiki/OpenEmbedded-Build-Instructions>`__

Comme défini dans  `REP 2000 <https://www.ros.org/reps/rep-2000.html>`_.

Installation du système
-----------------------

Spécifier la langue
^^^^^^^^^^^^^^^^^^^

.. include:: ../_Ubuntu-Set-Locale.rst

Ajouter le dépôt apt ROS 2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. include:: ../_Apt-Repositories.rst

Installer les outils de développement et ceux de ROS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Installation des paquets communs.

.. code-block:: bash

   sudo apt update && sudo apt install -y \
     python3-flake8-docstrings \
     python3-pip \
     python3-pytest-cov \
     ros-dev-tools

Installation des paquets suivant votre version d'Ubuntu.

.. tabs::

   .. group-tab:: Ubuntu 22.04 LTS et plus récent

      .. code-block:: console

         sudo apt install -y \
            python3-flake8-blind-except \
            python3-flake8-builtins \
            python3-flake8-class-newline \
            python3-flake8-comprehensions \
            python3-flake8-deprecated \
            python3-flake8-import-order \
            python3-flake8-quotes \
            python3-pytest-repeat \
            python3-pytest-rerunfailures

   .. group-tab:: Ubuntu 20.04 LTS

      .. code-block:: bash

         python3 -m pip install -U \
            flake8-blind-except \
            flake8-builtins \
            flake8-class-newline \
            flake8-comprehensions \
            flake8-deprecated \
            flake8-import-order \
            flake8-quotes \
            pytest-repeat \
            pytest-rerunfailures


.. _Rolling_linux-dev-get-ros2-code:

Obtenir le code ROS 2
---------------------

Il faut créer un espace de travail et cloner tous les dépôts:

.. code-block:: bash

   mkdir -p ~/ros2_{DISTRO}/src
   cd ~/ros2_{DISTRO}
   vcs import --input https://raw.githubusercontent.com/ros2/ros2/{REPOS_FILE_BRANCH}/ros2.repos src

.. _linux-development-setup-install-dependencies-using-rosdep:

Installer les dépendences en utilisant rosdep
---------------------------------------------

.. include:: ../_Apt-Upgrade-Admonition.rst

.. code-block:: bash

   sudo rosdep init
   rosdep update
   rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"

.. include:: ../_rosdep_Linux_Mint.rst

Installer des implémentations DDS additionnelles (optionel)
-----------------------------------------------------------

Si vous souhaitez utiliser un autre fournisseur de DDS ou de RTPS vendor en plus de la version par défaut, il est possible de trouver les instructions :doc:`ici <../DDS-Implementations>`.

Construire le code dans l'espace de travail
-------------------------------------------

Si vous avez déjà installé ROS 2 d'une autre façon (soit par des paquets Debians ou une distribution binaire), assurez vous que vous exécutez les commandes suivantes dans un nouvel environnement
où les autres installations n'ont pas été "sourcées".
Il faut également vous assurer que vous n'avez pas la ligne ``source /opt/ros/${ROS_DISTRO}/setup.bash`` dans votre fichier ``.bashrc``.
Vous pouvez vous assurez que ROS 2 n'a pas été sourcé avec la commande ``printenv | grep -i ROS``.
La sortie devrait être vide.

Plus d'informations sur l'utilisation d'un espace de travail ROS est disponible dans  :doc:`ce tutoriel <../../Tutorials/Beginner-Client-Libraries/Colcon-Tutorial>`.

.. code-block:: bash

   cd ~/ros2_{DISTRO}/
   colcon build --symlink-install

Note: si vous avez des problèmes pour compiler tous les exemples et que cela vous empêche d'obtenir une construction réussie, vous pouvez utiliser ``COLCON_IGNORE`` de la même manière que `CATKIN_IGNORE <https://github.com/ros-infrastructure/rep/blob/master/rep-0128.rst>`__ pour ignorer le sous arbre ou retirer le répertoire de l'espace de travail.
Prenons un exemple: vous souhaiteriez éviter d'installer la librairie OpenCV particulièrement lourde.
Il suffit d'exécuter ``touch COLCON_IGNORE`` dans le répertoire ``cam2image`` dans demo pour ne pas l'inclure dans le processus de construction.

Configuration de l'environnement
--------------------------------

Sourcer le script ```setup```
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Configurer votre environnement en sourçant le fichier suivant:

.. code-block:: bash

   # Remplacer ".bash" avec votre shell si vous n'utilisez pas bash
   # Les valeurs possibles sont: setup.bash, setup.sh, setup.zsh
   . ~/ros2_{DISTRO}/install/local_setup.bash

.. _talker-listener:

Quelques exemples
-----------------

Dans un terminal, il faut sourcer le fichier de configuration (setup) et lancer ensuite le programme C++ ``talker``\ :

.. code-block:: bash

   . ~/ros2_{DISTRO}/install/local_setup.bash
   ros2 run demo_nodes_cpp talker

Dans un autre terminal il faut également sourcer le fichier de configuration et ensuite exécuter le programme python ``listener``\ :

.. code-block:: bash

   . ~/ros2_{DISTRO}/install/local_setup.bash
   ros2 run demo_nodes_py listener

Vous devriez voir le ``talker`` dire qu'il publie (i.e., ``Publishing``) des messages et le ``listener`` dire qu'il entend
(i.e. ``I heard``) ces messages.
Cela permet de vérifier ques les APIs C++ et Python fonctionnent correctement.
Hourra !

Les étapes après l'installation
-------------------------------
Il faut ensuite lire :doc:`tutoriels et démonstrations <../../Tutorials>` pour configurer votre environnement, créer votre propre espace de travail et paquets, et apprendre les concepts ROS-2 essentiels.

Utiliser le pont ROS 1
----------------------
Le pont ROS 1 peut connecter des topics de ROS 1 à ROS 2 et vice-versa. Vous pouvez consulter la page de `documentation <https://github.com/ros2/ros1_bridge/blob/master/README.md>`__ pour des explications sur la construction et l'utilisation du pont ROS 1.

Les implémentations addtionnelles RMW implementations (optionel)
----------------------------------------------------------------
L'intergiciel par défaut qu'utilise ROS 2 est ``Fast DDS``, mais l'intergiciel (RMW) peut-être remplacé à l'exécution.
Voir le :doc:`guide <../../How-To-Guides/Working-with-multiple-RMW-implementations>` sur la façon de travailler
avec de multiple RMWs.

Compilateurs alternatifs
------------------------

Utiliser un compilateur différent de gcc pour compiler ROS 2 est facile. Si vous définissez les variables d'environnement ``CC`` et ``CXX`` sur des exécutables point vers un compilateur C et/ou C++ fonctionnel, respectivement, et que vous relancez la configuration de CMake (en utilisant ``--force-cmake-config`` ou en supprimant les packages que vous souhaitez recompilter), CMake 
se reconfigurera et utilisera le compilateur spécifié.

Clang
^^^^^

Pour configurer CMake de façon à ce qu'il détecte et utilise Clang:

.. code-block:: bash

   sudo apt install clang
   export CC=clang
   export CXX=clang++
   colcon build --cmake-force-configure

Mise à jour
-----------

Voir :doc:`../Maintaining-a-Source-Checkout` pour mettre à jour réguliérement votre installation source.

Dépannage
---------

Les techniques de dépannages peuvent être trouvées ici :ref:`here <linux-troubleshooting>`.

Déinstaller
-----------

1. Si vous avez installé votre espace de travail avec colcon comme indiqué ci-dessus, la \"désinstallation\" pourrait consister simplement à ouvrir un nouveau terminal et à ne pas rechercher le fichier ``setup`` de l'espace de travail. De cette façon, votre environnement se comportera comme s'il n'y avait pas d'installation {DISTRO_TITLE} sur votre système.

2. Si vous souhaitez également libérer de l'espace disque, vous pouvez effacer le répertoire de l'espace de travail entièrement avec:

   .. code-block:: bash

    rm -rf ~/ros2_{DISTRO}
