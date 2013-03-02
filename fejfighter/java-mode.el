;(setq java-mode-hook

(require 'cedet-java)
(require 'cedet-android)

(semantic-load-enable-gaudy-code-helpers)

'(cedet-java-jdk-root "/usr/lib/jvm/java-7-openjdk/")

(setq cedet-android-sdk-root "/opt/homebrew/Cellar/android-sdk/r20.0.3")
(setq cedet-android-sdk-jar "/opt/homebrew/Cellar/android-sdk/r20.0.3/platforms/android-4.1.2/android.jar")
(setq cedet-android-current-version "4.1.2")

'(semanticdb-javap-classpath '("/usr/lib/jvm/java-7-openjdk/jre/lib/rt.jar"))



'(cedet-java-command "java")
'(cedet-javap-command "javap")


(require 'flymake)
(add-hook 'java-mode-hook 'flymake-mode-on)

(defun my-java-flymake-init ()
  (list "javac" (list (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-with-folder-structure))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.java$" my-java-flymake-init flymake-simple-cleanup))


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
