{:user {:plugins [[lein-kibit "0.0.8"]
                  [lein-ancient "0.6.0"]
                  [jonase/eastwood "0.2.1"]
                  [lein-environ "1.0.0"]
                  [refactor-nrepl "0.2.2"]
                  [codox "0.8.10"]
                  [cider/cider-nrepl "0.9.0-SNAPSHOT"]
                  [lein-exec "0.3.4"]
                  [test2junit "1.1.0"]]
        :dependencies [[clj-stacktrace "0.2.8" :scope "runtime"]]
        :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly (deref new))))]
        :profiles {:cxengage {:env {:cx-manager-port "-1"
                                    :cx-log-level "dev"}}
                   :engine [:cxengage {:env {:cx-workers "1"
                                             :cx-nworkers "1"}}]
                   :api [:cxengage {:env {:cx-port "8082"}}]
                   :auth [:cxengage {:env {:cx-port "8081"}}]
                   :platform [:cxengage {:env {:cx-port "8088"
                                               :cx-multiverse "dev;localhost:2181"}}]
                   :augment [:cxengage {:env {}}]
                   :chatter [:cxengage {:env {:cx-events "http://localhost:8083"}}]
                   :rest [:cxengage {:env {:cx-port "8083"
                                           :cx-stream-port "8883"}}]
                   :generic [:cxengage {:env {:cx-port "8086"
                                              :cx-stream-port "8886"}}]
                   :echo [:cxengage {:env {;;:cx-producer-topics "raw_events"
                                           :cx-log-level "dev"}}]}
        :aliases {"ccheck" ^{:doc "Clean and check the source"}
                  ["do" ["clean"] ["check"]]
                  "cinstall" ^{:doc "Clean and install locally"}
                  ["do" ["clean"] ["install"]]
                  "start" ^{:doc "Start a CxEngage Service"}
                  ["with-profile" :project/start-profile "trampoline" "run" "--" "--developer"]
                  "42start" ^{:doc "Start a CxEngage Service"}
                  ["trampoline" "run" "--" "-i"]
                  "sancient" ^{:doc "Check all deps including snapshots"}
                  ["ancient" ":allow-all"]}}}
