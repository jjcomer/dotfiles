{:user {:plugins [[lein-difftest "2.0.0"]
                  [lein-pprint "1.1.1"]
                  [lein-kibit "0.0.8"]
                  [lein-ancient "0.5.5"]
                  [jonase/eastwood "0.1.4"]
                  [lein-bin "0.3.4"]
                  [lein-licenses "0.1.1"]
                  [lein-environ "0.5.0"]
                  [refactor-nrepl "0.1.0"]
                  [cider/cider-nrepl "0.8.0-SNAPSHOT"]]
        :dependencies [[clj-stacktrace "0.2.8" :scope "runtime"]]
        :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly (deref new))))]
        :profiles {:cxengage {:env {:cx-manager-port "-1"
                                    :cx-log-level "dev"}}
                   :engine [:cxengage {:env {:cx-workers "1"
                                             :cx-nworkers "1"
                                             ;;:cx-topic "raw_events"
                                             ;;:cx-log-level "prod"
                                             }}]
                   :ap [:cxengage {:env {:cx-cassandra "10.0.2.176,10.0.3.46,10.0.4.254"
                                         :cx-port "8088"}}]
                   :auth [:cxengage {:env {:cx-port "8081"}}]
                   :platform [:cxengage {:env {:cx-port "8088"}}]
                   :augment [:cxengage {:env {}}]
                   :chatter [:cxengage {:env {:cx-events "http://localhost:8083"}}]
                   :rest [:cxengage {:env {:cx-port "8083"}}]
                   :generic [:cxengage {:env {:cx-port "8083"}}]
                   :echo [:cxengage {:env {;;:cx-producer-topics "raw_events"
                                           :cx-log-level "prod"}}]}
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
