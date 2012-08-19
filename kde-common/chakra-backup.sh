#! /bin/bash
# GPL - jan.mette@berlin.de



###########################################################################
# SETUP
###########################################################################

TempFLDR=~/.backitup
Date=$(date +%g-%m-%d)

KDEdir=".kde4"


if [ -d "$TempFLDR" ] ; then
	echo "removing old temp dir $TempFLDR"
	rm -rf $TempFLDR
	echo "creating temp dir: $TempFLDR"
	mkdir $TempFLDR
else
	echo "creating temp dir: $TempFLDR"
	mkdir $TempFLDR
fi



###########################################################################
# WELCOME
###########################################################################

echo "welcome"
kdialog --dontagain minibackup:helloworld --msgbox "Welcome! \n\nThis is a simple backup script for all your personal data like mails, contacts, notes, appointments, application settings and so on...\n\nJust select what you want to backup and the target directory in the next steps." --title "miniBackup"



###########################################################################
# SELECT BACKUP SOURCES
###########################################################################

while true ; do
  echo "backup selection"
  backup_selection=$(kdialog --separate-output --checklist "Select the data you want to backup" personalSettings "Personal Data:" off addressbook "     Addressbook" off emails "     Emails and all account data" off places "     Places (in Dolphin & the file dialog)" off remoteview "     Network folders" off ssh "     SSH keys and configurations" off subversion "     Subversion configurations" off truecrypt "     TrueCrypt configurations" off wallet "     KWallet passwords" off blank "" off applicationSettings "Application Settings:" off akregator "     Akregator" off amarok "     Amarok" off kaddressbook "     KAddressBook" off kate "     Kate" off kdesrc "     kdesrc-build" off kgpg "     KGpg" off kjots "     KJots" off kmail "     KMail" off knotes "     KNotes" off konsole "     Konsole" off kontact "     Kontact" off kopete "     Kopete" off korganizer "     KOrganizer" off kwallet "     KWallet" off kwrite "     KWrite" off museek "     Museek" off opera "     Opera" off powerdevil "     PowerDevil" off skype "     Skype" off systemsettings "     System Settings" off --title "miniBackup" --geometry 300x300)

	  case $? in
		  1) exit ;;
		  0)
		    if [ -n "$backup_selection" ] ; then
		      for selec in $backup_selection; do
			if [[ "$selec" != "personalSettings" ]] && [[ "$selec" != "applicationSettings" ]] && [[ "$selec" != "blank" ]] ; then
			  found=true
			  break
			fi
		      done

		      if [ $found ] ; then
			break
		      fi
		    fi ;;
	  esac
done


###########################################################################
# SELECT TARGET DIR FOR BACKUP
###########################################################################

echo "select target dir"
StoreFLDR=$(kdialog --getexistingdirectory ~/ --title "Where should i store the backup?")

	case $? in
		1) exit ;;
		0) mkdir -p $StoreFLDR ; echo "" ;;
	esac



###########################################################################
# LETS START
###########################################################################

echo "lets start"
DBUSREF=`kdialog --progressbar "Starting backup ..." --title "miniBackup - working ..." 34`

qdbus $DBUSREF setLabelText "Creating temporary directories ..."
qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 1

mkdir -p $TempFLDR/$KDEdir
mkdir -p $TempFLDR/$KDEdir/share
mkdir -p $TempFLDR/$KDEdir/share/config
mkdir -p $TempFLDR/$KDEdir/share/apps
mkdir -p $TempFLDR/$KDEdir/share/config/kresources
mkdir -p $TempFLDR/.gnupg
mkdir -p $TempFLDR/.config
mkdir -p $TempFLDR/.local/share

