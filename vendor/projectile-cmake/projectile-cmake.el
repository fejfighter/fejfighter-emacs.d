;;; projectile-cmake.el --- add some cmake smarts to projectile -*- lexical-binding: t -*-

;; Copyright © 2017 Jeff Walsh <fejfighter@gmail.com>

;; Author: Jeff Walsh <fejfighter@gmail.com>
;; URL: https://github.com/fejfighter/projectile-cmake
;; Keywords: project, convenience, cmake
;; Version: 0.1
;; Package-Requires: ((emacs "24.1") (pkg-info "0.4") (projectile "0.14"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; This library provides easy project management and navigation.  The
;; concept of a project is pretty basic - just a folder containing
;; special file.  Currently git, mercurial and bazaar repos are
;; considered projects by default.  If you want to mark a folder
;; manually as a project just create an empty .projectile file in
;; it.  See the README for more details.
;;
;;; Code:

(require 'projectile)

(defcustom projectile-cmake-compilation-dir-name "build"
  "The name of the folder used for compilation."
  :group 'projectile
  :type '(string))

;; (defcustom projectile-cmake-generator-type "Ninja"
;;   "The generator used."
;;   :group 'projectile
;;   :type '(choice
;;           (const :tag "Ninja" nil)
;;           (const :tag "Makefile" file-remote-p)
;;           function)
;;   :package-version '(projectile . "0.13.0"))


(defun projectile-cmake-compilation-path ()
  "The Path the build directory."
  (message (bound-and-true-p projectile-project-root))
  (if (boundp 'projectile-compilation-dir)
      (projectile-compilation-dir)
    (concat projectile-project-root
	    projectile-cmake-compilation-dir-name)
    ))

(defun projectile-cmake-compdb-path ()
  "Return the path to the compdb file."
    (concat (projectile-cmake-compilation-path)
	    "/compile_commands.json"))

(projectile-register-project-type 'cmake '("CMakeLists.txt")
				  :compile (concat "cmake --build "
						   (projectile-cmake-compilation-path))
				  :test (concat "cmake --build "
						(projectile-cmake-compilation-path)))
(provide 'projectile-cmake)
;;; projectile-cmake.el ends here
