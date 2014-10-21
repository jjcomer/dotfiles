{:user {:plugins [[lein-difftest "2.0.0"]
                  [lein-pprint "1.1.1"]
                  [lein-kibit "0.0.8"]
                  [lein-ancient "0.5.5"]
                  [lein-bin "0.3.4"]
                  [lein-licenses "0.1.1"]
                  [cider/cider-nrepl "0.8.0-SNAPSHOT"]]
        :dependencies [[clj-stacktrace "0.2.7" :scope "runtime"]]
        :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly (deref new))))]
        :aliases {"ccheck" ^{:doc "Clean and check the source"}
                  ["do" ["clean"] ["check"]]
                  "start" ^{:doc "Start a CxEngage Service"}
                  ["trampoline" "run" "-i"]
                  "sancient" ^{:doc "Upgrade all deps to latest snapshot"}
                  ["ancient" "upgrade" ":allow-all"]}}}
