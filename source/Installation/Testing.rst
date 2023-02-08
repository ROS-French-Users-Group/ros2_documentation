.. redirect-from::

   Installation/Prerelease-Testing

Tester avec des binaires de pré-version
=======================================

De nombreux packages ROS sont fournis sous forme de fichiers binaires pré-compilés.
Habituellement, vous obtiendrez la version publiée des binaires en suivant :doc:`../Installation`.
Il existe également des versions pré-publiées de binaires qui sont utiles pour les tests avant de faire une version officielle.
Cet article décrit plusieurs options si vous souhaitez essayer des versions pré-publiées des binaires ROS.

Dépot de test de Debian
-----------------------

Lorsque des packages sont publiés dans une distribution ROS (à l'aide de bloom), le buildfarm les construit dans des packages debian qui sont stockés temporairement dans le dépôt **building** apt.
Au fur et à mesure que les paquets dépendants sont reconstruits, un processus automatique synchronise périodiquement les packages dans **building** avec un référentiel secondaire appelé **ros-testing**.
**ros-testing** est conçu comme une zone de test où les développeurs et les utilisateurs à la pointe de la technologie peuvent effectuer des tests supplémentaires sur les packages, avant qu'ils ne soient synchronisés manuellement dans le référentiel ros public à partir duquel les utilisateurs installent généralement les paquets.

Environ toutes les deux semaines, le gestionnaire de publication de rosdistro synchronise manuellement le contenu de **ros-testing** dans le référentiel ROS **principal**.

Pour les systèmes d'exploitation basés sur Debian, vous pouvez installer des packages binaires à partir du dépôt **ros-testing**.

1. Assurez-vous d'avoir une installation ROS 2 fonctionnelle à partir des packages Debian (voir :doc:`../Installation`).

2. Modifiez (avec sudo) le fichier ``/etc/apt/sources.list.d/ros2-latest.list`` et remplacez ``ros2`` par ``ros2-testing``. Par exemple, sur Ubuntu Jammy, le contenu devrait ressembler à ceci:

   .. code-block:: sh

      # deb http://packages.ros.org/ros2/ubuntu jammy main
      deb http://packages.ros.org/ros2-testing/ubuntu jammy main

3. Mettez à jour l'index ``apt``:

   .. code-block:: sh

      sudo apt update

4. Vous pouvez désormais installer des packages individuels à partir du référentiel testing, par exemple:

   .. code-block:: sh

      sudo apt install ros-{DISTRO}-my-just-released-package

5. Vous pouvez également déplacer l'intégralité de votre installation ROS 2 vers le dépôt testing:

   .. code-block:: sh

      sudo apt dist-upgrade

6. Une fois que vous avez terminé les tests, vous pouvez revenir au dépôt normal en modifiant le contenu de ``/etc/apt/sources.list.d/ros2-latest.list``:

   .. code-block:: sh

      deb http://packages.ros.org/ros2/ubuntu jammy main
      # deb http://packages.ros.org/ros2-testing/ubuntu jammy main

   et faire une mise à jour et une mise à niveau:

   .. code-block:: sh

      sudo apt update
      sudo apt dist-upgrade

.. _Prerelease_binaries:

Enormes binaires
----------------

Pour les packages de base, nous exécutons des tâches d'empaquetage nocturnes pour Ubuntu Linux, RHEL et Windows.
Ces travaux d'empaquetage produisent des archives avec des binaires pré-construits qui peuvent être téléchargés et extraits sur votre système de fichiers.

1. Assurez-vous que toutes les dépendances sont installées conformément à la :doc:`dernière configuration de développement <Alternatives/Latest-Development-Setup>` pour votre plate-forme.

2. Allez sur https://ci.ros2.org/view/packaging/ et dans la liste sélectionnez le packaging correspondant à votre plateforme.

3. Sous le titre "Derniers artefacts réussis", vous devriez voir un lien de téléchargement (par exemple, pour Windows, ``ros2-package-windows-AMD64.zip``).

4. Téléchargez et extrayez l'archive dans votre système de fichiers.

5. Pour utiliser l'installation avec un binaire unique, sourcez le fichier ``setup.*`` qui se trouve à la racine de l'archive.

   .. tabs::

     .. group-tab:: Ubuntu Linux and RHEL

       .. code-block:: sh

          source path/to/extracted/archive/setup.bash

     .. group-tab:: Windows

       .. code-block:: sh

          call path\to\extracted\archive\setup.bat

Docker
------

Pour Ubuntu Linux, il existe également une image Docker nocturne basée sur l'archive nocturne Fat.

1. Extrayez l'image Docker:

   .. code-block:: sh

      docker pull osrf/ros2:nightly

2. Démarrez un conteneur interactif:

   .. code-block:: sh

      docker run -it osrf/ros2:nightly

Pour obtenir de l'aide sur l'exécution d'applications GUI dans Docker, consultez le tutoriel `User GUI's with Docker <https://wiki.ros.org/docker/Tutorials/GUI>`_ ou l'outil `rocker <https://github .com/osrf/rocker>`_.
