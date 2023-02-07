Windows (binaire)
=================

.. contents:: Table des matières
   :depth: 2
   :local:

Cette page explique comment installer ROS 2 sur Windows à partir d'un paquet binaire pré-construit.

.. note::

    Le binaire pré-construit n'inclut pas tous les paquets ROS 2.
    Tous les paquets de la `variante de base ROS <https://ros.org/reps/rep-2001.html#ros-base>`_ sont inclus, et seul un sous-ensemble de paquets de la `variante de bureau ROS <https://ros.org/reps/rep-2001.html#desktop-variants>`_ sont inclus.
    La liste exacte des packages est décrite par les référentiels répertoriés dans `ce fichier ros2.repos <https://github.com/ros2/ros2/blob/rolling/ros2.repos>`_.


Configuration requise
---------------------

Seul Windows 10 est pris en charge.

.. _windows-install-binary-installing-prerequisites:

.. include:: _Windows-Install-Prerequisites.rst

Téléchargement de ROS 2
-----------------------

Les versions binaires de {DISTRO_TITLE_FULL} ne sont pas fournies.
Au lieu de cela, vous pouvez télécharger tous les soirs :ref:`binaries prerelease <Prerelease_binaries>`.

* Téléchargez le dernier package pour Windows, par exemple, ``ros2-package-windows-AMD64.zip``.

.. note::

    Il peut y avoir plus d'une option de téléchargement binaire qui peut entraîner une différence de nom de fichier.

.. note::

    Pour installer des bibliothèques de débogage pour ROS 2, voir `Suppléments pour le débogage`_.
    Continuez ensuite en téléchargeant ``ros2-package-windows-debug-AMD64.zip``.

* Décompressez le fichier zip quelque part (nous supposerons ``C:\dev\ros2_{DISTRO}``\ ).

Configuration de l'environnement
--------------------------------

Démarrez un shell de commande et sourcez le fichier de configuration ROS 2 pour configurer l'espace de travail:

.. code-block:: bash

   call C:\dev\ros2_{DISTRO}\local_setup.bat

Il est normal que la commande précédente, si rien d'autre ne s'est mal passé, affiche "Le système ne peut pas trouver le chemin spécifié". exactement une fois.

Essayez quelques exemples
-------------------------

Dans un shell de commande, configurez l'environnement ROS 2 comme décrit ci-dessus, puis exécutez un ``talker`` C++\ :

.. code-block:: bash

   ros2 run demo_nodes_cpp talker

Démarrez un autre shell de commande et exécutez un ``listener`` Python\ :

.. code-block:: bash

   ros2 run demo_nodes_py listener

Vous devriez voir le ``talker`` dire ``Publishing`` (qu'il publie des messages) et le ``listener`` dire ``I heard`` ces messages.
Cela permet de vérifier que les API C++ et Python fonctionnent correctement.
Hourra!


Etapes après l'installation
---------------------------
Continuez avec les :doc:`tutoriels et démos <../../Tutorials>` pour configurer votre environnement, créer votre propre espace de travail et vos paquets, et apprendre les concepts de base de ROS 2.


Implémentations RMW supplémentaires (facultatif)
------------------------------------------------
Le middleware par défaut utilisé par ROS 2 est ``Fast DDS``, mais le middleware (RMW) peut être remplacé au moment de l'exécution.
Consultez le :doc:`guide <../How-To-Guides/Working-with-multiple-RMW-implementations>` pour savoir comment travailler avec plusieurs RMW.

Dépannage
---------

Les techniques de dépannage peuvent être trouvées :ref:`ici <windows-troubleshooting>`.


Déinstaller
-----------

1. Si vous avez installé votre espace de travail avec colcon comme indiqué ci-dessus, la "désinstallation" pourrait consister simplement à ouvrir un nouveau terminal et à ne pas rechercher le fichier ``setup`` de l'espace de travail.
   De cette façon, votre environnement se comportera comme s'il n'y avait pas d'installation {DISTRO_TITLE} sur votre système.

2. Si vous essayez également de libérer de l'espace, vous pouvez supprimer tout le répertoire de l'espace de travail avec:

   .. code-block:: bash

    rmdir /s /q \ros2_{DISTRO}

Suppléments pour le débogage
----------------------------

Pour télécharger les bibliothèques de débogage de ROS 2, vous devez télécharger ``ros2-{DISTRO}-*-windows-debug-AMD64.zip``. Veuillez noter que les bibliothèques de débogage nécessitent une configuration
supplémentaire pour fonctionner comme indiqué ci-dessous.

L'installation de Python peut nécessiter une modification pour activer les symboles de débogage et les binaires de débogage:

* Effectuez une recherche dans la **Barre de recherche** de Windows et ouvrez **Applications et fonctionnalités**.
* Recherchez la version Python installée.

* Cliquez sur Modifier.

      .. image:: images/python_installation_modify.png
         :width: 500 px

* Cliquez sur Suivant pour accéder aux **Options avancées**.

      .. image:: images/python_installation_next.png
         :width: 500 px

* Assurez-vous que **Télécharger les symboles de débogage** et **Télécharger les fichiers binaires de débogage** sont cochés.

      .. image:: images/python_installation_enable_debug.png
         :width: 500 px

* Cliquez sur Installer.

(Alternative) Installation de ROS 2 Build à partir de aka.ms/ros
----------------------------------------------------------------

Le projet https://aka.ms/ros héberge les builds ROS 2 et fournit des instantanés de version.
Cette section explique comment installer ROS 2 à partir de ce canal.


Installer les versions de ROS 2 construits
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dans une invite de commandes pour administrateur, exécutez les commandes suivantes.


.. code-block:: bash

   mkdir c:\opt\chocolatey
   set PYTHONNOUSERSITE=1
   set ChocolateyInstall=c:\opt\chocolatey
   choco source add -n=ros-win -s="https://aka.ms/ros/public" --priority=1
   choco upgrade ros-foxy-desktop -y --execution-timeout=0

Configuration de l'environnement
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Démarrez une invite de commande administrative et sourcez le fichier de configuration ROS 2 pour configurer l'espace de travail:


.. code-block:: bash

   call C:\opt\ros\foxy\x64\local_setup.bat

Etre à jour
^^^^^^^^^^^^^^^^

Pour vous tenir au courant des dernières versions, exécutez:

.. code-block:: bash

   set ChocolateyInstall=c:\opt\chocolatey
   choco upgrade all -y --execution-timeout=0

Désinstaller
^^^^^^^^^^^^

Si vous souhaitez supprimer complètement l'environnement téléchargé ci-dessus, exécutez cette commande:


.. code-block:: bash

   rmdir /s /q C:\opt\
