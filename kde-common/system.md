<img src='/usr/share/icons/midna/status/64/dialog-warning.svg' width=64>
<h3>Attention: KaOS system message</h3>

<h4>Calamares Password Weakness</h4>
KaOS systems installed by Calamares up to and including Calamares 3.1 (thus all KaOS installs) have a weaker password salt than they should. This weakness is important if an attacker has a way to obtain the password hash. The Calamares team believes that installed systems should be as secure as possible, and therefore considers this weakness important.

Users are advised to <b>reset their password</b> on installed systems by using the password utility, which will provide a stronger salt and hence a better password hash. This applies to all user accounts created during the installation of the system: the user’s own account and to the root account, if the root account has a password.

<h4>Weakness</h4>
During system installation, Calamares creates a regular user – for example, bob – and sets the password for that user. Often, Calamares also sets a password for the root user.

When setting the password, Calamares uses a predictable “salt”. This means that an attacker knows the salt for user bob, and also for user root. If the attacker can obtain the password hash (usually stored in /etc/shadow) then the knowledge of the salt can help the attacker prepare for a password cracking attempt.

<h4>Impact</h4>
This weakness does not weaken the password security for logins on a single system. It does weaken the password if an attacker can obtain the password hash through some other means.

The predictable salt also means that passwords on different machines may be hashed with the same salt. This means that all root accounts installed by Calamares share the same salt, and that an attacker who can obtain /etc/shadow from many installed machines can use the predictable salt to build a rainbow table for root in advance.

Users added to the system after installation do not have this password weakness. Users whose password has been changed with <code>passwd</code> do not have this password weakness.

<h4>Verification</h4>
To check if your installed system contains weakly-salted passwords, examine the <code>/etc/shadow</code> file for users with a salt equal to the username. Here is a way to use grep to check:

<code>sudo grep -E '^([_[:alnum:]]*):\$6\$\1' /etc/shadow<br>bob:$6$bob$dlQW5o8zM34dk2hQ:12345:0:99999:1:::</code>

Any user with a salt (the part following $6$ until the next $) equal to the username is weakly-salted.

<h4>Mitigation</h4>
Users are advised to reset their password on installed systems by using passwd:

<code>user@system$ passwd<br>Changing password for user.<br>(current) UNIX password:<br>Enter new UNIX password:<br>Retype new UNIX password:</code> 

When changing the password, the installed Linux system generates a new, random, salt for the password hash and the password is no longer affected by this weakness. Users may also want to reset the root password on the system if it is vulnerable, with sudo passwd.

Users are encouraged to change passwords twice for each affected account in order to overwrite the weakly-salted backup copy. 
