.. _MaintainingSource:

Maintenir une installation à partir des sources via git
=======================================================

.. ifconfig:: smv_current_version != '' and smv_current_version != 'rolling'

  .. note::

     Pour les instructions sur le maintien des sources à partir de git checkout sur la **dernière version de  développement** de ROS 2, il est conseillé de suivre
     `Maintenir une installation à partir des sources via git checkout sur ROS 2 Rolling <../../rolling/Installation/Maintaining-a-Source-Checkout.html>`__

.. contents::
   :depth: 2
   :local:

Si vous avez installé ROS 2 à partir des sources, des modifications ont peut-être été apportées au code source depuis le moment où vous l'avez extrait.
Pour garder votre extraction de source à jour, vous devrez périodiquement mettre à jour votre fichier ``ros2.repos``, télécharger les dernières sources et reconstruire votre espace de travail.


Mettre à jour votre liste de dépôts.
------------------------------------

Chaque version de ROS 2 inclut un fichier ``ros2.repos`` qui contient la liste des référentiels et leur version pour cette version.

Dernières branches de {DISTRO_TITLE}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Si vous souhaitez obtenir le dernier code pour ROS 2 {DISTRO_TITLE}, vous pouvez obtenir la liste des dépôts pertinents en exécutant:

.. tabs::

  .. group-tab:: Linux

    .. code-block:: bash

       cd ~/ros2_{DISTRO}
       mv -i ros2.repos ros2.repos.old
       wget https://raw.githubusercontent.com/ros2/ros2/{REPOS_FILE_BRANCH}/ros2.repos

  .. group-tab:: macOS

    .. code-block:: bash

       cd ~/ros2_{DISTRO}
       mv -i ros2.repos ros2.repos.old
       wget https://raw.githubusercontent.com/ros2/ros2/{REPOS_FILE_BRANCH}/ros2.repos

  .. group-tab:: Windows

    .. code-block:: bash

       # CMD
       cd \dev\ros2_{DISTRO}
       curl -sk https://raw.githubusercontent.com/ros2/ros2/{REPOS_FILE_BRANCH}/ros2.repos -o ros2.repos

       # PowerShell
       cd \dev\ros2_{DISTRO}
       curl https://raw.githubusercontent.com/ros2/ros2/{REPOS_FILE_BRANCH}/ros2.repos -o ros2.repos


Mettre à jour vos dépôts
------------------------
"Vous remarquerez que dans le fichier `ros2.repos <https://raw.githubusercontent.com/ros2/ros2/{REPOS_FILE_BRANCH}/ros2.repos>`__ , chaque 
dépôt est associé à une ``version`` qui pointe vers un identifiant de commit, une balise (tag) ou un nom de branche particulier. Il est possible que
ces versions fassent référence à de nouvelles balises/branches que votre copie locale ne reconnaîtra pas car elles ne sont pas à jour. 
Pour cette raison, vous devez mettre à jour les dépôts que vous avez déjà extraits avec la commande suivante :

.. code-block:: bash

   vcs custom --args remote update

Télécharger le nouveau code source
----------------------------------

Vous devriez maintenant pouvoir télécharger les sources associées à la nouvelle liste de dépôts avec:

.. tabs::

  .. group-tab:: Linux

    .. code-block:: bash

       vcs import src < ros2.repos
       vcs pull src

  .. group-tab:: macOS

    .. code-block:: bash

       vcs import src < ros2.repos
       vcs pull src

  .. group-tab:: Windows

    .. code-block:: bash

       # CMD
       vcs import src < ros2.repos
       vcs pull src

       # PowerShell
       vcs import --input ros2.repos src
       vcs pull src

Reconstruire votre espace de travail
------------------------------------

Maintenant que l'espace de travail est à jour avec les dernières sources, supprimez votre installation précédente et reconstruisez votre espace de travail avec, par exemple :

.. code-block:: bash

   colcon build --symlink-install

Inspecter vos sources
---------------------

Au cours de votre développement, vous avez peut-être dévié du dépôt d'origine au moment où vous avez importé la liste
des dépôts. Si vous souhaitez connaître les versions de l'ensemble des dépôts de votre espace de travail, vous pouvez exporter les informations
à l'aide de la commande suivante :


.. tabs::

  .. group-tab:: Linux

    .. code-block:: bash

       cd ~/ros2_{DISTRO}
       vcs export src > my_ros2.repos

  .. group-tab:: macOS

    .. code-block:: bash

       cd ~/ros2_{DISTRO}
       vcs export src > my_ros2.repos

  .. group-tab:: Windows

    .. code-block:: bash

       cd \dev\ros2_{DISTRO}
       vcs export src > my_ros2.repos

Ce fichier ``my_ros2.repos`` peut ensuite être partagé avec d'autres collaborateurs afin qu'ils puissent reproduire l'état des dépôts dans votre espace de travail.
