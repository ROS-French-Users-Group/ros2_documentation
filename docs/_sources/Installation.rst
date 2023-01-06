.. _InstallationGuide:
.. _RollingInstall:

Installation
============

Options pour installer ROS 2 {DISTRO_TITLE_FULL}:

.. toctree::
   :hidden:
   :glob:

   Installation/Ubuntu-Install-Debians
   Installation/Windows-Install-Binary
   Installation/RHEL-Install-RPMs
   Installation/Alternatives
   Installation/Maintaining-a-Source-Checkout
   Installation/Testing
   Installation/DDS-Implementations

Paquets binaires
----------------

Les paquets binaires ne sont créés que les systèmes de niveau 1 (Tier 1) listés ici: `REP-2000 <https://www.ros.org/reps/rep-2000.html#rolling-ridley-june-2020-ongoing>`__.
Comme Rolling est une distribution de développement, cette liste peut être mise à jour à tout moment.
Si vous n'utilisez aucun de ces systèmes d'exploitation il est possible que vous ayez besoin de construire ROS-2 à partir des ou d'utiliser :doc:`une solution à partir de <How-To-Guides/Run-2-nodes-in-single-or-separate-docker-containers>` pour faire fonctionner ROS 2 sur votre ordinateur.

L'OSRF fournit des paquets binaires ROS 2 pour les systèmes suivants:

* Ubuntu Linux - Jammy Jellyfish (22.04)

  * :doc:`Debian packages <Installation/Ubuntu-Install-Debians>` (recommendé)
  * :doc:`"fat" archive <Installation/Alternatives/Ubuntu-Install-Binary>`

* RHEL 8 (RedHat Entreprise Linux)

  * :doc:`RPM packages <Installation/RHEL-Install-RPMs>` (recommended)
  * :doc:`"fat" archive <Installation/Alternatives/RHEL-Install-Binary>`

* :doc:`Windows (VS 2019) <Installation/Windows-Install-Binary>`


.. _building-from-source:

Compiler à partir des sources
-----------------------------

L'OSRF supporte la construction de ROS 2 à partir des sources pour les plateformes suivantes:


* :doc:`Ubuntu Linux <Installation/Alternatives/Ubuntu-Development-Setup>`
* :doc:`Windows <Installation/Alternatives/Windows-Development-Setup>`
* :doc:`RHEL <Installation/Alternatives/RHEL-Development-Setup>`
* :doc:`macOS <Installation/Alternatives/macOS-Development-Setup>`


Quelle installation devait vous choisir ?
-----------------------------------------

Installer à partir de paquets binaires ou à partir des sources devrait, dans les deux cas, fournir une installation complètement fonctionnelle de ROS-2.
Les différences entre les options dépend de ce que vous avez prévu de faire avec ROS 2.

Les **paquets binaires** sont pour une utilisation générique et fournissent une installation pré construite de ROS 2.
C'est particulièrement adapté aux personnes souhaitant plonger dans ROS-2 et l'utiliser tel quel.

Les utilisateurs Linux ont deux options pour installer les paquets binaires:

- Les paquets Debian
- Un "énorme" fichier d'archives

Installer à partir des paquets Debian est la méthode recommandée.
C'est le plus simple car cela installe les dépendances nécessaires automatiquement.
Il met également à jour les paquets en même temps que les mises à jour du système d'exploitation.

Cependant, vous avez besoin de l'accès root/super utilisateur pour installer les paquets Debian.
Si vous n'avez pas l'accès root, ce qui est souvent le cas pour les étudiants, l'"énorme" archive est le meilleur choix.

Les utilisateurs macOS et Windows qui souhaitent installer à partir de paquets binaires n'ont que l'option "énorme" archive
(Les paquets Debian sont uniquement disponibles sur Ubuntu/Debian).

**Construire à partir des sources** est destiné aux développeurs qui cherchent à modifier ou enlever explicitement des parties de la base de ROS 2.
C'est également recommandé pour les plateformes qui n'ont pas de paquets binaires.
Construire à partir des sources vous permet également d'installer les dernières versions de  ROS 2.

Contributeur au coeur de ROS 2 ?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Si vous avez prévu de contribuer directement aux paquets essentiels de ROS 2, il est possible d'installer les :doc:`derniers développements à partir des sources <Installation/Alternatives/Latest-Development-Setup>` qui ont les mêmes instructions d'installation que la :ref:`distribution Rolling <rolling_distribution>`.
