## In the News:

* Jeremiah Snapp created a [chef-repo](https://github.com/jeremiahsnapp/chef-repo) and [wiki](https://github.com/jeremiahsnapp/chef-repo/wiki) on github that aim to Demonstrate the Power of Chef, Librarian and Vagrant.

* Bryan McLellan [@btmspox](http://twitter.com/btmspox) announced on the [chef mailing list](http://lists.opscode.com/sympa/arc/chef/2012-04/msg00323.html) the timeline for Chef 0.10.10.  Today, April 23, is the day that Opscode will review the remaining patches for Chef and "feature freeze."  The first release candidate should be out by the end of the week.

* Over on the ars technia site there was articla about a [$4,829-per-hour supercomputer built on Amazon cloud to fuel cancer research](http://arstechnica.com/business/news/2012/04/4829-per-hour-supercomputer-built-on-amazon-cloud-to-fuel-cancer-research.ars) - The article is about a 50,000 core supercomputer built on EC2.  (Was this actually built usin Chef?  there's no mention of that in the article).

* Ranjib Dey recently added an article to his blog titled ["Chef:: Maintaining the shape"](http://ranjib.posterous.com/chef-maintaining-the-shape) - It's a collection of 7 things that Ranjib is trying out to keep his chef code base in shape.

* One thing that can be easy to forget when working with Chef is the correct knife syntax for uploading a cookbook, role, data bag, or environment to the Chef server.  I wonder if there's a ticket for this in Opscode's Jira? Sometimes, I just knife would do what I mean.  Well, Maciej Pasternacki recently released a Knife plugin that will help! [knife-dwim](https://github.com/mpasternacki/knife-dwim) Just `gem install knife-dwim` and  use `knife dwim path/to/file` and the item will be uploaded to your Chef server correctly!

* Bryan Berry [@bryanwb](http://twitter.com/bryanwb) updated [chef-ark cookbook on github](https://github.com/bryanwb/chef-ark).  **Bryan - is this different than [ark](http://community.opscode.com/cookbooks/ark) on the community site?**

* Bryan Berry [@bryanwb](http://twitter.com/bryanwb) wrote an article on the data.fao.org blog titled ["Managing data.fao.org with Chef"](http://faodata.blogspot.it/2012/04/chef-testimonial-data.html)

## Cookbook Updates

### [ark](http://community.opscode.com/cookbooks/ark) v0.0.1 - [jtimberman](http://community.opscode.com/users/jtimberman)
 * Joshua Timberman [@jtimberman](http://twitter.com/jtimberman), Bryan Berry [@bryanwb](http://twitter.com/bryanwb)
 * new version w/ put, dump, cherry_pick, install, and build_with_make_install actions

### [mosh](http://community.opscode.com/cookbooks/mosh) v0.2.0 - [jtimberman](http://community.opscode.com/users/jtimberman)
 * Joshua Timberman
 * Installs/Configures mosh
 * apt cookbook as a dependency (LWRP is used in package recipe)
 * move bash resource above remote_file
 * 'tar' missing in url attribute
 * package dependencies for building from source
 * freebsd has a mosh package now, default to that

### [gem_installer](http://community.opscode.com/cookbooks/gem_installer) v0.1.1 - [chrisroberts](http://community.opscode.com/users/chrisroberts)
 * Chris Roberts
 * Simple cookbook for managing gem versions on a node.
 * Removes builtin BagConfig support
 * Allows gems to be specified in Array or Hash form

### [gitpaste](http://community.opscode.com/cookbooks/gitpaste) v0.0.3 - [chrisroberts](http://community.opscode.com/users/chrisroberts)
 * Installs and configures gitpaste pastebin app
 * GitPast is a GitHug Gist clone that allows you to deploy and create your own gist.github.com-like application. It is useful in an environment where you may not be able to use gist.github.com or alternatives.

### [chef_gem](http://community.opscode.com/cookbooks/chef_gem) v0.0.1 - [chrisroberts](http://community.opscode.com/users/chrisroberts)
 * Chirs Roberts
 * This is a temporary compat cookbook that provides the chef_gem resource to recipes on chef versions <= 0.10.8. The intended purpose is to allow proper omnibus usage of embedded gem set until the 0.10.10 release is officially provided.
### [nginx_simplecgi](http://community.opscode.com/cookbooks/nginx_simplecgi) v0.1.0 - [chrisroberts](http://community.opscode.com/users/chrisroberts)
 * Chirs Roberts
 * Provides SimpleCGI for NGINX

### [bag_config](http://community.opscode.com/cookbooks/bag_config) v2.0.0 - [chrisroberts](http://community.opscode.com/users/chrisroberts)
 * Chirs Roberts
 * Provides helpers for optional data bag configuration
 * Force hash type on encrypted bag items

### [web](http://community.opscode.com/cookbooks/web) v0.0.1 - [melezhik](http://community.opscode.com/users/melezhik)
 * Alexey Melezhik
 * light weight resource to deliver web application from tarball to your host

### [openvas](http://community.opscode.com/cookbooks/openvas) v0.0.30 - [jackl0phty](http://community.opscode.com/users/jackl0phty)
 * Gerald Hevener [@jackl0phty](http://twitter.com/jackl0phty)
 * Install and configure [OpenVAS](http://www.openvas.org/index.html) ( Open Vulenability Assessment System ); a fork of the [Nessus] (http://www.nessus.org/products/nessus) project.
 * This iniital release could use some help and Redhat support, why not help Gerald out?

### [perlbrew](http://community.opscode.com/cookbooks/perlbrew) v0.1.0 - [xdg](http://community.opscode.com/users/xdg)
 * David Golden [@xdg](http://twitter.com/xdg)
 * Installs perlbrew and provides resource/provider types for managing perls with perlbrew.  
 * To date, this cookbook has only been designed and tested on the Ubuntu and Debian platforms.

### [users_solo](http://community.opscode.com/cookbooks/users_solo) v1.0.2 - [rgaiser](http://community.opscode.com/users/rgaiser)
 * Roberto Gaiser [@rgaiser](http://twitter.com/rgaiser)
 * Creates users from a databag using chef-solo
 * To use data bags with chef-solo, you have to load them from a file in Chef 0.10.4 and higher
 * http://wiki.opscode.com/display/chef/Data+Bags#DataBags-UsingDataBagswithChefSolo

### [minitest-handler](http://community.opscode.com/cookbooks/minitest-handler) v0.0.5 - [btm](http://community.opscode.com/users/btm)
 * Bryan McLellan [@btmspox](http://twitter.com/btmspox)
 * Installs and configures minitest-chef-handler
 * use minitest-chef-handler gem
 * Remove old tests

### [skype](http://community.opscode.com/cookbooks/skype) v0.0.1 - [aruntomar](http://community.opscode.com/users/aruntomar)
 * Arun Tomar [@aruntomar](http://twitter.com/aruntomar)
 * This cookbook will install and configure skype on redhat & centos OS. 

### [campfire](http://community.opscode.com/cookbooks/campfire) v0.0.3 - [cwjohnston](http://community.opscode.com/users/cwjohnston)
  * Cameron Johnston [@cwjohnston](http://twitter.com/cwjohnston)
  * This cookbook provides a campfire_msg resource, making it easier for chef recipies to play sounds or send messages to a chat room on the 37signals Campfire service. [https://github.com/cwjohnston/chef-campfire](https://github.com/cwjohnston/chef-campfire)

### Eric G. Wolfe's changes
By popular demand, Eric G. Wolfe [@atomic_penguin](http://twitter.com/atomic_penguin), has branched all of his community cookbooks into individual repos under his [Github account](http://github.com/atomic-penguin).

Cookbooks that were updated include:

* [nfs](http://community.opscode.com/cookbooks/nfs) v0.1.0
* [vnc](http://community.opscode.com/cookbooks/vnc) v0.0.1
* [iscsi](http://community.opscode.com/cookbooks/iscsi) v0.0.5
* [multipath](http://community.opscode.com/cookbooks/multipath) v0.0.5
* [oracle](http://community.opscode.com/cookbooks/oracle) v0.0.9
* [el-sysctl](http://community.opscode.com/cookbooks/el-sysctl) v0.0.6
* [gnome](http://community.opscode.com/cookbooks/gnome) v0.0.2
* [x-windows](http://community.opscode.com/cookbooks/x-windows) v0.0.2
* [snmp](http://community.opscode.com/cookbooks/snmp) v0.2.1 
* [yumrepo](http://community.opscode.com/cookbooks/yumrepo) v0.15.4 
* [dbench](http://community.opscode.com/cookbooks/dbench) v0.0.7
* [certificate](http://community.opscode.com/cookbooks/certificate) v0.0.4
* [krb5](http://community.opscode.com/cookbooks/krb5) v0.0.6

Do you have cookbook news that you'd like to share or feedback on the show?  Please drop a line to info@foodfightshow.org
 
