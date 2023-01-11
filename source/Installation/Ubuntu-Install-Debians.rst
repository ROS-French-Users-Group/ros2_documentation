.. redirect-from::

   Installation/Linux-Install-Debians

Ubuntu (Debian)
===============

.. contents:: Table des matières
   :depth: 2
   :local:

Les paquets Debian de ROS 2 {DISTRO_TITLE_FULL} sont disponibles pour Ubuntu Jammy.
La distribution continue Ridley change de plateforme cible de temps en temps lorsque de nouvelles plateformes sont choisies pour le développement.
Les plateformes cibles sont définies dans la `REP 2000 <https://github.com/ros-infrastructure/rep/blob/master/rep-2000.rst>`__
La plupart des utilisateurs souhaitent utiliser une distribution ROS stable.

Ressources
----------

* Statut de la page:

  * ROS 2 {DISTRO_TITLE} (Ubuntu Jammy): `amd64 <http://repo.ros2.org/status_page/ros_{DISTRO}_default.html>`__\ , `arm64 <http://repo.ros2.org/status_page/ros_{DISTRO}_ujv8.html>`__
* `Instance de Jenkins <http://build.ros2.org/>`__
* `Dépôts <http://repo.ros2.org>`__


Configurer la langue
--------------------

.. include:: _Ubuntu-Set-Locale.rst

.. _linux-install-debians-setup-sources:

Configurer les sources des dépôts apt
-------------------------------------

.. include:: _Apt-Repositories.rst

.. _linux-install-debians-install-ros-2-packages:

Installer les paquets ROS 2
---------------------------

Mettre à jour votre cache des dépôts apt après avoir configurer les sources des dépôts apt.

.. code-block:: bash

   sudo apt update

.. include:: _Apt-Upgrade-Admonition.rst

.. warning::

   A cause de mise à jour anticipées d'Ubuntu 22.04 il est important que les paquets dépendants de  ``systemd`` et ``udev`` soient mis à jour avant d'installer ROS 2.
   L'installation des dépendances de ROS 2 sur un système fraîchement installé sans mise à jour peut déclencher la **suppression de paquets systèmes critiques**.

   Les pages `ros2/ros2#1272 <https://github.com/ros2/ros2/issues/1272>`_ et `Launchpad #1974196 <https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1974196>`_ contiennent plus d'informations.

L'installation Desktop est recommandée car elle fournit: ROS, RViz, demos, tutorials. Pour l'effectuer:

.. code-block:: bash

   sudo apt install ros-{DISTRO}-desktop

L'installation ROS-Base Install n'installe que l'essentiel: les bibliothèques de communication, les paquets de messages , les outils de commande en ligne.

Pas d'outils graphiques pour les interfaces utilisateurs.

.. code-block:: bash

   sudo apt install ros-{DISTRO}-ros-base

Les outils de développements: Compilateurs et les autres outils pour construire des paquets ROS

.. code-block:: bash

   sudo apt install ros-dev-tools

La configuration de l'environnement
-----------------------------------

Sourcer le script de configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pour configurer votre environnement il faut source le script suivant:

.. code-block:: bash

   # Remplacez ".bash" avec votre shell si vous n'utilisez pas bash
   # Les valeurs possibles sont: setup.bash, setup.sh, setup.zsh
   source /opt/ros/{DISTRO}/setup.bash

Essayer quelques exemples
-------------------------

Talker-listener
^^^^^^^^^^^^^^^

Si vous avez installé ``ros-{DISTRO}-desktop`` comme décrit ci-dessus vous pouvez essayer certains exemples.

Dans un terminal, il faut sourcer le fichier de configuration et exécuter le programme C++ ``talker``\ :

.. code-block:: bash

   source /opt/ros/{DISTRO}/setup.bash
   ros2 run demo_nodes_cpp talker

Dans un autre terminal il faut sourcer le fichier de configuration et exécuter le programme Python ``listener``\ :

.. code-block:: bash

   source /opt/ros/{DISTRO}/setup.bash
   ros2 run demo_nodes_py listener

Vous devriez voir le ``talker`` dire qu'il publie (i.e., ``Publishing``) des messages et le ``listener`` dire qu'il entend
(i.e. ``I heard``) ces messages.
Cela permet de vérifier que les APIs C++ et Python fonctionnent correctement.
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

Dépannage
---------

Les techniques de dépannages peuvent être trouvées :ref:`ici <linux-troubleshooting>`.

Dé-installer
------------

Si vous devez dé-installer ROS 2 ou basculer sur une installation basée source alors que vous avez déjà
fait une installation à partir des binaires, vous pouvez exécuter la commande suivante:

.. code-block:: bash

  sudo apt remove ~nros-{DISTRO}-* && sudo apt autoremove

Vous pouvez également souhaiter enlever le répertoire:

.. code-block:: bash

  sudo rm /etc/apt/sources.list.d/ros2.list
  sudo apt update
  sudo apt autoremove
  # Il est préférable de mettre à jour les paquets cachés par l'installation de ROS 2.
  sudo apt upgrade
