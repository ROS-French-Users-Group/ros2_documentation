RHEL (RPM)
==========

.. contents:: Table des matières
   :depth: 2
   :local:

Les packages RPM pour ROS 2 {DISTRO_TITLE_FULL} sont actuellement disponibles pour RHEL 8. La distribution Rolling Ridley changera de plates-formes cibles
de temps à autre à mesure que de nouvelles plates-formes seront sélectionnées pour le développement. Les plateformes cibles sont définies dans `REP 2000 <https://github.com/ros-infrastructure/rep/blob/master/rep-2000.rst>`__
La plupart des gens voudront utiliser une distribution ROS stable.


Ressources
----------

* Page d'état:

  * ROS 2 {DISTRO_TITLE} (RHEL 8): `amd64 <http://repo.ros2.org/status_page/ros_{DISTRO}_rhel.html>`__
* `Instance Jenkins <http://build.ros2.org/>`__
* `Dépôts <http://repo.ros2.org>`__


Mettre les variables locales
----------------------------

.. include:: _RHEL-Set-Locale.rst

.. _rhel-install-rpms-setup-sources:

Configuration pour les Sources
------------------------------

Vous devrez activer les dépôts EPEL et le dépôt PowerTools :

.. code-block:: bash

   sudo dnf install 'dnf-command(config-manager)' epel-release -y
   sudo dnf config-manager --set-enabled powertools

.. note:: Cette étape peut être légèrement différente selon la distribution que vous utilisez. Consultez la documentation EPEL : https://docs.fedoraproject.org/en-US/epel/#_quickstart

Ensuite, téléchargez le fichier ROS 2 .repo :

.. code-block:: bash

   sudo dnf install curl
   sudo curl --output /etc/yum.repos.d/ros2.repo http://packages.ros.org/ros2/rhel/ros2.repo

Ensuite, mettez à jour votre cache de métadonnées.
DNF peut vous demander de vérifier la clé GPG, qui doit correspondre à l'emplacement ``https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc``.

.. code-block:: bash

   sudo dnf makecache

.. _rhel-install-rpms-install-ros-2-packages:

Installer les packages ROS 2
----------------------------

.. include:: _Dnf-Update-Admonition.rst

Installation bureau (recommandée) : ROS, RViz, démos, didacticiels.

.. code-block:: bash

   sudo dnf install ros-{DISTRO}-desktop

Installation ROS-Base (Bare Bones) : bibliothèques de communication, paquets de messages, outils en ligne de commande. Aucun outil graphique.

.. code-block:: bash

   sudo dnf install ros-{DISTRO}-ros-base

Configuration de l'environnement
--------------------------------

Sourcer le script d'installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Configurez votre environnement en sourcant le fichier suivant.

.. code-block:: bash

   # Remplacez ".bash" avec votre shell si vous n'utilisez pas bash
   # Les valeurs possibles sont: setup.bash, setup.sh, setup.zsh
   source /opt/ros/{DISTRO}/setup.bash

Essayez quelques exemples
-------------------------

Si vous avez installé ``ros-{DISTRO}-desktop`` ci-dessus, vous pouvez essayer quelques exemples.

Dans un terminal, sourcez le fichier de configuration, puis exécutez un ``talker``\ C++ :

.. code-block:: bash

   source /opt/ros/{DISTRO}/setup.bash
   ros2 run demo_nodes_cpp talker

Dans un autre terminal, sourcez le fichier de configuration, puis exécutez un Python ``listener``\ :

.. code-block:: bash

   source /opt/ros/{DISTRO}/setup.bash
   ros2 run demo_nodes_py listener

Vous devriez voir le ``talker`` dire qu'il ``publie`` des messages et le ``listener`` dire ``I heard`` ces messages. Cela vérifie que les API C++ et Python fonctionnent correctement.
Hourra !

Prochaines étapes après l'installation
--------------------------------------
Continuez avec les :doc:`tutoriels et démos <../../Tutorials>` pour configurer votre environnement, créer votre propre espace de travail et vos paquets, et apprendre les concepts de base de ROS 2.

Implémentations RMW supplémentaires (facultatif)
------------------------------------------------
Le middleware par défaut utilisé par ROS 2 est ``Fast DDS``, mais le middleware (RMW) peut être remplacé au moment de l'exécution. Consultez le :doc:`guide <../How-To-Guides/Working-with-multiple-RMW-implementations>`
pour savoir comment travailler avec plusieurs RMW.

Dépannage
---------
Les techniques de dépannage peuvent être trouvées :doc:`ici <../How-To-Guides/Installation-Troubleshooting>`.

Déinstaller
-----------

Si vous devez désinstaller ROS 2 ou passer à une installation basée sur les sources une fois que vous avez déjà installé à partir de fichiers binaires, exécutez la commande suivante:

.. code-block:: bash

  sudo dnf remove ros-{DISTRO}-*
