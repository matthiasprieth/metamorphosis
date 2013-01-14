Feedback
========


Rahmenbedingungen
------------------

ihr habt das ohne Input von MMA, mit bootstrap selber gemacht.
ist schon responsive.


Wie ich getestet habe
---------------

online + lokal


Ergebnis des Tests
--------------

funktioniert alles!

**Auftrag:** gratuliert euch gegenseitig, ihr seid super!

beim genaueren Hinsehen: ihr habt ein deploy-problem:

----

    metamorphosis.mediacube.at/current> ls -la public/
    -rw-rw-r--  1 deploy_metam deployers  728 Jan  8 22:26 404.html
    -rw-rw-r--  1 deploy_metam deployers  711 Jan  8 22:26 422.html
    -rw-rw-r--  1 deploy_metam deployers  643 Jan  8 22:26 500.html
    lrwxrwxrwx  1 deploy_metam deployers   59 Jan  8 22:26 assets -> metamorphosis.mediacube.at/shared/assets
    -rw-rw-r--  1 deploy_metam deployers    0 Jan  8 22:26 favicon.ico
    -rw-rw-r--  1 deploy_metam deployers  204 Jan  8 22:26 robots.txt
    lrwxrwxrwx  1 deploy_metam deployers   59 Jan  8 22:27 system -> metamorphosis.mediacube.at/shared/system
    drwxrwxr-x  5 deploy_metam deployers 4096 Jan  8 22:27 uploads

    metamorphosis.mediacube.at/current> ls -la public/uploads/
    drwxrwxr-x 3 deploy_metam deployers 4096 Jan  8 22:26 picture
    drwxrwxr-x 7 deploy_metam deployers 4096 Jan 11 12:30 tmp
    lrwxrwxrwx 1 deploy_metam deployers   67 Jan  8 22:27 uploads -> metamorphosis.mediacube.at/shared/public/uploads
    drwxrwxr-x 3 deploy_metam deployers 4096 Jan  8 22:26 user

    bjelline@spock metamorphosis.mediacube.at/current> ls -la metamorphosis.mediacube.at/shared/public/uploads/
    drwxr-xr-x 2 deploy_metam deployers 4096 Jan  7 16:50 .
    drwxr-xr-x 3 deploy_metam deployers 4096 Jan  7 16:50 ..

----


Datenbank
---------

im PicturesController finde ich:

        @picture.pic_likes = 0 if @picture.pic_likes.nil?
        @picture.pic_likes += 1

Bevor man so komplizierten Code schreibt sollte
man lieber einen default-Wert in der Datenbank setzen:

http://apidock.com/rails/ActiveRecord/ConnectionAdapters/SchemaStatements/change_column


**Auftrag**: findet alle Properties die Default-Werte brauchen,
schreibt eine Migration die diese Default-Werte setzt, vereinfacht
den code.


Controller
---------

im PicturesController finde ich:

    @picture = Picture.find(params[:id])
    @children = Picture.find(:all, :conditions => {:parent => @picture.id})

das geht auch einfacher:

    @picture.children

siehe Rails Guide 
http://guides.rubyonrails.org/association_basics.html#has_many-association-reference
unter "Methods Added by has_many"


**Auftrag:** Durchforstet den ganzen Code, verwendet diese Methoden wo geht!


Views
------

refactor app/views/pictures/index.html.erb (machen wir in der Code Review)

    <p><%= link_to Picture.find_by_id(picture.parent).user.username.split(' ').map {|w| w.capitalize }.join(' '),
                      user_path(Picture.find_by_id(picture.parent).user)  %> created this picture.</p>

**Auftrag:** alle views überprüfen, SQL, methoden die nur ein model betreffen 
in das model verlagern. find in den controller verlagern.


Git + Teamarbeit
---------------

Schaut schon sehr gut aus.
Um längere, aussagekräftigere Log-Messages
zu schreiben: 
-m weglassen, dann kommt ein editor in dem man
eine lange Meldung schreiben kann.

Bonus-Level
-----------

Nutzt die Refactoring-Phase um jeweils **vorher** Tests
für den zu ändernden Code zu schreiben.

