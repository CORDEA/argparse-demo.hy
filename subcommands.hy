#!/usr/bin/env hy
;; Copyright 2018 Yoshihiro Tanaka
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;   http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;;
;; Author: Yoshihiro Tanaka <contact@cordea.jp>
;; date  : 2018-07-11

(require [hy.contrib.walk [let]])
(import [argparse [ArgumentParser]])

(defn init-parser []
  (setv parser (ArgumentParser :prog "PROG"))
  (let [subparsers (.add-subparsers parser)
        init (.add-parser subparsers "init")
        commit (.add-parser subparsers "commit")]
       (.add-argument init "dir")
       (.add-argument init "-q" "--quiet" :action "store_true" :help "quiet")
       (.add-argument init "--separate-git-dir" :action "store_true" :help "separate-git-dir")
       (.add-argument commit "--interactive" :action "store_true" :help "interactive")
       (.add-argument commit "-m" :help "message"))
  parser)

(defmain [&rest _]
  (setv parser (init-parser))
  (print (.parse-args parser)))