for selection in $backup_selection; do

	if [ "$selection" = "emails" ] ; then
		echo $selection;
		qdbus $DBUSREF setLabelText "Copying email accounts ..."
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 2
		cp $HOME/$KDEdir/share/config/emaildefaults $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/mailtransports $TempFLDR/$KDEdir/share/config/

		qdbus $DBUSREF setLabelText "Copying email identities ..."
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 3
		cp $HOME/$KDEdir/share/config/emailidentities $TempFLDR/$KDEdir/share/config/

		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 4
		qdbus $DBUSREF setLabelText "Copying emails and account data ..."
		cp -r $HOME/$KDEdir/share/apps/kmail $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "addressbook" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 5
		qdbus $DBUSREF setLabelText "Copying addressbook ..."
		cp -r $HOME/$KDEdir/share/apps/kabc $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "wallet" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 6
		qdbus $DBUSREF setLabelText "Copying KWallet Data ..."
		cp -r $HOME/$KDEdir/share/apps/kwallet $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "ssh" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 7
		qdbus $DBUSREF setLabelText "Copying SSH Data ..."
		cp -r $HOME/.ssh $TempFLDR/

	elif [ "$selection" = "places" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 8
		qdbus $DBUSREF setLabelText "Copying Places Data ..."
		cp -r $HOME/.local/share/user-places* $TempFLDR/.local/share/

	elif [ "$selection" = "kgpg" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 9
		qdbus $DBUSREF setLabelText "Copying crypto settings and keys ..."
		cp $HOME/$KDEdir/share/config/kgpgrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/libkleopatrarc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/ksslcertificatemanager $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kgpg.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/.gnupg/* $TempFLDR/.gnupg/

	elif [ "$selection" = "akregator" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 10
		qdbus $DBUSREF setLabelText "Copying Akregator Data ..."
		cp $HOME/$KDEdir/share/config/kjotsrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kjots.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/akregator $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "kaddressbook" ] ; then
		echo $selection;
		qdbus $DBUSREF setLabelText "Copying KAddressbook settings ..."
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 11
		cp $HOME/$KDEdir/share/config/kaddressbookrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kaddressbook.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/config/kresources/contact $TempFLDR/$KDEdir/share/config/kresources/

	elif [ "$selection" = "kate" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 12
		qdbus $DBUSREF setLabelText "Copying Kate Data ..."
		cp $HOME/$KDEdir/share/config/katerc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kate.notifyrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/katepartpluginsrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/katepartscriptrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kateschemarc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/katesyntaxhighlightingrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/kate $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "kdesrc" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 13
		qdbus $DBUSREF setLabelText "Copying kdesrc-build Data ..."
		cp $HOME/.kdesrc-build $TempFLDR/

	elif [ "$selection" = "kjots" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 13
		qdbus $DBUSREF setLabelText "Copying KJots Data ..."
		cp $HOME/$KDEdir/share/config/kjotsrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kjots.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/kjots $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "kmail" ] ; then
		echo $selection;
		qdbus $DBUSREF setLabelText "Copying KMail settings ..."
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 14
		cp $HOME/$KDEdir/share/config/kmail.eventsrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kmail.notifyrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kmailrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kmailsnippetrc $TempFLDR/$KDEdir/share/config/

	elif [ "$selection" = "knotes" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 15
		qdbus $DBUSREF setLabelText "Copying Knotes Data ..."
		cp $HOME/$KDEdir/share/config/knotesrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/knotes.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/knotes $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "konsole" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 16
		qdbus $DBUSREF setLabelText "Copying Konsole Data ..."
		cp $HOME/$KDEdir/share/config/konsolerc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/konsole.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/konsole $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "kontact" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 17
		qdbus $DBUSREF setLabelText "Copying Kontact Data ..."
		cp $HOME/$KDEdir/share/config/kontactrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kontact_summaryrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kontact.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/kontact $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "kopete" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 18
		qdbus $DBUSREF setLabelText "Copying Kopete Data ..."
		cp $HOME/$KDEdir/share/config/kopeterc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kopete.notifyrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kopete.eventsrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/kopete $TempFLDR/$KDEdir/share/apps/
		cp -r $HOME/$KDEdir/share/apps/kopete_otr $TempFLDR/$KDEdir/share/apps/
		cp -r $HOME/$KDEdir/share/apps/kopeterichtexteditpart $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "korganizer" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 19
		qdbus $DBUSREF setLabelText "Copying Korganizer Data ..."
		cp $HOME/$KDEdir/share/config/korgacrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/korganizerrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/korganizer.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/korganizer $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "kwallet" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 20
		qdbus $DBUSREF setLabelText "Copying KWallet Data ..."
		cp $HOME/$KDEdir/share/config/kwalletrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kwallet.notifyrc $TempFLDR/$KDEdir/share/config/

	elif [ "$selection" = "kwrite" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 21
		qdbus $DBUSREF setLabelText "Copying KWrite Data ..."
		cp $HOME/$KDEdir/share/config/kwriterc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/kwrite.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/kwrite $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "powerdevil" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 22
		qdbus $DBUSREF setLabelText "Copying Powerdevil Data ..."
		cp $HOME/$KDEdir/share/config/powerdevilrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/powerdevil.notifyrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/powerdevilprofilesrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/powerdevil $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "systemsettings" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 23
		qdbus $DBUSREF setLabelText "Copying Systemsettings Data ..."
		cp $HOME/$KDEdir/share/config/systemsettingsrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/systemsettings.notifyrc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/systemsettings $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "akonadi" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 24
		qdbus $DBUSREF setLabelText "Copying Akonadi Data ..."
		cp -r $HOME/.config/akonadi $TempFLDR/.config/
		cp -r $HOME/.local/share/akonadi $TempFLDR/.local/share/

	elif [ "$selection" = "amarok" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 25
		qdbus $DBUSREF setLabelText "Copying Systemsettings Data ..."
		cp $HOME/$KDEdir/share/config/amarokrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/amarok-appletsrc $TempFLDR/$KDEdir/share/config/
		cp $HOME/$KDEdir/share/config/amarok_homerc $TempFLDR/$KDEdir/share/config/
		cp -r $HOME/$KDEdir/share/apps/amarok $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "remoteview" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 26
		qdbus $DBUSREF setLabelText "Copying remoteview Data ..."
		cp -r $HOME/$KDEdir/share/apps/remoteview $TempFLDR/$KDEdir/share/apps/

	elif [ "$selection" = "museek" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 26
		qdbus $DBUSREF setLabelText "Copying museek Data ..."
		cp -r $HOME/.museekd $TempFLDR/
		cp -r $HOME/.museeq $TempFLDR/

	elif [ "$selection" = "subversion" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 26
		qdbus $DBUSREF setLabelText "Copying museek Data ..."
		cp -r $HOME/.subversion $TempFLDR/

	elif [ "$selection" = "skype" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 26
		qdbus $DBUSREF setLabelText "Copying Skype Data ..."
		cp -r $HOME/.Skype $TempFLDR/

	elif [ "$selection" = "truecrypt" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 26
		qdbus $DBUSREF setLabelText "Copying TrueCrypt Data ..."
		cp -r $HOME/.TrueCrypt $TempFLDR/

	elif [ "$selection" = "opera" ] ; then
		echo $selection;
		qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 26
		qdbus $DBUSREF setLabelText "Copying Opera Data ..."
		cp -r $HOME/.opera $TempFLDR/
	fi
done

qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 26
qdbus $DBUSREF setLabelText "Cleaning paths ..."
pushd $TempFLDR/$KDEdir/share/config/
find ./ -type f -exec sed -i "s/\/.kdemod4/\/.kde4/g" {} \;
popd

qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 27
qdbus $DBUSREF setLabelText "Creating tarball ..."
cd $TempFLDR
sleep 1

qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 28
qdbus $DBUSREF setLabelText "Creating tarball ..."
tar cf backup.tar .

qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 29
qdbus $DBUSREF setLabelText "Checking bzip2 ..."
sleep 2

if [ -e "/usr/bin/pbzip2" ] ; then
	qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 30
	qdbus $DBUSREF setLabelText "Nice, you have pbzip2 installed :) ..."
	sleep 2
	qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 31
	qdbus $DBUSREF setLabelText "Compressing tarball with pbzip2 ..."
	pbzip2 -p2 -r backup.tar
else
	qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 30
	qdbus $DBUSREF setLabelText "Using standard bzip2 ..."
	sleep 2
	qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 31
	qdbus $DBUSREF setLabelText "Compressing tarball with bzip2 ..."
	bzip2 --best backup.tar
fi

qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 32
qdbus $DBUSREF setLabelText "Moving backup to destination ..."
mv backup.tar.bz2 $StoreFLDR/backup-$Date.tar.bz2

qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 33
qdbus $DBUSREF setLabelText "Cleaning up ..."
rm -rf $TempFLDR

qdbus $DBUSREF Set org.kde.kdialog.ProgressDialog value 34
qdbus $DBUSREF setLabelText "All done!"
sleep 2

qdbus $DBUSREF org.kde.kdialog.ProgressDialog.close

kdialog --dontagain minibackup:alldone --msgbox "All done! \n\nYour backup has been saved to \n\n$StoreFLDR/backup.$Date.tar.bz2 \n"

exit 0
